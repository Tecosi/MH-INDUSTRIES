# 🌐 TL21 Web - Application de Gestion de Production Moderne

**Projet** : Migration de l'application WinDev TL21 vers une application web moderne  
**Date** : Janvier 2026  
**Statut** : 📋 Phase de Conception Terminée - Prêt pour le Développement

---

## 🎯 Description

TL21 Web est une **application web moderne** destinée à remplacer l'application WinDev TL21 existante tout en conservant la base de données HFSQL comme source unique de données.

L'application offre une interface utilisateur moderne, une synchronisation temps réel améliorée via WebSockets, et une accessibilité multi-plateforme via un simple navigateur web.

---

## 📦 Contenu du Projet

### 📁 Structure

```
TL21_Web/
├── README.md                    # Ce fichier
├── docs/                        # Documentation technique
│   ├── STRATEGIE_CONNEXION_HFSQL.md
│   ├── ARCHITECTURE_TECHNIQUE_TL21_WEB.md
│   └── MAQUETTES_INTERFACE_TL21.md
├── maquettes/                   # Maquettes d'interface (PNG)
│   ├── 01_ecran_principal.png
│   ├── 02_edition_ligne.png
│   ├── 03_notifications_temps_reel.png
│   ├── 04_gestion_documents.png
│   └── 05_dashboard_statistiques.png
└── prompts/                     # Prompts pour démarrer le développement
    ├── PROMPT_DEMARRAGE_TL21_WEB.md
    └── PROMPT_COURT_TL21_WEB.txt
```

---

## 🎨 Maquettes d'Interface

Cinq maquettes professionnelles ont été créées pour visualiser l'application finale :

| Maquette | Description |
|----------|-------------|
| **01_ecran_principal.png** | Table de production avec filtres, recherche et indicateurs temps réel |
| **02_edition_ligne.png** | Modal d'édition avec gestion des conflits |
| **03_notifications_temps_reel.png** | Système de notifications non intrusif |
| **04_gestion_documents.png** | Visionneuse de documents intégrée |
| **05_dashboard_statistiques.png** | Tableau de bord avec KPIs et graphiques |

**Voir** : [`maquettes/`](./maquettes/) pour les images complètes

---

## 📚 Documentation

### 🔌 Stratégie de Connexion HFSQL

**Fichier** : [`docs/STRATEGIE_CONNEXION_HFSQL.md`](./docs/STRATEGIE_CONNEXION_HFSQL.md)

Explique en détail comment connecter l'application web à la base HFSQL existante via le driver ODBC :

- **Option recommandée** : Driver ODBC HFSQL (PC Soft)
- **Avantages** : Pas de migration, coexistence avec WinDev
- **Code d'exemple** : Configuration ODBC, connexion Node.js, API REST
- **Mapping des données** : Correspondance HFSQL ↔ TypeScript

### 🏗️ Architecture Technique

**Fichier** : [`docs/ARCHITECTURE_TECHNIQUE_TL21_WEB.md`](./docs/ARCHITECTURE_TECHNIQUE_TL21_WEB.md)

Architecture complète de l'application web :

- **Stack** : React + TypeScript + Node.js + Express + Socket.io
- **Schémas** : Diagrammes d'architecture et flux de données
- **Synchronisation** : WebSockets (Socket.io) pour le temps réel
- **Gestion des conflits** : Verrouillage optimiste avec avertissements

### 🎨 Documentation des Maquettes

**Fichier** : [`docs/MAQUETTES_INTERFACE_TL21.md`](./docs/MAQUETTES_INTERFACE_TL21.md)

Description détaillée de chaque maquette avec :

- Éléments clés de chaque écran
- Fonctionnalités implémentées
- Charte graphique (couleurs, typographie, espacements)
- Conformité avec les préférences utilisateur

---

## 🛠️ Stack Technologique

| Composant | Technologie | Rôle |
|-----------|-------------|------|
| **Frontend** | React + TypeScript | Interface utilisateur interactive et typée |
| **Styling** | TailwindCSS | Framework CSS moderne |
| **Backend** | Node.js + Express | Serveur d'API REST |
| **Temps Réel** | Socket.io | Communication bidirectionnelle WebSocket |
| **Base de Données** | HFSQL Classic (via ODBC) | Source de données existante |

---

## 📊 Base de Données

### Table Principale : Prod_TL21

| Champ | Type | Description |
|-------|------|-------------|
| `IDProd_TL21` | INTEGER | Identifiant unique (clé primaire) |
| `Date` | DATE | Date de production prévue |
| `Ordre` | INTEGER | Ordre de priorité |
| `Client` | VARCHAR(255) | Nom du client |
| `Affaire` | VARCHAR(255) | Numéro d'affaire |
| `Commande` | VARCHAR(255) | Numéro de commande |
| `PIECE` | VARCHAR(255) | Référence de la pièce |
| `DESA` | VARCHAR(255) | Désignation |
| `QTEREST` | DECIMAL(10,2) | Quantité restante |
| `Couleur` | VARCHAR(10) | Codification couleur (J/V/C) |
| `Observations` | TEXT | Observations diverses |
| `Doc` | TEXT | Liste des documents |
| `Modifie_par` | VARCHAR(255) | Utilisateur ayant modifié |
| `Version` | DATETIME | Version (verrouillage optimiste) |

