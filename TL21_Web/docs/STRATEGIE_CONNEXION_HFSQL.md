# 🔌 STRATÉGIE DE CONNEXION À LA BASE HFSQL EXISTANTE

**Projet** : TL21 Web - Migration vers Application Web Moderne  
**Base de données source** : HFSQL Classic (existante)  
**Objectif** : Conserver la base HFSQL comme source de données unique

---

## 🎯 APPROCHES POSSIBLES

### Option 1 : ODBC/JDBC vers HFSQL ✅ **RECOMMANDÉ**

WinDev/HFSQL fournit un **driver ODBC** qui permet à n'importe quelle application externe de se connecter à une base HFSQL.

#### Avantages
- ✅ **Pas de migration de données** : La base HFSQL reste la source unique
- ✅ **Compatibilité totale** : L'application WinDev existante continue de fonctionner
- ✅ **Accès SQL standard** : Requêtes SQL classiques depuis Node.js
- ✅ **Temps réel** : Modifications visibles immédiatement dans les deux applications
- ✅ **Pas de synchronisation** : Une seule base de données

#### Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    RÉSEAU LOCAL (LAN)                       │
│                                                             │
│  ┌──────────────────┐         ┌──────────────────┐        │
│  │  Application     │         │  Application     │        │
│  │  WinDev TL21     │         │  Web TL21        │        │
│  │  (Existante)     │         │  (Nouvelle)      │        │
│  └────────┬─────────┘         └────────┬─────────┘        │
│           │                            │                   │
│           │  HFSQL Native             │  ODBC/SQL         │
│           │                            │                   │
│           └────────────┬───────────────┘                   │
│                        │                                   │
│                ┌───────▼────────┐                         │
│                │  Base HFSQL    │                         │
│                │  Prod_TL21     │                         │
│                │  (Partagée)    │                         │
│                └────────────────┘                         │
└─────────────────────────────────────────────────────────────┘
```

#### Configuration ODBC

**1. Installation du driver HFSQL ODBC**
- Inclus avec WinDev ou téléchargeable depuis PC Soft
- Installation sur le serveur Node.js

**2. Configuration de la source de données ODBC**

```ini
[HFSQL_TL21]
Driver=HFSQL ODBC Driver
Server=192.168.100.34
Port=4900
Database=C:\Chemin\Vers\Base\HFSQL
User=
Password=
```

**3. Connexion depuis Node.js**

```javascript
// Utilisation du package 'odbc' pour Node.js
const odbc = require('odbc');

const connectionString = 
  'DSN=HFSQL_TL21;' +
  'SERVER=192.168.100.34;' +
  'PORT=4900;' +
  'DATABASE=C:\\Chemin\\Vers\\Base\\HFSQL';

const connection = await odbc.connect(connectionString);

// Requête SQL standard
const result = await connection.query(
  'SELECT * FROM Prod_TL21 WHERE Date = ?',
  [new Date()]
);
```

---

### Option 2 : WebService HFSQL ✅ **ALTERNATIVE PROPRE**

Créer un **WebService WinDev** qui expose la base HFSQL via REST API.

#### Avantages
- ✅ **Contrôle total** : Logique métier dans WinDev
- ✅ **Sécurité renforcée** : Pas d'accès direct à la base
- ✅ **API REST standard** : Facile à consommer depuis Node.js
- ✅ **Validation côté serveur** : Règles métier centralisées

#### Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    RÉSEAU LOCAL (LAN)                       │
│                                                             │
│  ┌──────────────────┐         ┌──────────────────┐        │
│  │  Application     │         │  Application     │        │
│  │  WinDev TL21     │         │  Web TL21        │        │
│  │  (Existante)     │         │  (Nouvelle)      │        │
│  └────────┬─────────┘         └────────┬─────────┘        │
│           │                            │                   │
│           │  HFSQL Native             │  HTTP REST        │
│           │                            │                   │
│           │                    ┌───────▼────────┐         │
│           │                    │  WebService    │         │
│           │                    │  WinDev        │         │
│           │                    │  (REST API)    │         │
│           │                    └───────┬────────┘         │
│           │                            │                   │
│           └────────────┬───────────────┘                   │
│                        │                                   │
│                ┌───────▼────────┐                         │
│                │  Base HFSQL    │                         │
│                │  Prod_TL21     │                         │
│                └────────────────┘                         │
└─────────────────────────────────────────────────────────────┘
```

