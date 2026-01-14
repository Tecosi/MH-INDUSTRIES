# 🚀 PROMPT DE DÉMARRAGE - PROJET TL21 WEB

**À copier-coller dans une nouvelle conversation Manus pour démarrer le développement**

---

## 📋 PROMPT

```
Bonjour ! Je souhaite développer une application web moderne pour remplacer mon application WinDev TL21 (Gestion de Production avec synchronisation multi-utilisateurs).

### 🎯 CONTEXTE

J'ai une application WinDev existante (TL21) qui gère la production en temps réel avec :
- Base de données HFSQL Classic (partagée sur réseau local)
- Synchronisation multi-utilisateurs via Sockets TCP/IP (port 5000)
- Verrouillage optimiste pour éviter les conflits
- Gestion de documents (PDF, plans techniques)
- Filtres et recherche avancée

### 🎨 DOCUMENTATION EXISTANTE

J'ai déjà créé :
1. **5 maquettes d'interface** (design moderne, Material Design 3)
2. **Stratégie de connexion HFSQL** (via ODBC)
3. **Architecture technique complète** (React + Node.js + Socket.io)
4. **Code source WinDev extrait** (59 fichiers .wl, ~16 000 lignes)

Tout est disponible sur GitHub : https://github.com/Tecosi/MH-INDUSTRIES

### 🛠️ STACK TECHNIQUE VALIDÉE

- **Frontend** : React + TypeScript + TailwindCSS
- **Backend** : Node.js + Express + Socket.io
- **Base de données** : HFSQL Classic (via driver ODBC)
- **Temps réel** : WebSockets (Socket.io)

### 📊 STRUCTURE DE LA BASE HFSQL

**Table principale : Prod_TL21**
- IDProd_TL21 (Entier auto, clé primaire)
- Date (Date de production)
- Ordre (Entier, ordre de priorité)
- Client, Affaire, Commande, PIECE, DESA (Chaînes)
- QTEREST (Réel, quantité)
- Couleur (Chaîne : J/V/C)
- Observations (Texte)
- Doc (Texte, liste de documents)
- Modifie_par (Chaîne, utilisateur)
- Version (DateHeure, pour verrouillage optimiste)

**Table utilisateurs : Users_TL21**
- login (Chaîne, USERNAME Windows)
- admin (Booléen)

### 🎯 OBJECTIF DE CETTE SESSION

Je veux que tu crées un **prototype fonctionnel** de l'application web TL21 avec :

1. **Configuration du projet**
   - Initialiser le projet React + TypeScript + TailwindCSS
   - Configurer le backend Node.js + Express
   - Installer et configurer Socket.io

2. **Connexion à la base HFSQL**
   - Configurer le driver ODBC HFSQL
   - Créer le module de connexion à la base
   - Tester la lecture/écriture sur Prod_TL21

3. **Écran principal (Maquette 1)**
   - Table de production interactive
   - Filtres (Client, Affaire, Couleur)
   - Recherche globale
   - Pagination
   - Actions (Éditer, Supprimer)

4. **Synchronisation temps réel**
   - WebSocket serveur (Socket.io)
   - Diffusion des modifications à tous les clients
   - Indicateurs de présence (avatars sur lignes en édition)
   - Notifications non intrusives

5. **Gestion des conflits**
   - Verrouillage optimiste basé sur le champ Version
   - Avertissement si modification concurrente (mais pas de blocage)
   - Saisie concurrente autorisée

### ⚠️ PRÉFÉRENCES IMPORTANTES

**Notifications** :
- ✅ Pas de popup bloquante
- ✅ Compteur de modifications en attente (badge orange)
- ✅ Panneau de notifications déroulant
- ✅ Toast éphémère pour les actions importantes
- ✅ Accumulation des modifications pour opérations en masse (1 seul toast à la fin)

**Collaboration** :
- ✅ Saisie concurrente autorisée (pas de blocage)
- ✅ Avertissement visible si conflit potentiel
- ✅ Indicateurs visuels de présence (avatars)
- ✅ La saisie ne doit jamais être interrompue

**Ajout de ligne** :
- ✅ Enregistré en base sans notification aux autres utilisateurs
- ✅ Pas de toast pour les ajouts (seulement pour les modifications)

### 📁 FICHIERS DE RÉFÉRENCE

Tu auras besoin de consulter ces fichiers sur GitHub :
- `TL21/TL21_Source/` : Code source WinDev complet
- `TL21/docs/DOCUMENTATION_TECHNIQUE_TL21.md` : Architecture détaillée
- Maquettes d'interface (que je peux te fournir si besoin)

### 🚀 PAR OÙ COMMENCER ?

1. Clone le dépôt GitHub : `gh repo clone Tecosi/MH-INDUSTRIES`
2. Crée un nouveau dossier `TL21_Web/` dans le projet
3. Initialise le projet React + Node.js
4. Configure la connexion ODBC à la base HFSQL
5. Implémente l'écran principal avec la table de production

### ❓ QUESTIONS

Avant de commencer, as-tu besoin de :
- Voir les maquettes d'interface ?
- Plus de détails sur la structure de la base HFSQL ?
- Des exemples de code du projet WinDev existant ?

Merci ! 🚀
```

