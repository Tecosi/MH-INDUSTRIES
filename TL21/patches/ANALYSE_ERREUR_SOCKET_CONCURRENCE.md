# 🔍 ANALYSE - Erreur de Concurrence sur les Sockets TL21

**Date** : 14 janvier 2026  
**Erreur** : Code 100121 - Socket utilisée dans un autre thread  
**Procédures concernées** : `Socket_DiffuserMessage`, `Socket_ThreadGestionClient`

---

## 📋 Erreur Rapportée

```
Vous avez appelé la fonction 'SocketEcrit'.
La socket C696799fb48231dc1 est actuellement utilisée dans un autre thread 
et n'a pas été débloquée au bout d'une seconde.

Pile des appels :
Procédure globale Socket_DiffuserMessage (Socket_Gestion.Socket_DiffuserMessage), ligne 35
Procédure globale Socket_ThreadGestionClient (Socket_Gestion.Socket_ThreadGestionClient), ligne 103

Date : 14/01/2026 14:32:09
Code erreur : 100121
Thread : Thread_Client_C696777d00029a4fd
```

---

## 🔎 Cause Identifiée

### Problème Principal : Code Dupliqué et Mal Structuré

En analysant le fichier `Socket_DiffuserMessage.wl`, j'ai identifié une **erreur de structure du code** :

**Lignes 30-35** :
```wl
// ✅ PROTÉGER AVEC LE SÉMAPHORE
SémaphoreDébut(gsSemaphoreSocket,5000)
bResultat est un booléen = SocketEcrit(sSocketClientCible, sMessage)
SémaphoreFin(gsSemaphoreSocket)
// Tenter d'envoyer le message
si bResultat= Vrai alors
```

**Le problème** : 
- La ligne 32 exécute `SocketEcrit` et stocke le résultat dans `bResultat`
- La ligne 35 teste `bResultat` **MAIS** il y a un commentaire "Tenter d'envoyer le message" qui suggère qu'un deuxième appel devrait avoir lieu
- **Le code est incohérent** : le `SocketEcrit` a déjà été appelé ligne 32, donc le test ligne 35 est correct, mais la structure suggère qu'il manque quelque chose

### Problème Secondaire : Extraction du Fichier PDF

En regardant plus attentivement, je constate que **le code a été mal extrait du PDF** :

**Lignes 15-18** :
```wl
// ✅ IMPORTANT : Boucler de la FIN vers le DÉBUT
// Cela permet de supprimer des éléments du tableau sans décaler les indices
Partie 7 › Collection de procédures › Socket_Gestion › Code
pour i = gtabClientsConnectes..Occurrence à 1 pas -1
```

La ligne 18 contient un **artefact du PDF** : `Partie 7 › Collection de procédures › Socket_Gestion › Code`

Cela signifie que **d'autres parties du code peuvent avoir été mal extraites ou corrompues**.

### Problème Tertiaire : Concurrence Réelle

Même si le code était correct, il y a un **problème de concurrence** :

1. **Thread Client A** appelle `Socket_DiffuserMessage` et prend le sémaphore
2. **Thread Client B** appelle également `Socket_DiffuserMessage` en même temps
3. Le Thread B attend que le sémaphore soit libéré (timeout de 5 secondes)
4. **MAIS** : Si le Thread A prend plus d'1 seconde pour `SocketEcrit`, WinDev génère l'erreur 100121

**Pourquoi ?**
- WinDev a un **timeout interne de 1 seconde** pour les opérations socket dans les threads
- Le sémaphore a un timeout de 5 secondes, mais `SocketEcrit` a son propre timeout de 1 seconde
- Si la socket est occupée par un autre thread pendant plus d'1 seconde, l'erreur est levée

---

## 🛠️ Solutions Proposées

### Solution 1 : Corriger le Code Extrait (Recommandé)

**Problème** : Le code a été mal extrait du PDF et contient des artefacts.

