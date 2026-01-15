# Patch TL21 - Erreur 100121 (v2)

**Date :** 15/01/2026  
**Auteur :** Manus AI  
**Objectif :** Corriger l'erreur de concurrence socket "Le socket est actuellement utilisée dans un autre thread".

---

## 📝 Description de la Correction

Ce patch remplace l'envoi direct de messages socket par une **architecture de file d'attente thread-safe**.

1.  **`Socket_Envoyer`** ajoute désormais les messages à une file d'attente globale (`gfileMessagesEnvoi`).
2.  Une **nouvelle procédure `Socket_ThreadEmission`** tourne en arrière-plan, récupère les messages de la file et les envoie de manière séquentielle.

Cela garantit qu'un seul thread accède à `SocketEcrit()` à la fois, éliminant ainsi les conflits de concurrence.

---

## 🛠️ Instructions d'Installation

Suivez ces étapes pour appliquer le patch :

### 1. Variables Globales

- **Ouvrez** la collection de procédures `Socket_Gestion` (ou vos déclarations globales).
- **Copiez-collez** le contenu du fichier `01_Variables_Globales.wl`.

### 2. Nouvelle Procédure : `Socket_ThreadEmission`

- **Créez** une nouvelle procédure globale dans `Socket_Gestion`.
- **Nommez-la** `Socket_ThreadEmission`.
- **Copiez-collez** le contenu du fichier `02_Socket_ThreadEmission.wl`.

### 3. Remplacer `Socket_Envoyer`

- **Ouvrez** la procédure existante `Socket_Envoyer`.
- **Supprimez** tout son contenu.
- **Copiez-collez** le contenu du fichier `03_Socket_Envoyer_REMPLACER.wl`.

### 4. Modifier `Socket_Initialiser`

- **Ouvrez** la procédure `Socket_Initialiser`.
- **Ajoutez** le contenu du fichier `04_Socket_Initialiser_AJOUTER.wl` juste avant la ligne `Socket_MettreAJourStatutUI()` (vers la fin de la procédure).

### 5. Modifier `Socket_Fermer`

- **Ouvrez** la procédure `Socket_Fermer`.
- **Ajoutez** le contenu du fichier `05_Socket_Fermer_AJOUTER.wl` au tout début de la procédure.

---

## ✅ Vérification

Après avoir appliqué toutes les modifications, **recompilez votre projet**. L'erreur 100121 ne devrait plus se produire.