#### Exemple WebService WinDev

```wlangage
// Procédure WebService : ws_GetProduction
PROCÉDURE ws_GetProduction(dDate est une Date)
    // Lecture depuis HFSQL
    HLitRecherche(Prod_TL21, Date, dDate)
    
    // Construction du JSON
    sJSON est une chaîne = "["
    POUR TOUT Prod_TL21
        sJSON += [
            {
                "id": %1,
                "date": "%2",
                "client": "%3",
                "affaire": "%4",
                "piece": "%5",
                "qte": %6
            },
        ]
        sJSON = ChaîneConstruit(sJSON, 
            Prod_TL21.IDProd_TL21,
            DateVersChaîne(Prod_TL21.Date, "AAAA-MM-JJ"),
            Prod_TL21.Client,
            Prod_TL21.Affaire,
            Prod_TL21.PIECE,
            Prod_TL21.QTEREST
        )
    FIN
    sJSON += "]"
    
    RENVOYER sJSON
FIN
```

#### Consommation depuis Node.js

```javascript
// Appel du WebService WinDev
const response = await fetch('http://192.168.100.34:8080/ws_GetProduction', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ date: '2026-01-14' })
});

const production = await response.json();
```

---

### Option 3 : Synchronisation Bidirectionnelle ⚠️ **COMPLEXE**

Créer une base PostgreSQL/MySQL et synchroniser avec HFSQL.

#### Avantages
- ✅ **Performance optimale** : Base SQL moderne
- ✅ **Indépendance** : Pas de dépendance à HFSQL

#### Inconvénients
- ❌ **Complexité élevée** : Synchronisation bidirectionnelle difficile
- ❌ **Risque de conflits** : Deux sources de vérité
- ❌ **Maintenance lourde** : Deux bases à gérer

**Non recommandé** pour ce projet.

---

## 🎯 RECOMMANDATION FINALE

### **Option 1 : ODBC vers HFSQL** 👑

C'est la solution **la plus simple et la plus fiable** pour votre cas :

#### Pourquoi ?

1. **Pas de migration** : La base HFSQL reste intacte
2. **Coexistence** : WinDev et Web fonctionnent ensemble
3. **Temps réel** : Modifications instantanées dans les deux apps
4. **Simple** : Connexion ODBC standard
5. **Éprouvé** : Technologie mature et stable

#### Architecture Technique Détaillée