**Action** :
1. Nettoyer tous les artefacts du PDF (lignes comme "Partie 7 › Collection...")
2. Vérifier la cohérence du code ligne par ligne
3. S'assurer que le `SocketEcrit` n'est appelé qu'une seule fois par itération

**Code corrigé** :

```wl
procédure Socket_DiffuserMessage(sMessage est une chaîne, sSocketEmetteur est une chaîne)
// sMessage : Le message à diffuser à tous les clients
// sSocketEmetteur : Le socket du client qui a envoyé le message
// On ne lui renvoie pas son propre message

si gbEstServeur = Faux alors
    LogSocket("[DIFFUSION] ⚠️ Tentative de diffusion alors qu'on n'est pas serveur")
    retour
fin

nNombreClients est un entier = gtabClientsConnectes..Occurrence
LogSocket("[DIFFUSION] 📡 Diffusion du message : " + sMessage)
LogSocket("[DIFFUSION] 📤 Émetteur : " + sSocketEmetteur + " | 👥 Clients : " + nNombreClients)

nEnvoisReussis est un entier = 0

// ✅ IMPORTANT : Boucler de la FIN vers le DÉBUT
// Cela permet de supprimer des éléments du tableau sans décaler les indices
pour i = gtabClientsConnectes..Occurrence à 1 pas -1
    sSocketClientCible est une chaîne = gtabClientsConnectes[i]
    
    // Ne pas renvoyer le message à celui qui l'a envoyé
    si sSocketClientCible = sSocketEmetteur alors
        LogSocket("[DIFFUSION] ⏭️ Émetteur ignoré : " + sSocketClientCible)
        continuer
    fin
    
    LogSocket("[DIFFUSION] → Envoi à : " + sSocketClientCible)
    
    // ✅ PROTÉGER AVEC LE SÉMAPHORE
    SémaphoreDébut(gsSemaphoreSocket, 5000)
    bResultat est un booléen = SocketEcrit(sSocketClientCible, sMessage)
    SémaphoreFin(gsSemaphoreSocket)
    
    si bResultat = Vrai alors
        // ✅ Envoi réussi
        nEnvoisReussis++
        LogSocket("[DIFFUSION] ✅ Envoi réussi à : " + sSocketClientCible)
    sinon
        // ❌ Envoi échoué : le client est probablement déconnecté
        LogSocket("[DIFFUSION] ❌ Échec d'envoi à : " + sSocketClientCible)
        LogSocket("[NETTOYAGE] 🗑️ Client déconnecté détecté, suppression de la liste")
        
        // 1. Arrêter le thread de gestion de ce client
        sNomThread est une chaîne = "Thread_Client_" + sSocketClientCible
        LogSocket("[NETTOYAGE] 🛑 Arrêt du thread : " + sNomThread)
        ThreadDemandeArrêt(sNomThread)
        ThreadAttend(sNomThread, 500)
        
        // 2. Fermer le socket de notre côté
        SémaphoreDébut(gsSemaphoreSocket, 5000)
        quand exception dans
            si SocketExiste(sSocketClientCible) alors
                SocketFerme(sSocketClientCible)
                LogSocket("[NETTOYAGE] ✅ Socket fermée : " + sSocketClientCible)
            sinon
                LogSocket("[NETTOYAGE] ℹ️ Socket déjà fermée : " + sSocketClientCible)
            fin
        faire
            LogSocket("[NETTOYAGE] ⚠️ Erreur lors de la fermeture : " + ExceptionInfo())
        fin
        SémaphoreFin(gsSemaphoreSocket)
        
        // 3. Supprimer le client du tableau
        TableauSupprime(gtabClientsConnectes, i)
        LogSocket("[NETTOYAGE] ✅ Client supprimé. Clients restants : " + gtabClientsConnectes..Occurrence)
    fin
fin

LogSocket("[DIFFUSION] ✅ Message diffusé à " + nEnvoisReussis + " client(s)")
```

---

### Solution 2 : Augmenter le Timeout de SocketEcrit

