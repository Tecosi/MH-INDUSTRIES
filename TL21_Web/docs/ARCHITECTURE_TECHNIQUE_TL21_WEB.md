# 🚀 ARCHITECTURE TECHNIQUE - TL21 WEB

**Projet** : Migration de TL21 vers une Application Web Moderne  
**Date** : 14 janvier 2026  
**Auteur** : Manus AI

---

## 1. VUE D'ENSEMBLE

Ce document présente l'architecture technique proposée pour la **migration de l'application WinDev TL21 vers une application web moderne**. L'objectif est de conserver la base de données HFSQL existante comme source de vérité unique tout en offrant une interface utilisateur moderne, des fonctionnalités de collaboration temps réel améliorées et une accessibilité multi-plateforme via un navigateur web.

### 1.1 Objectifs Clés

- **Conserver la base HFSQL** : Pas de migration de données, l'application WinDev existante reste fonctionnelle.
- **Interface Web Moderne** : Remplacer l'interface WinDev par une application React responsive et conviviale.
- **Collaboration Temps Réel** : Remplacer le système de Sockets TCP/IP par des WebSockets pour une synchronisation plus robuste et native au web.
- **Déploiement Centralisé** : Éliminer le besoin d'installer l'application sur chaque poste client.
- **Améliorer l'UX** : Fournir des notifications non intrusives, des indicateurs de présence clairs et une meilleure gestion des conflits.

### 1.2 Stack Technologique Proposée

| Composant | Technologie | Rôle |
|---|---|---|
| **Frontend** | React + TypeScript | Interface utilisateur interactive et typée. |
| **Backend** | Node.js + Express | Serveur d'API REST et de WebSockets. |
| **Base de Données** | HFSQL Classic (via ODBC) | Source de données existante. |
| **Temps Réel** | Socket.io | Communication bidirectionnelle pour la synchronisation. |
| **Styling** | TailwindCSS | Framework CSS pour un design moderne et rapide. |

---

## 2. ARCHITECTURE GLOBALE

L'architecture repose sur une communication entre un backend Node.js et la base de données HFSQL via un driver ODBC. Le frontend React communique avec le backend via des requêtes HTTP (API REST) et une connexion WebSocket permanente.

### 2.1 Schéma d'Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    SERVEUR D'APPLICATION (Node.js)          │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  Frontend Web (React, servi par Node.js)             │  │
│  │  - Interface utilisateur (Maquettes 1-5)             │  │
│  │  - Client WebSocket (Socket.io-client)               │  │
│  └───────────────────┬──────────────────────────────────┘  │
│                      │ HTTP (REST API) / WebSocket         │
│  ┌───────────────────▼──────────────────────────────────┐  │
│  │  Backend API (Node.js + Express)                     │  │
│  │  - API REST pour les opérations CRUD                 │  │
│  │  - Serveur WebSocket pour la synchronisation         │  │
│  │  - Logique métier et authentification                │  │
│  └───────────────────┬──────────────────────────────────┘  │
│                      │ SQL via ODBC                        │
│  ┌───────────────────▼──────────────────────────────────┐  │
│  │  Driver ODBC pour HFSQL                              │  │
│  │  - Traduit les requêtes SQL pour HFSQL               │  │
│  └───────────────────┬──────────────────────────────────┘  │
└────────────────────────┼──────────────────────────────────┘
                         │ Réseau Local (LAN)
         ┌───────────────┼───────────────┐
         │               │               │
    ┌────▼─────┐   ┌────▼─────┐   ┌────▼─────┐
    │ WinDev 1 │   │ WinDev 2 │   │ WinDev N │
    │ (Poste 1)│   │ (Poste 2)│   │ (Poste N)│
    └────┬─────┘   └────┬─────┘   └────┬─────┘
         │              │              │
         └──────────────┼──────────────┘
                        │
                ┌───────▼────────┐
                │  Base HFSQL    │
                │  Prod_TL21     │
                │  (Partagée)    │
                └────────────────┘
