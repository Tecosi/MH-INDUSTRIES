# Prompt de Contexte - Projet TL21

**À copier-coller dans un nouveau fil de conversation pour reprendre le contexte complet.**

---

Bonjour ! Je travaille sur le projet **TL21**, une application de gestion de production multi-utilisateurs développée en **WinDev 2025**.

## 📂 Dépôt GitHub

Le code source est disponible sur : **https://github.com/Tecosi/MH-INDUSTRIES**

Merci de cloner ce dépôt pour accéder au code source complet.

---

## 🏗️ Architecture Technique de TL21

### Langage et Environnement

L'application TL21 est développée en **WLangage** (WinDev 2025) avec les caractéristiques suivantes :

- **Base de données** : HFSQL Classic (fichier réseau partagé)
- **Synchronisation** : Sockets TCP/IP sur le port 5000 + Triggers HFSQL
- **Verrouillage** : Optimiste avec champ `Version` (DateHeure)
- **Multi-utilisateurs** : Architecture serveur socket + clients connectés

### Structure des Données

La table principale `Prod_TL21` contient les champs suivants :

- `IDProd_TL21` : Entier 8 octets, clé unique, auto-incrémenté
- `Version` : DateHeure, pour verrouillage optimiste
- `Modifie_par` : Chaîne, utilisateur qui modifie
- `Ordre` : Entier, ordre d'affichage
- `Date`, `Client`, `Affaire`, `Commande`, `PIECE`, `DESA`, `QTEREST`, etc.

### Fenêtre Principale

- **Fenêtre** : `FEN_Principale`
- **Table affichée** : `TABLE_Prod_TL21` (table fichier liée à `Prod_TL21`)
- **Classe de mapping** : `MProd_TL21` (mapping HFSQL automatique)

### Procédures Socket Clés

Les procédures de gestion socket se trouvent dans la collection `Socket_Gestion` :

- `Socket_Initialiser()` : Initialisation du système socket (serveur ou client)
- `Socket_Fermer()` : Fermeture propre des connexions
- `Socket_Envoyer(sAction, nIDEnreg, sValeur)` : Envoi de messages aux autres utilisateurs
- `Socket_SauvegarderEnregistrement(nID, dhVersion)` : Sauvegarde avec gestion de conflits
- `Socket_DiffuserMessage(sMessage, sSocketEmetteur)` : Diffusion aux clients
- `Socket_ThreadServeur()` : Thread principal du serveur
- `Socket_ThreadGestionClient()` : Thread de gestion d'un client
- `Thread_LireMessagesServeur()` : Thread de lecture des messages (côté client)

### Variables Globales

- `gsUtilisateurActuel` : Nom de l'utilisateur connecté
- `gbSocketActif` : Indique si le socket est actif
- `gbEstServeur` : Indique si l'instance est le serveur
- `gtabClientsConnectes` : Tableau des sockets clients connectés
- `gsSemaphoreSocket` : Sémaphore pour protéger les écritures socket
- `gsAdresseServeur` : Adresse IP du serveur (192.168.100.34)
- `gnPortSocket` : Port TCP/IP (5000)

---

## 🔧 Corrections Déjà Appliquées

### Patch Socket 100121 (v2)

**Problème résolu** : Erreur "Le socket est actuellement utilisée dans un autre thread et n'a pas été débloqué au bout d'une seconde" (erreur WLangage 100121).

**Solution implémentée** : Architecture de file d'attente thread-safe

- Nouvelle procédure `Socket_ThreadEmission()` qui gère l'envoi des messages en arrière-plan
- `Socket_Envoyer()` ajoute les messages à une file d'attente (`gfileMessagesEnvoi`) au lieu d'envoyer directement
- Utilisation des fonctions thread-safe `Enfile()` et `Défile()` de WinDev
- Un seul thread accède à `SocketEcrit()`, éliminant les conflits de concurrence

**Localisation** : `TL21/patches/patch_100121_v2/` sur GitHub

### Autres Patches Appliqués

1. **Patch Année Zéro (80123)** : Vérification avant `DateHeureVersChaîne()`
2. **Patch Comparaison (1036)** : Variables booléennes pour éviter comparaison DateHeure vs Entier
3. **Sauvegarde automatique** : Événement "Sortie de ligne" appelle `EnregistrerLigneModifiee()`
4. **Duplication de lignes** : Méthode `Dupliquer()` dans classe `MProd_TL21`

---

## 📋 Fonctionnalités Actuelles

### Gestion Multi-Utilisateurs

- **Mode Serveur/Client** : Un poste devient serveur (via fichier de verrouillage), les autres deviennent clients
- **Synchronisation en temps réel** : Les modifications sont diffusées instantanément à tous les utilisateurs connectés
- **Verrouillage optimiste** : Détection de conflits via le champ `Version`
- **Notifications** : Messages toast pour informer des modifications par d'autres utilisateurs

### Triggers HFSQL

Un trigger est installé sur `Prod_TL21` pour intercepter les modifications :

```wlangage
HDécritTrigger("Prod_TL21", "HMODIFIE,HAJOUTE,HSUPPRIME", "Socket_TriggerModification", hTriggerAprès)
```

---

## 🎯 Objectifs de Développement

Les préférences de l'utilisateur pour la collaboration en temps réel :

1. **Saisie concurrente autorisée** : Pas de blocage lors de la modification simultanée
2. **Notifications intelligentes** : Ne pas notifier l'utilisateur de ses propres modifications
3. **Gestion du focus** : Restaurer la position du curseur après rafraîchissement
4. **Notifications groupées** : Éviter les toast multiples lors d'opérations en masse
5. **Mécanisme de surveillance non intrusif** : Ne pas interrompre la saisie des autres utilisateurs

---

## 📚 Documentation Utile

- **Documentation WinDev** : https://doc.pcsoft.fr/fr-FR/
- **Fonction Sérialise/Désérialise** : https://doc.pcsoft.fr/fr-FR/?3013065
- **Type File (File d'attente)** : https://doc.pcsoft.fr/fr-FR/?1514021

---

## 🚀 Prochaines Étapes Possibles

Voici quelques axes de développement ou de débogage que nous pourrions explorer :

1. **Test et validation du patch 100121 v2** en environnement multi-utilisateurs
2. **Optimisation des notifications** pour éviter la surcharge d'informations
3. **Amélioration de la gestion du focus** lors des rafraîchissements
4. **Ajout de fonctionnalités** de collaboration avancées (historique, commentaires, etc.)
5. **Débogage** de tout nouveau problème rencontré

---

**Merci de me confirmer que tu as bien accès au dépôt GitHub et que tu as compris le contexte !**