```
┌─────────────────────────────────────────────────────────────┐
│                    SERVEUR NODE.JS                          │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  Application Web (React)                             │  │
│  │  - Interface utilisateur moderne                     │  │
│  │  - WebSocket client pour temps réel                  │  │
│  └───────────────────┬──────────────────────────────────┘  │
│                      │ HTTP/WebSocket                      │
│  ┌───────────────────▼──────────────────────────────────┐  │
│  │  Backend API (Node.js + Express)                     │  │
│  │  - Routes REST pour CRUD                             │  │
│  │  - WebSocket serveur (Socket.io)                     │  │
│  │  - Authentification JWT                              │  │
│  └───────────────────┬──────────────────────────────────┘  │
│                      │ ODBC                                │
│  ┌───────────────────▼──────────────────────────────────┐  │
│  │  Driver ODBC HFSQL                                   │  │
│  │  - Connexion à la base HFSQL                         │  │
│  │  - Requêtes SQL standard                             │  │
│  └───────────────────┬──────────────────────────────────┘  │
└────────────────────────┼──────────────────────────────────┘
                         │ Réseau Local
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

## 🔧 IMPLÉMENTATION TECHNIQUE

### 1. Configuration HFSQL

#### Activer l'accès ODBC sur la base HFSQL

Dans WinDev, configurer la base pour accepter les connexions ODBC :

```wlangage
// Analyse HFSQL : Propriétés de la base
// ✅ Autoriser l'accès ODBC
// ✅ Autoriser l'accès SQL
```

### 2. Installation du Driver ODBC

Sur le serveur Node.js (Windows ou Linux) :

**Windows** :
- Installer le driver HFSQL ODBC depuis PC Soft
- Configurer la source de données dans "Gestionnaire de sources de données ODBC"

**Linux** :
- Installer unixODBC : `sudo apt-get install unixodbc`
- Installer le driver HFSQL ODBC pour Linux
- Configurer `/etc/odbc.ini`

### 3. Backend Node.js

#### Installation des dépendances

```bash
npm install odbc express socket.io cors
```

#### Configuration de la connexion

```javascript
// config/database.js
const odbc = require('odbc');

const connectionString = process.env.HFSQL_CONNECTION_STRING || 
  'DSN=HFSQL_TL21;SERVER=192.168.100.34;PORT=4900;DATABASE=C:\\Base\\HFSQL';

let pool;

async function initDatabase() {
  pool = await odbc.pool(connectionString);
  console.log('✅ Connexion HFSQL établie');
  return pool;
}

async function query(sql, params = []) {
  const connection = await pool.connect();
  try {
    const result = await connection.query(sql, params);
    return result;
  } finally {
    await connection.close();
  }
}

module.exports = { initDatabase, query };
```

#### API REST pour Prod_TL21

```javascript
// routes/production.js
const express = require('express');
const router = express.Router();
const db = require('../config/database');

// GET : Récupérer la production d'une date
router.get('/production/:date', async (req, res) => {
  try {
    const { date } = req.params;
    
    const result = await db.query(
      'SELECT * FROM Prod_TL21 WHERE Date = ? ORDER BY Ordre',
      [date]
    );
    
    res.json(result);
  } catch (error) {
    console.error('Erreur lecture production:', error);
    res.status(500).json({ error: error.message });
  }
});