```

---

## 3. CONNEXION À LA BASE DE DONNÉES HFSQL

La connexion à la base de données HFSQL existante est le pilier de cette architecture. L'approche recommandée est l'utilisation du **driver ODBC fourni par PC Soft**.

### 3.1 Stratégie de Connexion (ODBC)

Cette stratégie permet une coexistence transparente entre l'ancienne et la nouvelle application.

- **Avantages** :
  - **Source de Données Unique** : Évite les problèmes de synchronisation entre deux bases de données.
  - **Coexistence Transparente** : Les applications WinDev et Web peuvent fonctionner simultanément sur les mêmes données.
  - **Standardisation** : Le backend utilise des requêtes SQL standard, le rendant agnostique à la source de données sous-jacente.

- **Mise en œuvre** :
  1. **Installer le driver ODBC HFSQL** sur la machine hébergeant le serveur Node.js.
  2. **Configurer une source de données (DSN)** pointant vers le serveur et les fichiers de la base HFSQL.
  3. **Utiliser un package Node.js** comme `odbc` pour se connecter au DSN et exécuter des requêtes SQL.

> Pour plus de détails, consultez le document : **[STRATEGIE_CONNEXION_HFSQL.md](./STRATEGIE_CONNEXION_HFSQL.md)**

### 3.2 Mapping des Données

Le backend se chargera de mapper les types de données HFSQL vers des types JavaScript/JSON standards.

| Champ HFSQL | Type HFSQL | Type SQL (via ODBC) | Type TypeScript (Frontend) |
|---|---|---|---|
| `IDProd_TL21` | Entier auto | INTEGER | `number` |
| `Date` | Date | DATE | `string` (ISO 8601) |
| `Client` | Chaîne | VARCHAR(255) | `string` |
| `QTEREST` | Réel | DECIMAL(10,2) | `number` |
| `Version` | DateHeure | DATETIME | `string` (ISO 8601) |
| `admin` | Booléen | BOOLEAN | `boolean` |

---

## 4. INTERFACE UTILISATEUR (MAQUETTES)

L'interface sera entièrement repensée pour offrir une expérience utilisateur moderne, intuitive et axée sur la collaboration.

> Pour une vue détaillée, consultez le document : **[MAQUETTES_INTERFACE_TL21.md](./MAQUETTES_INTERFACE_TL21.md)**

### 4.1 Écran Principal (Maquette 1)

- **Tableau de production central** avec tri, filtrage et pagination.
- **Indicateurs de présence** montrant en temps réel qui édite quelle ligne.
- **Notifications non intrusives** via un panneau et un compteur.

![Maquette de l'écran principal](/home/ubuntu/maquettes/01_ecran_principal.png)

### 4.2 Édition et Conflits (Maquette 2)

- **Modal d'édition complet** pour modifier une ligne.
- **Gestion des conflits** : Un avertissement clair est affiché si un autre utilisateur a modifié la ligne, mais l'enregistrement n'est pas bloqué, conformément aux préférences.

![Maquette de l'édition de ligne](/home/ubuntu/maquettes/02_edition_ligne.png)

### 4.3 Notifications Temps Réel (Maquette 3)

- **Panneau de notifications** listant les activités récentes.
- **Toasts de notification** pour les mises à jour importantes, qui disparaissent automatiquement.
- **Indicateurs visuels** (lueur, avatars) pour mettre en évidence les changements.

![Maquette des notifications](/home/ubuntu/maquettes/03_notifications_temps_reel.png)

### 4.4 Gestion des Documents (Maquette 4)

- **Visionneuse de documents intégrée** (PDF, images) pour éviter de quitter l'application.
- **Upload et gestion des métadonnées** pour une organisation claire.

![Maquette de la gestion des documents](/home/ubuntu/maquettes/04_gestion_documents.png)

### 4.5 Dashboard (Maquette 5)

- **Tableau de bord avec des KPIs** (indicateurs de performance clés) et des graphiques pour visualiser l'état de la production en un coup d'œil.

![Maquette du dashboard](/home/ubuntu/maquettes/05_dashboard_statistiques.png)

---

## 5. SYNCHRONISATION TEMPS RÉEL (WEBSOCKETS)

Le système de synchronisation sera entièrement modernisé en utilisant **WebSockets** (via la librairie Socket.io), remplaçant l'ancien système basé sur des Sockets TCP/IP.

### 5.1 Flux de Synchronisation

1.  **Action Utilisateur** : Un utilisateur (via l'interface React) modifie une donnée.
2.  **Requête API** : Le frontend envoie une requête `POST`, `PUT`, ou `DELETE` à l'API REST du backend Node.js.
3.  **Mise à jour de la Base de Données** : Le backend valide les données et exécute la requête SQL correspondante sur la base HFSQL via ODBC.
4.  **Diffusion WebSocket** : Après confirmation de la mise à jour en base de données, le backend émet un événement WebSocket (ex: `production:update`) à **tous les clients connectés**, y compris celui qui a initié l'action.
5.  **Mise à jour des Interfaces** : Tous les frontends reçoivent l'événement WebSocket et mettent à jour leur état local (par exemple, la table de production), rafraîchissant l'interface pour tous les utilisateurs en temps réel.

### 5.2 Gestion de la Présence et de l'Édition

- Lorsque qu'un utilisateur commence à éditer une ligne, le frontend envoie un événement WebSocket `editing:start`.
- Le backend diffuse cet événement à tous les autres clients, qui affichent alors un indicateur visuel (avatar) sur la ligne concernée.
- Un événement `editing:stop` est envoyé lorsque l'utilisateur quitte le mode édition.

### 5.3 Avantages par rapport aux Sockets TCP/IP

- **Natif au Web** : Fonctionne sur le port 80/443, évitant les problèmes de pare-feu souvent rencontrés avec des ports personnalisés comme le 5000.
- **Plus Léger** : Moins de surcharge de communication que des requêtes HTTP répétées (polling).
- **Gestion Automatique** : Socket.io gère automatiquement les reconnexions, la détection de déconnexion et la compatibilité entre navigateurs.
- **Pas d'élection de serveur** : Le serveur web est par nature le point central, simplifiant l'architecture client-serveur.

---

## 6. CONCLUSION

Cette architecture permet une **modernisation complète de l'application TL21** tout en **capitalisant sur l'existant** (la base de données HFSQL). Elle offre une expérience utilisateur grandement améliorée, une maintenance simplifiée et une plateforme évolutive pour les futurs besoins de MH-INDUSTRIES.

Le passage à une stack web standard (React, Node.js) ouvre également la porte à de futures évolutions comme une application mobile ou des intégrations avec d'autres services via des APIs.