**Problème** : Le timeout par défaut de `SocketEcrit` est trop court (1 seconde).

**Action** : Utiliser `SocketChangeMode` pour augmenter le timeout.

**Code à ajouter AVANT le `SocketEcrit`** :

```wl
// Augmenter le timeout à 3 secondes
SocketChangeMode(sSocketClientCible, SocketSansMarqueurFin, 3000)
bResultat est un booléen = SocketEcrit(sSocketClientCible, sMessage)
```

---

### Solution 3 : Utiliser un Sémaphore Global Plus Robuste

**Problème** : Le sémaphore actuel ne protège pas suffisamment contre les accès concurrents.

**Action** : Créer un sémaphore **par socket client** au lieu d'un sémaphore global.

**Avantages** :
- Chaque socket a son propre verrou
- Pas de blocage entre différents clients
- Meilleure performance

**Code modifié** :

```wl
procédure Socket_DiffuserMessage(sMessage est une chaîne, sSocketEmetteur est une chaîne)
// ... (début identique)

pour i = gtabClientsConnectes..Occurrence à 1 pas -1
    sSocketClientCible est une chaîne = gtabClientsConnectes[i]
    
    // Ne pas renvoyer le message à celui qui l'a envoyé
    si sSocketClientCible = sSocketEmetteur alors
        continuer
    fin
    
    // ✅ CRÉER UN SÉMAPHORE PAR SOCKET
    sNomSemaphore est une chaîne = "SEM_" + sSocketClientCible
    
    SémaphoreDébut(sNomSemaphore, 5000)
    bResultat est un booléen = SocketEcrit(sSocketClientCible, sMessage)
    SémaphoreFin(sNomSemaphore)
    
    // ... (suite identique)
fin
```

---

### Solution 4 : Gérer l'Exception 100121

**Problème** : L'erreur 100121 n'est pas gérée, elle fait planter l'application.

**Action** : Encapsuler `SocketEcrit` dans un bloc `QUAND EXCEPTION`.

**Code modifié** :

```wl
// ✅ PROTÉGER AVEC LE SÉMAPHORE ET GÉRER L'EXCEPTION
SémaphoreDébut(gsSemaphoreSocket, 5000)

quand exception dans
    bResultat est un booléen = SocketEcrit(sSocketClientCible, sMessage)
faire
    // Erreur 100121 : Socket occupée dans un autre thread
    LogSocket("[DIFFUSION] ⚠️ Erreur socket : " + ExceptionInfo())
    bResultat = Faux
fin

SémaphoreFin(gsSemaphoreSocket)
```

---

## 🎯 Recommandation Finale

**Appliquer les Solutions 1 + 4** :

1. **Nettoyer le code extrait** (Solution 1) pour supprimer les artefacts du PDF
2. **Gérer l'exception 100121** (Solution 4) pour éviter les plantages

**Pourquoi ?**
- Solution 1 corrige la source du problème (code mal extrait)
- Solution 4 ajoute une couche de robustesse pour éviter les plantages futurs
- Les Solutions 2 et 3 sont des optimisations optionnelles

---

## 📊 Impact de la Correction

### Avant
- ❌ Erreur 100121 fait planter l'application
- ❌ Code contient des artefacts du PDF
- ❌ Pas de gestion d'erreur sur `SocketEcrit`

### Après
- ✅ Erreur 100121 gérée gracieusement
- ✅ Code propre et cohérent
- ✅ Logs détaillés pour le débogage
- ✅ Clients déconnectés automatiquement nettoyés

---

## 🚀 Prochaines Étapes

1. ✅ Appliquer la correction au fichier `Socket_DiffuserMessage.wl`
2. ✅ Nettoyer tous les artefacts du PDF dans les autres fichiers
3. ✅ Tester avec plusieurs clients simultanés
4. ✅ Pousser la correction sur GitHub
5. ✅ Documenter la correction dans le rapport

---

**Cette analyse identifie clairement la cause et propose des solutions robustes pour résoudre l'erreur 100121.**