### Table Utilisateurs : Users_TL21

| Champ | Type | Description |
|-------|------|-------------|
| `login` | VARCHAR(255) | Nom d'utilisateur (USERNAME Windows) |
| `admin` | BOOLEAN | Droits administrateur |

---

## 🚀 Démarrer le Développement

### Prérequis

- ✅ Node.js 22+ installé
- ✅ Driver ODBC HFSQL installé
- ✅ Accès à la base HFSQL (réseau local)
- ✅ Git configuré avec accès au dépôt

### Option 1 : Prompt Complet (Recommandé)

Pour une session de développement complète et structurée :

1. Ouvrir une **nouvelle conversation Manus**
2. Copier-coller le contenu de [`prompts/PROMPT_DEMARRAGE_TL21_WEB.md`](./prompts/PROMPT_DEMARRAGE_TL21_WEB.md)
3. Suivre les instructions de l'IA

### Option 2 : Prompt Court

Pour un démarrage rapide :

1. Ouvrir une **nouvelle conversation Manus**
2. Copier-coller le contenu de [`prompts/PROMPT_COURT_TL21_WEB.txt`](./prompts/PROMPT_COURT_TL21_WEB.txt)
3. L'IA démarrera avec l'essentiel

---

## ✨ Fonctionnalités Clés

### 🔄 Synchronisation Temps Réel

- **WebSockets** : Communication bidirectionnelle instantanée
- **Indicateurs de présence** : Avatars sur les lignes en édition
- **Notifications** : Système non intrusif avec compteur et panneau
- **Gestion des conflits** : Avertissement mais pas de blocage

### 📋 Gestion de la Production

- **Table interactive** : Tri, filtrage, recherche, pagination
- **Édition en ligne** : Modal d'édition complet
- **Actions rapides** : Éditer, Supprimer depuis la table
- **Verrouillage optimiste** : Basé sur le champ Version

### 📄 Documents Techniques

- **Upload de fichiers** : PDF, images, documents
- **Visionneuse intégrée** : Affichage dans le navigateur
- **Métadonnées** : Informations complètes et tags
- **Recherche** : Par nom, type, date

### 📊 Statistiques et Reporting

- **KPIs en temps réel** : 4 métriques clés
- **Graphiques** : Barres, donut, sparklines
- **Timeline d'activité** : Historique des actions
- **Tendances** : Évolution des métriques

---

## ⚙️ Préférences UX Importantes

### Notifications Non Intrusives

✅ **Compteur de modifications** : Badge orange en haut à droite  
✅ **Panneau de notifications** : Déroulant, non bloquant  
✅ **Toast éphémères** : Disparaissent automatiquement  
✅ **Accumulation** : 1 seul toast pour opérations en masse  

### Collaboration Sans Blocage

✅ **Saisie concurrente autorisée** : Pas de blocage  
✅ **Avertissement si conflit** : Visible mais pas bloquant  
✅ **Indicateurs visuels** : Avatars sur lignes en édition  
✅ **Pas d'interruption** : La saisie n'est jamais interrompue  

### Ajout de Ligne

✅ **Enregistrement silencieux** : Pas de notification aux autres  
✅ **Pas de toast** : Seulement pour les modifications  

---

## 📈 Roadmap

### Phase 1 : Configuration ✅ (Terminée)
- ✅ Maquettes d'interface créées
- ✅ Architecture technique validée
- ✅ Stratégie de connexion HFSQL définie
- ✅ Documentation complète rédigée

### Phase 2 : Développement Backend ⏳ (À venir)
- ⏳ Configuration du projet Node.js + Express
- ⏳ Connexion ODBC à la base HFSQL
- ⏳ API REST pour CRUD sur Prod_TL21
- ⏳ Serveur WebSocket (Socket.io)

### Phase 3 : Développement Frontend ⏳ (À venir)
- ⏳ Configuration du projet React + TypeScript
- ⏳ Composant Table de production
- ⏳ Filtres, recherche, pagination
- ⏳ Intégration WebSocket

### Phase 4 : Synchronisation Temps Réel ⏳ (À venir)
- ⏳ Indicateurs de présence
- ⏳ Système de notifications
- ⏳ Gestion des conflits
- ⏳ Tests multi-utilisateurs

### Phase 5 : Fonctionnalités Avancées ⏳ (À venir)
- ⏳ Gestion des documents
- ⏳ Dashboard statistiques
- ⏳ Authentification JWT
- ⏳ Tests et déploiement

---

## 🔗 Liens Utiles

- **Projet GitHub** : https://github.com/Tecosi/MH-INDUSTRIES
- **Application WinDev (code source)** : [`../TL21/TL21_Source/`](../TL21/TL21_Source/)
- **Documentation technique WinDev** : [`../TL21/docs/`](../TL21/docs/)

---

## 📝 Licence

© 2026 MH-INDUSTRIES - Tous droits réservés

---

## 📞 Support

Pour toute question sur le projet TL21 Web :
- **GitHub Issues** : https://github.com/Tecosi/MH-INDUSTRIES/issues
- **Service Informatique** : support@mh-industries.fr

---

**Version** : 1.0 (Phase de Conception)  
**Date** : Janvier 2026  
**Statut** : 📋 Prêt pour le Développement

---

**🚀 Prêt à transformer TL21 en application web moderne !**