// POST : Ajouter une ligne de production
router.post('/production', async (req, res) => {
  try {
    const { date, client, affaire, piece, qte, couleur } = req.body;
    
    const result = await db.query(
      `INSERT INTO Prod_TL21 
       (Date, Client, Affaire, PIECE, QTEREST, Couleur, Modifie_par, Version) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
      [date, client, affaire, piece, qte, couleur, req.user.username, new Date()]
    );
    
    // Notifier tous les clients WebSocket
    io.emit('production:add', { id: result.insertId, ...req.body });
    
    res.json({ success: true, id: result.insertId });
  } catch (error) {
    console.error('Erreur ajout production:', error);
    res.status(500).json({ error: error.message });
  }
});

// PUT : Modifier une ligne de production
router.put('/production/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const updates = req.body;
    
    // Construire la requête UPDATE dynamiquement
    const fields = Object.keys(updates)
      .map(key => `${key} = ?`)
      .join(', ');
    
    const values = [...Object.values(updates), new Date(), req.user.username, id];
    
    await db.query(
      `UPDATE Prod_TL21 
       SET ${fields}, Version = ?, Modifie_par = ? 
       WHERE IDProd_TL21 = ?`,
      values
    );
    
    // Notifier tous les clients WebSocket
    io.emit('production:update', { id, ...updates });
    
    res.json({ success: true });
  } catch (error) {
    console.error('Erreur modification production:', error);
    res.status(500).json({ error: error.message });
  }
});

// DELETE : Supprimer une ligne de production
router.delete('/production/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    await db.query('DELETE FROM Prod_TL21 WHERE IDProd_TL21 = ?', [id]);
    
    // Notifier tous les clients WebSocket
    io.emit('production:delete', { id });
    
    res.json({ success: true });
  } catch (error) {
    console.error('Erreur suppression production:', error);
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
```

### 4. Synchronisation Temps Réel avec WebSocket

```javascript
// server.js
const express = require('express');
const http = require('http');
const socketIO = require('socket.io');
const db = require('./config/database');

const app = express();
const server = http.createServer(app);
const io = socketIO(server, {
  cors: { origin: '*' }
});

// Initialiser la base de données
db.initDatabase();

// WebSocket : Connexion client
io.on('connection', (socket) => {
  console.log(`✅ Client connecté: ${socket.id}`);
  
  // Notifier les autres clients
  socket.broadcast.emit('user:connected', {
    userId: socket.id,
    timestamp: new Date()
  });
  
  // Événement : Début d'édition
  socket.on('editing:start', (data) => {
    socket.broadcast.emit('editing:start', {
      userId: socket.id,
      recordId: data.recordId
    });
  });
  
  // Événement : Fin d'édition
  socket.on('editing:stop', (data) => {
    socket.broadcast.emit('editing:stop', {
      userId: socket.id,
      recordId: data.recordId
    });
  });
  
  // Déconnexion
  socket.on('disconnect', () => {
    console.log(`❌ Client déconnecté: ${socket.id}`);
    socket.broadcast.emit('user:disconnected', {
      userId: socket.id
    });
  });
});

// Démarrer le serveur
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(`🚀 Serveur démarré sur le port ${PORT}`);
});
```

---

## 📊 MAPPING DES TABLES HFSQL

### Table Prod_TL21

| Champ HFSQL | Type SQL | Type TypeScript | Description |
|-------------|----------|-----------------|-------------|
| `IDProd_TL21` | INTEGER | number | ID unique (clé primaire) |
| `Date` | DATE | Date | Date de production |
| `Ordre` | INTEGER | number | Ordre de priorité |
| `Client` | VARCHAR(255) | string | Nom du client |
| `Affaire` | VARCHAR(255) | string | Numéro d'affaire |
| `Commande` | VARCHAR(255) | string | Numéro de commande |
| `PIECE` | VARCHAR(255) | string | Référence pièce |
| `DESA` | VARCHAR(255) | string | Désignation |
| `QTEREST` | DECIMAL(10,2) | number | Quantité restante |
| `Couleur` | VARCHAR(10) | string | Codification couleur |
| `Observations` | TEXT | string | Observations |
| `Doc` | TEXT | string | Liste documents |
| `Modifie_par` | VARCHAR(255) | string | Utilisateur |
| `Version` | DATETIME | Date | Version (verrouillage) |

### Table Users_TL21

| Champ HFSQL | Type SQL | Type TypeScript | Description |
|-------------|----------|-----------------|-------------|
| `login` | VARCHAR(255) | string | Nom d'utilisateur |
| `admin` | BOOLEAN | boolean | Droits admin |

---

## ✅ AVANTAGES DE CETTE APPROCHE

1. **Coexistence parfaite** : WinDev et Web utilisent la même base
2. **Temps réel garanti** : Modifications visibles instantanément
3. **Pas de migration** : La base HFSQL reste intacte
4. **Simple à maintenir** : Une seule source de vérité
5. **Évolutif** : Facile d'ajouter d'autres applications

---

## 🚀 PROCHAINES ÉTAPES

1. ✅ **Installer le driver ODBC HFSQL** sur le serveur Node.js
2. ✅ **Configurer la source de données ODBC**
3. ✅ **Tester la connexion** avec un script Node.js simple
4. ✅ **Créer l'API REST** pour les opérations CRUD
5. ✅ **Implémenter les WebSockets** pour la synchronisation temps réel
6. ✅ **Créer l'interface web** (React)

---

**Cette stratégie garantit une transition en douceur vers une application web moderne tout en conservant votre infrastructure HFSQL existante !** 🎯