---

## 📝 NOTES POUR LA PROCHAINE SESSION

### Informations Clés à Fournir

1. **Accès à la base HFSQL**
   - Chemin réseau de la base : `\\SERVEUR\Partage\Base\HFSQL\`
   - IP du serveur : `192.168.100.34`
   - Port HFSQL : `4900` (par défaut)

2. **Configuration ODBC**
   - DSN à créer : `HFSQL_TL21`
   - Driver : HFSQL ODBC Driver (à installer depuis PC Soft)

3. **Environnement de Développement**
   - Node.js version : 22.13.0 (déjà installé dans le sandbox)
   - Package manager : pnpm (recommandé)

### Fichiers à Avoir Sous la Main

- Maquettes PNG (5 fichiers)
- Documentation technique complète
- Stratégie de connexion HFSQL
- Code source WinDev (pour référence)

### Ordre de Développement Recommandé

1. **Phase 1 : Configuration (1-2h)**
   - Initialiser le projet
   - Configurer ODBC
   - Tester la connexion à HFSQL

2. **Phase 2 : Backend API (2-3h)**
   - Routes REST pour CRUD sur Prod_TL21
   - Serveur WebSocket
   - Gestion de l'authentification basique

3. **Phase 3 : Frontend Écran Principal (3-4h)**
   - Composant Table de production
   - Filtres et recherche
   - Pagination
   - Intégration WebSocket

4. **Phase 4 : Temps Réel (2-3h)**
   - Indicateurs de présence
   - Notifications
   - Gestion des conflits

5. **Phase 5 : Tests et Déploiement (1-2h)**
   - Tests de synchronisation
   - Tests de charge (plusieurs utilisateurs)
   - Documentation de déploiement

### Commandes Utiles

```bash
# Cloner le dépôt
gh repo clone Tecosi/MH-INDUSTRIES

# Créer le projet React
cd TL21_Web
npx create-react-app frontend --template typescript
cd frontend
npm install tailwindcss @tailwindcss/forms
npm install socket.io-client axios react-router-dom

# Créer le backend Node.js
cd ../backend
npm init -y
npm install express socket.io odbc cors dotenv
npm install --save-dev typescript @types/node @types/express nodemon

# Démarrer le développement
npm run dev  # Backend
npm start    # Frontend
```

### Variables d'Environnement (.env)

```env
# Backend
PORT=3000
HFSQL_CONNECTION_STRING=DSN=HFSQL_TL21;SERVER=192.168.100.34;PORT=4900;DATABASE=C:\\Base\\HFSQL
JWT_SECRET=votre_secret_jwt_ici

# Frontend
REACT_APP_API_URL=http://localhost:3000
REACT_APP_WS_URL=ws://localhost:3000
```

---

## 🎯 RÉSULTAT ATTENDU

À la fin de la session, tu devrais avoir :

1. ✅ **Application fonctionnelle** accessible via `http://localhost:3000`
2. ✅ **Connexion à HFSQL** opérationnelle
3. ✅ **Écran principal** avec table de production
4. ✅ **Synchronisation temps réel** entre plusieurs onglets/utilisateurs
5. ✅ **Notifications** conformes aux préférences
6. ✅ **Code propre et commenté** prêt pour la production

---

## 📞 SUPPORT

Si tu rencontres des problèmes :

1. **Driver ODBC HFSQL** : Téléchargeable sur le site PC Soft
2. **Documentation HFSQL** : https://doc.pcsoft.fr
3. **Code source WinDev** : Disponible dans `TL21/TL21_Source/`
4. **Architecture technique** : Voir `ARCHITECTURE_TECHNIQUE_TL21_WEB.md`

---

**Bon développement ! 🚀**
