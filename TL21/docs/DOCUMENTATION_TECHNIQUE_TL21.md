# 📘 DOCUMENTATION TECHNIQUE - TL21

**Application** : TL21 - Gestion de Production avec Synchronisation Multi-Utilisateurs  
**Version** : 2.0 (avec Sockets)  
**Date** : Janvier 2026  
**Plateforme** : WinDev  
**Base de données** : HFSQL Classic

---

## 📋 TABLE DES MATIÈRES

1. [Vue d'ensemble](#vue-densemble)
2. [Architecture](#architecture)
3. [Base de données](#base-de-données)
4. [Système de synchronisation](#système-de-synchronisation)
5. [Procédures principales](#procédures-principales)
6. [Variables globales](#variables-globales)
7. [Messages socket](#messages-socket)
8. [Gestion des erreurs](#gestion-des-erreurs)
9. [Sécurité et verrouillage](#sécurité-et-verrouillage)
10. [Déploiement](#déploiement)
11. [Maintenance](#maintenance)
12. [Dépannage](#dépannage)

---

## 1. VUE D'ENSEMBLE

### 1.1 Objectif

L'application TL21 permet à plusieurs utilisateurs de gérer simultanément la production en temps réel avec synchronisation automatique des modifications entre tous les postes connectés.

### 1.2 Fonctionnalités Principales

- ✅ **Gestion de production** : Planification et suivi des ordres de fabrication
- ✅ **Synchronisation temps réel** : Mise à jour instantanée sur tous les postes
- ✅ **Élection automatique du serveur** : Le premier utilisateur devient serveur
- ✅ **Verrouillage optimiste** : Protection contre les conflits de modification
- ✅ **Gestion des documents** : Consultation de plans et documents techniques
- ✅ **Filtrage et recherche** : Recherche par affaire, pièce, client, etc.

### 1.3 Technologies Utilisées

| Technologie | Usage |
|-------------|-------|
| **WinDev 28+** | Développement de l'application |
| **HFSQL Classic** | Base de données locale partagée |
| **Sockets TCP/IP** | Communication réseau temps réel |
| **Threads** | Gestion asynchrone des connexions |
| **Triggers HFSQL** | Détection automatique des modifications |

---

## 2. ARCHITECTURE

### 2.1 Architecture Globale

```
┌─────────────────────────────────────────────────────────────┐
│                    RÉSEAU LOCAL (LAN)                       │
│                                                             │
│  ┌──────────────┐         ┌──────────────┐                │
│  │   POSTE 1    │         │   POSTE 2    │                │
│  │  (SERVEUR)   │◄───────►│   (CLIENT)   │                │
│  │              │  Socket │              │                │
│  │  Port 5000   │  TCP/IP │              │                │
│  └──────┬───────┘         └──────┬───────┘                │
│         │                        │                         │
│         │                        │                         │
│         └────────────┬───────────┘                         │
│                      │                                     │
│              ┌───────▼────────┐                           │
│              │  Base HFSQL    │                           │
│              │  (Partagée)    │                           │
│              │  Prod_TL21     │                           │
│              └────────────────┘                           │
│                                                             │
│  Fichier de verrouillage :                                │
│  C:\Users\Public\Documents\Sources_SpeMH\                 │
│  TL21_SERVEUR.lock                                        │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 Architecture Client-Serveur

#### Mode Serveur (Premier utilisateur)

```
SERVEUR
├─ Thread Principal (UI)
│  └─ Gestion de l'interface utilisateur
│
├─ Thread Serveur (Socket_ThreadServeur)
│  └─ Écoute sur port 5000
│     └─ Accepte les connexions clients
│
├─ Thread Client 1 (Socket_ThreadGestionClient)
│  └─ Gère la communication avec Client 1
│
├─ Thread Client 2 (Socket_ThreadGestionClient)
│  └─ Gère la communication avec Client 2
│
└─ Thread Client N (Socket_ThreadGestionClient)
   └─ Gère la communication avec Client N
```

#### Mode Client (Autres utilisateurs)

```
CLIENT
├─ Thread Principal (UI)
│  └─ Gestion de l'interface utilisateur
│
└─ Thread Client (Thread_LireMessagesServeur)
   └─ Lecture des messages du serveur
      └─ Mise à jour de l'interface
```

### 2.3 Flux de Données

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUX DE MODIFICATION                     │
└─────────────────────────────────────────────────────────────┘

1. User A modifie une cellule
   │
   ├─► Trigger HFSQL détecte la modification
   │   (Socket_TriggerModification)
   │
   ├─► Envoi du message au serveur
   │   (Socket_EnvoyerDepuisTrigger)
   │
   ├─► Serveur reçoit le message
   │   (Socket_TraiterMessageClient)
   │
   ├─► Serveur diffuse à tous les clients
   │   (Socket_DiffuserMessage)
   │
   └─► Clients reçoivent et mettent à jour
       (Socket_TraiterMessageServeur)
       │
       └─► Rechargement de la ligne modifiée
           (Socket_RechargerEnregistrement)
```

---

## 3. BASE DE DONNÉES

### 3.1 Table Principale : Prod_TL21

| Champ | Type | Description |
|-------|------|-------------|
| `IDProd_TL21` | Entier auto | Identifiant unique (clé primaire) |
| `Date` | Date | Date de production prévue |
| `Ordre` | Entier | Ordre de priorité |
| `Client` | Chaîne | Nom du client |
| `Affaire` | Chaîne | Numéro d'affaire |
| `Commande` | Chaîne | Numéro de commande |
| `PIECE` | Chaîne | Référence de la pièce |
| `DESA` | Chaîne | Désignation |
| `QTEREST` | Réel | Quantité restante |
| `Couleur` | Chaîne | Codification couleur (J/V/C) |
| `R` | Chaîne | Statut R |
| `Balancelle` | Chaîne | Numéro de balancelle |
| `Reprise` | Chaîne | Indicateur de reprise |
| `Observations` | Texte | Observations diverses |
| `Epaisseuravant` | Réel | Épaisseur avant traitement |
| `Epaisseurapres` | Réel | Épaisseur après traitement |
| `HSF1Ereb` | DateHeure | Heure début érébrage |
| `HSFDerb` | DateHeure | Heure fin érébrage |
| `Vconvoyeur` | Réel | Vitesse convoyeur |
| `HeureVC` | DateHeure | Heure vitesse convoyeur |
| `CT` | Chaîne | Contrôle technique |
| `DetailCT` | Texte | Détail du contrôle technique |
| `Doc` | Texte | Liste des documents (séparés par RC) |
| `FLAG` | Chaîne | Paramètres de mise en forme |
| `Modifie_par` | Chaîne | Nom de l'utilisateur ayant modifié |
| `Version` | DateHeure | Version pour verrouillage optimiste |

### 3.2 Table Secondaire : Incidents

Utilisée pour la gestion des incidents (avec HSurveille maintenu).

### 3.3 Table Utilisateurs : Users_TL21

| Champ | Type | Description |
|-------|------|-------------|
| `login` | Chaîne | Nom d'utilisateur (USERNAME Windows) |
| `admin` | Booléen | Droits administrateur |

### 3.4 Triggers HFSQL

#### Trigger de Modification

```wlangage
PROCÉDURE Socket_TriggerModification()
    // Installé sur TOUS les postes (serveur ET clients)
    // Détecte les modifications locales
    // Appelle Socket_EnvoyerDepuisTrigger()
```

**Installation** :

```wlangage
HDécritTrigger("Prod_TL21", hTriggerAvant, "HMODIFIE,HAJOUTE,HSUPPRIME", 
               "Socket_TriggerModification", hTriggerServeur + hTriggerClient)
```

---

## 4. SYSTÈME DE SYNCHRONISATION

### 4.1 Élection du Serveur

#### Mécanisme de Verrouillage Fichier

Le premier utilisateur à créer le fichier de verrouillage devient le serveur :

```wlangage
sFichierVerrou = "C:\Users\Public\Documents\Sources_SpeMH\TL21_SERVEUR.lock"

SI fFichierExiste(sFichierVerrou) = Faux ALORS
    // Créer le fichier de verrouillage
    fSauveTexte(sFichierVerrou, gsUtilisateurActuel + RC + DateHeureSys())
    gbEstServeur = Vrai
    // Démarrer le serveur socket
SINON
    // Devenir client
    gbEstServeur = Faux
    // Se connecter au serveur
FIN
```

#### Fichier de Verrouillage

**Chemin** : `C:\Users\Public\Documents\Sources_SpeMH\TL21_SERVEUR.lock`

**Contenu** :
```
<Nom_Utilisateur>
<Date_Heure_Démarrage>
```

**Suppression** : Automatique à la fermeture du serveur

### 4.2 Configuration Socket

| Paramètre | Valeur | Description |
|-----------|--------|-------------|
| **Nom socket serveur** | `TL21_SERVEUR` | Nom du socket d'écoute |
| **Port** | `5000` | Port TCP d'écoute |
| **Adresse IP** | `192.168.100.34` | IP du serveur (fixe) |
| **Timeout** | `5000 ms` | Timeout des sémaphores |
| **Mode transmission** | `SocketSansMarqueurFin` | Pas de marqueur de fin |

### 4.3 Protocole de Communication

#### Format des Messages

```
ACTION|IDEnreg|Utilisateur|Valeur
```

**Exemples** :

```
connect|0|ddexet|
update|123|ddexet|
add|456|a-david|
delete|789|lbaumgart|
editing|123|ddexet|
stop_editing|123|ddexet|
```

#### Actions Disponibles

| Action | Envoyé par | Description |
|--------|-----------|-------------|
| `connect` | Client | Connexion initiale au serveur |
| `update` | Client | Modification d'un enregistrement |
| `add` | Client | Ajout d'un nouvel enregistrement |
| `delete` | Client | Suppression d'un enregistrement |
| `editing` | Client | Début d'édition d'une ligne |
| `stop_editing` | Client | Fin d'édition d'une ligne |
| `welcome` | Serveur | Message de bienvenue au client |
| `disconnect` | Client | Déconnexion du client |

### 4.4 Verrouillage Optimiste

#### Principe

Chaque enregistrement possède un champ `Version` (DateHeure) qui est mis à jour à chaque modification.

#### Processus de Sauvegarde

```wlangage
PROCÉDURE Socket_SauvegarderEnregistrement()
    // 1. Lire l'enregistrement actuel
    HLitRecherchePremier(Prod_TL21, IDProd_TL21, nID)
    
    // 2. Vérifier la version
    SI Prod_TL21.Version <> dVersionInitiale ALORS
        // Conflit détecté !
        Erreur("Enregistrement modifié par un autre utilisateur")
        RETOUR Faux
    FIN
    
    // 3. Mettre à jour avec nouvelle version
    Prod_TL21.Version = DateHeureSys()
    HModifie(Prod_TL21)
FIN
```

### 4.5 Protection Anti-Boucle

#### Variable de Verrouillage

```wlangage
gbVerrouMajTable : Booléen
```

**Usage** :

```wlangage
// Avant rechargement
gbVerrouMajTable = Vrai

// Rechargement
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequête)

// Après rechargement
gbVerrouMajTable = Faux
```

**Objectif** : Empêcher les triggers de se déclencher lors des rechargements automatiques.

---

## 5. PROCÉDURES PRINCIPALES

### 5.1 Collection Socket_Gestion

Toutes les procédures de synchronisation sont regroupées dans la collection `Socket_Gestion`.

#### 5.1.1 Socket_Initialiser()

**Rôle** : Point d'entrée principal, initialise le système de synchronisation.

**Algorithme** :

```
1. Récupérer le nom d'utilisateur (USERNAME)
2. Vérifier l'existence du fichier de verrouillage
3. SI fichier n'existe pas ALORS
     → Devenir SERVEUR
     → Créer le fichier de verrouillage
     → Créer le socket serveur sur port 5000
     → Démarrer le thread serveur
   SINON
     → Devenir CLIENT
     → Se connecter au serveur
     → Démarrer le thread client
4. Installer les triggers HFSQL
5. Activer la synchronisation
```

**Code clé** :

```wlangage
PROCÉDURE Socket_Initialiser()
    // Récupération utilisateur
    gsUtilisateurActuel = SysEnvironnement("USERNAME")
    
    // Tentative d'élection serveur
    sFichierVerrou = gsChemin_Verrouillage + "\TL21_SERVEUR.lock"
    
    SI fFichierExiste(sFichierVerrou) = Faux ALORS
        // SERVEUR
        fSauveTexte(sFichierVerrou, gsUtilisateurActuel)
        gbEstServeur = Vrai
        
        // Créer socket serveur
        SocketCrée(gsNomSocketServeur, gnPortSocket)
        
        // Démarrer thread serveur
        ThreadExécute("Thread_Serveur", threadNormal + threadSécurisé, 
                      Socket_ThreadServeur)
    SINON
        // CLIENT
        gbEstServeur = Faux
        Socket_ConnecterAuServeur()
    FIN
    
    // Installer triggers
    HDécritTrigger("Prod_TL21", hTriggerAvant, "HMODIFIE,HAJOUTE,HSUPPRIME",
                   "Socket_TriggerModification", 
                   hTriggerServeur + hTriggerClient)
    
    gbSocketActif = Vrai
FIN
```

#### 5.1.2 Socket_ThreadServeur()

**Rôle** : Thread serveur qui accepte les connexions clients.

**Algorithme** :

```
TANT QUE gbSocketActif = Vrai
    1. Attendre une connexion (SocketAttendConnexion)
    2. SI connexion acceptée ALORS
         → Créer un thread pour gérer ce client
         → Ajouter le client à la liste
    3. Pause de 100ms
FIN TANT QUE
```

**Code clé** :

```wlangage
PROCÉDURE Socket_ThreadServeur()
    TANTQUE gbSocketActif
        sNomClient = SocketAttendConnexion(gsNomSocketServeur, 1000)
        
        SI sNomClient <> "" ALORS
            // Nouveau client connecté
            LogSocket("✅ Nouveau client : " + sNomClient)
            
            // Ajouter à la liste
            Ajoute(gtabClientsConnectes, sNomClient)
            
            // Créer un thread pour ce client
            ThreadExécute("Thread_Client_" + sNomClient, 
                          threadNormal + threadSécurisé,
                          Socket_ThreadGestionClient, sNomClient)
        FIN
        
        Temporisation(100)
    FIN
FIN
```

#### 5.1.3 Socket_ThreadGestionClient(sNomClient)

**Rôle** : Thread qui gère la communication avec un client spécifique.

**Paramètres** :
- `sNomClient` : Nom du socket client

**Algorithme** :

```
TANT QUE gbSocketActif = Vrai
    1. Lire le message du client (SocketLit)
    2. SI message reçu ALORS
         → Traiter le message (Socket_TraiterMessageClient)
         → Diffuser aux autres clients
    3. Pause de 50ms
FIN TANT QUE
```

**Code clé** :

```wlangage
PROCÉDURE Socket_ThreadGestionClient(sNomClient est une chaîne)
    TANTQUE gbSocketActif
        sMessage = SocketLit(sNomClient, Faux, 100)
        
        SI sMessage <> "" ALORS
            // Traiter le message
            Socket_TraiterMessageClient(sMessage, sNomClient)
        FIN
        
        Temporisation(50)
    FIN
FIN
```

#### 5.1.4 Thread_LireMessagesServeur()

**Rôle** : Thread client qui lit les messages du serveur.

**Algorithme** :

```
TANT QUE gbSocketActif = Vrai
    1. Lire le message du serveur (SocketLit)
    2. SI message reçu ALORS
         → Traiter le message (Socket_TraiterMessageServeur)
    3. Pause de 50ms
FIN TANT QUE
```

#### 5.1.5 Socket_Envoyer(sAction, nIDEnreg)

**Rôle** : Envoie un message au serveur (client) ou à tous les clients (serveur).

**Paramètres** :
- `sAction` : Action à effectuer (update, add, delete, editing, etc.)
- `nIDEnreg` : ID de l'enregistrement concerné

**Code clé** :

```wlangage
PROCÉDURE Socket_Envoyer(sAction est une chaîne, 
                         nIDEnreg est un entier = 0)
    // Protection par sémaphore
    SI SémaphoreDebut(SEM_SOCKET_TL21, 5000) = Faux ALORS
        LogSocket("⚠️ Timeout sémaphore envoi")
        RETOUR
    FIN
    
    // Construction du message
    sMessage = sAction + "|" + nIDEnreg + "|" + gsUtilisateurActuel + "|"
    
    // Envoi
    SI gbEstServeur ALORS
        // Diffuser à tous les clients
        Socket_DiffuserMessage(sMessage)
    SINON
        // Envoyer au serveur
        SocketEcrit(gsNomSocketClient, sMessage)
    FIN
    
    SémaphoreFin(SEM_SOCKET_TL21)
FIN
```

#### 5.1.6 Socket_TraiterMessageClient(sMessage, sNomClient)

**Rôle** : Traite les messages reçus des clients (côté serveur).

**Paramètres** :
- `sMessage` : Message reçu
- `sNomClient` : Nom du client émetteur

**Algorithme** :

```
1. Parser le message (ACTION|ID|USER|VALUE)
2. Logger le message
3. Diffuser à tous les autres clients
```

#### 5.1.7 Socket_TraiterMessageServeur(sMessage)

**Rôle** : Traite les messages reçus du serveur (côté client).

**Paramètres** :
- `sMessage` : Message reçu

**Algorithme** :

```
1. Parser le message
2. Extraire ACTION, ID, USER
3. SELON ACTION
     CAS "update" :
       → Recharger l'enregistrement
     CAS "add" :
       → Recharger la table
     CAS "delete" :
       → Supprimer la ligne de la table
     CAS "editing" :
       → Afficher l'indicateur d'édition
     CAS "stop_editing" :
       → Masquer l'indicateur
FIN SELON
```

**Code clé** :

```wlangage
PROCÉDURE Socket_TraiterMessageServeur(sMessage est une chaîne)
    // Parser le message
    sAction = ExtraitChaîne(sMessage, 1, "|")
    nIDEnreg = Val(ExtraitChaîne(sMessage, 2, "|"))
    sUtilisateur = ExtraitChaîne(sMessage, 3, "|")
    
    // Traiter selon l'action
    SELON sAction
        CAS "update"
            // Recharger seulement si on n'édite pas cette ligne
            SI gnEnregistrementEnCours <> nIDEnreg OU gbSaisieEnCours = Faux ALORS
                ExécuteThreadPrincipal(Socket_RechargerEnregistrement, nIDEnreg)
            FIN
            
        CAS "add"
            ExécuteThreadPrincipal(Socket_RechargerTable)
            
        CAS "delete"
            ExécuteThreadPrincipal(Socket_SupprimerLigneTable, nIDEnreg)
            
        CAS "editing"
            ExécuteThreadPrincipal(Socket_AfficherAlerteLigne, nIDEnreg, sUtilisateur)
            
        CAS "stop_editing"
            ExécuteThreadPrincipal(Socket_MasquerAlerteLigne, nIDEnreg)
    FIN
FIN
```

#### 5.1.8 Socket_RechargerEnregistrement(nIDEnreg)

**Rôle** : Recharge un enregistrement spécifique dans la table.

**Paramètres** :
- `nIDEnreg` : ID de l'enregistrement à recharger

**Algorithme** :

```
1. Activer gbVerrouMajTable
2. Rechercher la ligne dans la table
3. Relire l'enregistrement depuis la base
4. Mettre à jour les colonnes de la table
5. Mettre à jour SAI_Incidents
6. Désactiver gbVerrouMajTable
```

**Code clé** :

```wlangage
PROCÉDURE Socket_RechargerEnregistrement(nIDEnreg est un entier)
    // Protection anti-boucle
    gbVerrouMajTable = Vrai
    
    // Trouver la ligne dans la table
    nLigne = TableCherche(COL_ID, nIDEnreg)
    
    SI nLigne > 0 ALORS
        // Lire depuis la base
        HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDEnreg)
        
        SI HTrouve(Prod_TL21) ALORS
            // Mettre à jour la table
            TABLE_Prod_TL21.COL_Client[nLigne] = Prod_TL21.Client
            TABLE_Prod_TL21.COL_Affaire[nLigne] = Prod_TL21.Affaire
            // ... (toutes les colonnes)
            
            // Mettre à jour SAI_Incidents
            SAI_Incidents = HNbEnr(Incidents)
        FIN
    FIN
    
    gbVerrouMajTable = Faux
FIN
```

#### 5.1.9 Socket_RechargerTable()

**Rôle** : Recharge la table complète.

**Algorithme** :

```
1. Activer gbVerrouMajTable
2. Réexécuter la requête
3. Rafraîchir la table (taRéExécuteRequête)
4. Mettre à jour SAI_Incidents
5. Désactiver gbVerrouMajTable
```

#### 5.1.10 Socket_OnEntreeColonne()

**Rôle** : Appelé à l'entrée dans une colonne éditable.

**Algorithme** :

```
1. Récupérer l'ID de la ligne
2. Activer gbSaisieEnCours
3. Mémoriser gnEnregistrementEnCours
4. Envoyer le message "editing"
```

#### 5.1.11 Socket_OnSortieColonne()

**Rôle** : Appelé à la sortie d'une colonne éditable.

**Algorithme** :

```
1. SI gbSaisieEnCours = Vrai ALORS
     → Sauvegarder l'enregistrement
     → Envoyer le message "update"
     → Envoyer le message "stop_editing"
     → Désactiver gbSaisieEnCours
FIN
```

#### 5.1.12 Socket_SauvegarderEnregistrement()

**Rôle** : Sauvegarde un enregistrement avec verrouillage optimiste.

**Algorithme** :

```
1. Lire l'enregistrement actuel
2. Vérifier la version (verrouillage optimiste)
3. SI conflit ALORS
     → Afficher erreur
     → RETOUR Faux
4. Mettre à jour les champs
5. Mettre à jour Version = DateHeureSys()
6. Sauvegarder (HModifie)
7. RETOUR Vrai
```

#### 5.1.13 Socket_Fermer()

**Rôle** : Ferme proprement tous les sockets et threads.

**Algorithme** :

```
1. Désactiver gbSocketActif
2. SI serveur ALORS
     → Fermer tous les sockets clients
     → Fermer le socket serveur
     → Supprimer le fichier de verrouillage
   SINON
     → Envoyer "disconnect"
     → Fermer le socket client
3. Attendre l'arrêt des threads (ThreadAttend)
4. Désinstaller les triggers
```

---

## 6. VARIABLES GLOBALES

### 6.1 Variables de Configuration

| Variable | Type | Description |
|----------|------|-------------|
| `gsNomSocketServeur` | Chaîne | Nom du socket serveur ("TL21_SERVEUR") |
| `gsNomSocketClient` | Chaîne | Nom du socket client (généré) |
| `gnPortSocket` | Entier | Port TCP (5000) |
| `gsAdresseIPServeur` | Chaîne | IP du serveur (192.168.100.34) |

### 6.2 Variables d'État

| Variable | Type | Description |
|----------|------|-------------|
| `gbEstServeur` | Booléen | Vrai si ce poste est le serveur |
| `gbSocketActif` | Booléen | Vrai si le système de socket est actif |
| `gbSaisieEnCours` | Booléen | Vrai si l'utilisateur est en train de saisir |
| `gbVerrouMajTable` | Booléen | Vrai pendant un rechargement (anti-boucle) |
| `gbReelectionEnCours` | Booléen | Vrai pendant une réélection de serveur |
| `gbEtaitClient` | Booléen | Vrai si ce poste était client avant réélection |

### 6.3 Variables de Données

| Variable | Type | Description |
|----------|------|-------------|
| `gsUtilisateurActuel` | Chaîne | Nom de l'utilisateur (USERNAME) |
| `gnEnregistrementEnCours` | Entier | ID de l'enregistrement en cours d'édition |
| `gtabClientsConnectes` | Tableau | Liste des sockets clients (serveur uniquement) |

### 6.4 Constantes

| Constante | Valeur | Description |
|-----------|--------|-------------|
| `SEM_SOCKET_TL21` | "SEM_SOCKET_TL21" | Nom du sémaphore de protection |
| `TIMEOUT_SEMAPHORE` | 5000 | Timeout sémaphore en ms |

---

## 7. MESSAGES SOCKET

### 7.1 Format Standard

```
ACTION|IDEnregistrement|Utilisateur|Valeur
```

### 7.2 Messages Client → Serveur

| Message | Exemple | Description |
|---------|---------|-------------|
| `connect` | `connect\|0\|ddexet\|` | Connexion initiale |
| `update` | `update\|123\|ddexet\|` | Modification enregistrement |
| `add` | `add\|456\|a-david\|` | Ajout enregistrement |
| `delete` | `delete\|789\|lbaumgart\|` | Suppression enregistrement |
| `editing` | `editing\|123\|ddexet\|` | Début édition |
| `stop_editing` | `stop_editing\|123\|ddexet\|` | Fin édition |
| `disconnect` | `disconnect\|0\|ddexet\|` | Déconnexion |

### 7.3 Messages Serveur → Clients

| Message | Exemple | Description |
|---------|---------|-------------|
| `welcome` | `welcome\|0\|serveur\|Bienvenue` | Message de bienvenue |
| `update` | `update\|123\|ddexet\|` | Diffusion modification |
| `add` | `add\|456\|a-david\|` | Diffusion ajout |
| `delete` | `delete\|789\|lbaumgart\|` | Diffusion suppression |
| `editing` | `editing\|123\|ddexet\|` | Diffusion début édition |
| `stop_editing` | `stop_editing\|123\|ddexet\|` | Diffusion fin édition |

---

## 8. GESTION DES ERREURS

### 8.1 Erreurs Socket

#### Erreur de Connexion

```wlangage
SI SocketConnecte(gsNomSocketClient, gnPortSocket, gsAdresseIPServeur) = Faux ALORS
    LogSocket("❌ Erreur connexion : " + ErreurInfo())
    Socket_AfficherErreurConnexion()
    RETOUR Faux
FIN
```

#### Erreur d'Envoi

```wlangage
SI SocketEcrit(gsNomSocketClient, sMessage) = Faux ALORS
    LogSocket("❌ Erreur envoi : " + ErreurInfo())
    // Tenter une reconnexion
    Socket_ReconnecterAuServeur()
FIN
```

### 8.2 Erreurs de Verrouillage

#### Conflit de Version

```wlangage
SI Prod_TL21.Version <> dVersionInitiale ALORS
    Erreur("⚠️ Conflit de modification" + RC + RC +
           "Cet enregistrement a été modifié par un autre utilisateur." + RC +
           "Vos modifications n'ont pas été enregistrées." + RC + RC +
           "Veuillez recharger l'enregistrement.")
    RETOUR Faux
FIN
```

### 8.3 Gestion de la Déconnexion Serveur

#### Détection de Déconnexion

```wlangage
PROCÉDURE Socket_GererDeconnexionServeur()
    // Marquer la réélection en cours
    gbReelectionEnCours = Vrai
    gbEtaitClient = Vrai
    
    // Afficher le statut
    ExécuteThreadPrincipal(Socket_MettreAJourStatutUI, "🔄 Réélection...")
    
    // Fermer le socket client
    SocketFerme(gsNomSocketClient)
    
    // Attendre 2 secondes
    Temporisation(2000)
    
    // Tenter de devenir serveur
    Socket_Initialiser()
FIN
```

---

## 9. SÉCURITÉ ET VERROUILLAGE

### 9.1 Sémaphores

#### Sémaphore Principal

```wlangage
SEM_SOCKET_TL21 : Chaîne = "SEM_SOCKET_TL21"
```

**Usage** :

```wlangage
SI SémaphoreDebut(SEM_SOCKET_TL21, 5000) = Faux ALORS
    LogSocket("⚠️ Timeout sémaphore")
    RETOUR
FIN

// ... code protégé ...

SémaphoreFin(SEM_SOCKET_TL21)
```

### 9.2 Verrouillage Optimiste

#### Principe

Chaque enregistrement possède un champ `Version` (DateHeure) mis à jour à chaque modification.

#### Vérification

```wlangage
// Avant modification
dVersionInitiale = Prod_TL21.Version

// ... modifications ...

// Avant sauvegarde
HLitRecherchePremier(Prod_TL21, IDProd_TL21, nID)
SI Prod_TL21.Version <> dVersionInitiale ALORS
    // CONFLIT !
    Erreur("Enregistrement modifié par un autre utilisateur")
    RETOUR Faux
FIN

// Mise à jour avec nouvelle version
Prod_TL21.Version = DateHeureSys()
HModifie(Prod_TL21)
```

### 9.3 Protection Anti-Boucle

#### Variable gbVerrouMajTable

```wlangage
// Avant rechargement
gbVerrouMajTable = Vrai

// Rechargement
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequête)

// Après rechargement
gbVerrouMajTable = Faux
```

#### Vérification dans les Triggers

```wlangage
PROCÉDURE Socket_TriggerModification()
    SI gbVerrouMajTable = Vrai ALORS
        // Ne pas envoyer de message pendant un rechargement
        RETOUR
    FIN
    
    // ... envoi du message ...
FIN
```

---

## 10. DÉPLOIEMENT

### 10.1 Prérequis

- ✅ WinDev 28+ installé
- ✅ Windows 10/11
- ✅ Réseau local (LAN)
- ✅ Accès au dossier partagé de la base HFSQL
- ✅ Droits d'écriture sur `C:\Users\Public\Documents\Sources_SpeMH\`
- ✅ Port 5000 ouvert dans le pare-feu

### 10.2 Installation

1. **Copier l'exécutable** sur chaque poste
2. **Configurer l'accès à la base HFSQL** (chemin réseau)
3. **Créer le dossier de verrouillage** : `C:\Users\Public\Documents\Sources_SpeMH\`
4. **Créer le dossier de logs** : `C:\Users\Public\Documents\Sources_SpeMH\Logs\`
5. **Configurer le pare-feu** pour autoriser le port 5000

### 10.3 Configuration Réseau

#### Serveur

- **IP fixe** : 192.168.100.34
- **Port** : 5000
- **Pare-feu** : Autoriser entrant sur port 5000

#### Clients

- **Connexion** : Vers 192.168.100.34:5000
- **Pare-feu** : Autoriser sortant sur port 5000

---

## 11. MAINTENANCE

### 11.1 Logs

#### Emplacement

```
C:\Users\Public\Documents\Sources_SpeMH\Logs\
TL21_Socket_USERNAME=<utilisateur>_<date>.log
```

#### Format

```
[2026-01-14 10:30:15] ✅ Socket serveur créé sur port 5000
[2026-01-14 10:30:16] ✅ Thread serveur démarré
[2026-01-14 10:31:22] ✅ Nouveau client : Client_192.168.100.45_12345
[2026-01-14 10:32:10] 📨 Message reçu : update|123|ddexet|
```

#### Nettoyage Automatique

Les logs de plus de 7 jours sont automatiquement supprimés au démarrage.

### 11.2 Surveillance

#### Indicateurs à Surveiller

- ✅ Nombre de clients connectés
- ✅ Latence des messages
- ✅ Erreurs de connexion
- ✅ Conflits de verrouillage

#### Commandes de Diagnostic

```wlangage
// Afficher le statut
Trace("Serveur : " + (gbEstServeur ? "OUI" : "NON"))
Trace("Socket actif : " + (gbSocketActif ? "OUI" : "NON"))
Trace("Clients connectés : " + Occurrence(gtabClientsConnectes))
```

---

## 12. DÉPANNAGE

### 12.1 Problèmes Courants

#### Problème : "Port 5000 déjà utilisé"

**Cause** : Une autre application utilise le port 5000.

**Solution** :
1. Identifier l'application : `netstat -ano | findstr :5000`
2. Arrêter l'application
3. Ou changer le port dans la configuration

#### Problème : "Impossible de se connecter au serveur"

**Cause** : Serveur non démarré ou pare-feu bloque.

**Solution** :
1. Vérifier que le serveur est démarré
2. Vérifier l'IP du serveur (192.168.100.34)
3. Vérifier le pare-feu (port 5000)
4. Tester la connexion : `telnet 192.168.100.34 5000`

#### Problème : "Conflit de modification"

**Cause** : Deux utilisateurs ont modifié le même enregistrement.

**Solution** :
1. Recharger l'enregistrement
2. Refaire les modifications
3. Sauvegarder à nouveau

#### Problème : "Fichier de verrouillage bloqué"

**Cause** : Le serveur s'est arrêté brutalement.

**Solution** :
1. Supprimer manuellement le fichier `TL21_SERVEUR.lock`
2. Redémarrer l'application

### 12.2 Procédures de Diagnostic

#### Vérifier l'État du Socket

```wlangage
PROCÉDURE DiagnosticSocket()
    Trace("=== DIAGNOSTIC SOCKET ===")
    Trace("Serveur : " + (gbEstServeur ? "OUI" : "NON"))
    Trace("Socket actif : " + (gbSocketActif ? "OUI" : "NON"))
    Trace("Utilisateur : " + gsUtilisateurActuel)
    
    SI gbEstServeur ALORS
        Trace("Clients connectés : " + Occurrence(gtabClientsConnectes))
        POUR TOUT sClient DE gtabClientsConnectes
            Trace("  - " + sClient)
        FIN
    SINON
        Trace("Connecté à : " + gsAdresseIPServeur + ":" + gnPortSocket)
    FIN
FIN
```

#### Tester la Connexion

```wlangage
PROCÉDURE TesterConnexion()
    sTest = "test|0|" + gsUtilisateurActuel + "|"
    SI Socket_Envoyer("test", 0) ALORS
        Trace("✅ Connexion OK")
    SINON
        Trace("❌ Connexion KO")
    FIN
FIN
```

---

## 📚 ANNEXES

### A. Liste Complète des Procédures

| Procédure | Rôle |
|-----------|------|
| `Socket_Initialiser` | Initialisation du système |
| `Socket_Fermer` | Fermeture propre |
| `Socket_ThreadServeur` | Thread serveur |
| `Socket_ThreadGestionClient` | Thread gestion client |
| `Thread_LireMessagesServeur` | Thread lecture serveur |
| `Socket_Envoyer` | Envoi de messages |
| `Socket_DiffuserMessage` | Diffusion aux clients |
| `Socket_TraiterMessageClient` | Traitement messages clients |
| `Socket_TraiterMessageServeur` | Traitement messages serveur |
| `Socket_ConnecterAuServeur` | Connexion au serveur |
| `Socket_ReconnecterAuServeur` | Reconnexion |
| `Socket_GererDeconnexionServeur` | Gestion déconnexion |
| `Socket_TriggerModification` | Trigger HFSQL |
| `Socket_EnvoyerDepuisTrigger` | Envoi depuis trigger |
| `Socket_RechargerEnregistrement` | Rechargement ligne |
| `Socket_RechargerTable` | Rechargement table |
| `Socket_SupprimerLigneTable` | Suppression ligne |
| `Socket_OnEntreeColonne` | Entrée en édition |
| `Socket_OnSortieColonne` | Sortie d'édition |
| `Socket_SauvegarderEnregistrement` | Sauvegarde |
| `Socket_AfficherAlerteLigne` | Alerte édition |
| `Socket_MasquerAlerteLigne` | Masquer alerte |
| `Socket_AfficherErreurConnexion` | Erreur connexion |
| `Socket_AfficherPromotionServeur` | Promotion serveur |
| `Socket_MettreAJourStatutUI` | Mise à jour statut |
| `LogSocket` | Écriture logs |
| `Socket_NettoyerVieuxLogs` | Nettoyage logs |

### B. Glossaire

| Terme | Définition |
|-------|------------|
| **Socket** | Canal de communication réseau TCP/IP |
| **Thread** | Processus d'exécution parallèle |
| **Trigger** | Procédure automatique déclenchée par la base |
| **Verrouillage optimiste** | Détection de conflits par version |
| **Sémaphore** | Mécanisme de synchronisation |
| **Élection** | Processus de désignation du serveur |
| **Diffusion** | Envoi à tous les clients |
| **Rechargement** | Mise à jour depuis la base |

---

**FIN DE LA DOCUMENTATION TECHNIQUE**

*Version 2.0 - Janvier 2026*
