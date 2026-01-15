# 🚨 Prompt Générique - Dépannage TL21 en Production

Bonjour ! J'ai un problème avec mon application **TL21** (WinDev 2025 - Gestion de Production multi-utilisateurs).

---

## 📋 Contexte de l'Application

### Architecture Technique
- **Langage** : WLangage (WinDev 2025)
- **Base de données** : HFSQL Classic (fichier réseau partagé)
- **Synchronisation** : Sockets TCP/IP (port 5000) + Triggers HFSQL
- **Verrouillage** : Optimiste avec champ `Version` (DateHeure)
- **Multi-utilisateurs** : Serveur socket + clients connectés

### Structure Principale
- **Table affichée** : `TABLE_Prod_TL21` (table fichier liée à `Prod_TL21`)
- **Fichier HFSQL** : `Prod_TL21` (table de production)
- **Classe mapping** : `MProd_TL21` (mapping HFSQL automatique)
- **Fenêtre principale** : `FEN_Principale`

### Champs Clés de Prod_TL21
- `IDProd_TL21` (entier 8 octets, clé unique, auto-incrémenté)
- `Version` (DateHeure, pour verrouillage optimiste)
- `Modifie_par` (chaîne, utilisateur qui modifie)
- `Ordre` (entier, ordre d'affichage)
- `Date`, `Client`, `Affaire`, `Commande`, `PIECE`, `DESA`, `QTEREST`, etc.

### Procédures Importantes
- `Socket_SauvegarderEnregistrement(nID, dhVersion)` : Sauvegarde avec gestion de conflits
- `EnregistrerLigneModifiee()` : Sauvegarde lors de la sortie de ligne
- `Socket_DiffuserMessage(sMessage, sSocketEmetteur)` : Diffusion aux clients
- `Socket_Envoyer(sAction, sData)` : Notification socket (add, update, delete, unlock)

### Variables Globales
- `gsUtilisateurActuel` : Nom de l'utilisateur connecté
- `gbSocketActif` : Indique si le socket est actif
- `gbEstServeur` : Indique si l'instance est le serveur
- `gtabClientsConnectes` : Tableau des sockets clients connectés
- `gsSemaphoreSocket` : Sémaphore pour protéger les écritures socket

### Corrections Récentes Appliquées
1. ✅ **Patch Socket 100121** : Gestion d'exception dans `Socket_DiffuserMessage`
2. ✅ **Patch Année Zéro (80123)** : Vérification avant `DateHeureVersChaîne`
3. ✅ **Patch Comparaison (1036)** : Variables booléennes pour éviter comparaison DateHeure vs Entier
4. ✅ **Sauvegarde automatique** : Événement "Sortie de ligne" appelle `EnregistrerLigneModifiee()`
5. ✅ **Duplication de lignes** : Méthode `Dupliquer()` dans classe `MProd_TL21`

### Dépôt GitHub
- **URL** : https://github.com/Tecosi/MH-INDUSTRIES
- **Code source** : `TL21/TL21_Source/` (59 fichiers .wl)
- **Documentation** : `TL21/docs/`
- **Patches** : `TL21/patches/`

---

## 🐛 Problème Actuel

### Description du Problème
[DÉCRIVEZ ICI VOTRE PROBLÈME]

Exemple :
- "J'ai une erreur quand je clique sur le bouton X"
- "La synchronisation ne fonctionne pas entre deux postes"
- "Les modifications d'un utilisateur ne sont pas visibles pour les autres"

### Message d'Erreur (si applicable)
```
[COPIEZ ICI LE MESSAGE D'ERREUR COMPLET]

Exemple :
Le mécanisme de sécurité du WLangage a détecté une erreur...
Code erreur : 12345
Pile des appels : ...
```

### Capture d'Écran (si disponible)
[JOINDRE UNE CAPTURE D'ÉCRAN SI POSSIBLE]

### Code Concerné (si connu)
```wl
[COPIEZ ICI LE CODE QUI POSE PROBLÈME]
```

### Étapes pour Reproduire
1. [Étape 1]
2. [Étape 2]
3. [Erreur se produit]

### Comportement Attendu
[CE QUI DEVRAIT SE PASSER]

### Comportement Actuel
[CE QUI SE PASSE RÉELLEMENT]

---

## 🎯 Ce dont j'ai besoin

- [ ] Diagnostic de l'erreur
- [ ] Explication de la cause
- [ ] Code corrigé à copier-coller
- [ ] Instructions d'application étape par étape
- [ ] Recommandations pour éviter le problème à l'avenir

---

## 📊 Informations Complémentaires

### Environnement
- **Version WinDev** : 2025
- **Nombre d'utilisateurs** : [X postes]
- **Réseau** : [Local / VPN / etc.]
- **Serveur socket** : [IP ou nom machine]

### Contexte d'Utilisation
- **Quand l'erreur se produit** : [Au démarrage / Lors d'une action / Aléatoire]
- **Fréquence** : [Toujours / Parfois / Rare]
- **Impact** : [Bloquant / Gênant / Mineur]

### Tests Déjà Effectués
- [ ] Redémarrage de l'application
- [ ] Vérification de la connexion réseau
- [ ] Test avec un seul utilisateur
- [ ] Consultation des logs

---

## 🔗 Références

- Documentation technique : `TL21/docs/DOCUMENTATION_TECHNIQUE_TL21.md`
- Guide utilisateur : `TL21/docs/GUIDE_UTILISATEUR_TL21.md`
- Rapport de nettoyage : `TL21/docs/RAPPORT_FINAL_NETTOYAGE_TL21.md`
- Patches appliqués : `TL21/patches/`

Merci de m'aider à résoudre ce problème ! 🙏

---

## 📝 Exemple d'Utilisation

```markdown
## 🐛 Problème Actuel

### Description du Problème
Quand je duplique une ligne avec le bouton BTN_AjoutLigne, j'obtiens une erreur de compilation.

### Message d'Erreur
```
L'élément 'HFichierVersEnregistrement' est inconnu ou inaccessible
Ligne 47 de la méthode Dupliquer()
```

### Code Concerné
```wl
// Ligne 47
HFichierVersEnregistrement(Prod_TL21, oNouvelle)
```

### Étapes pour Reproduire
1. Sélectionner une ligne dans TABLE_Prod_TL21
2. Cliquer sur BTN_AjoutLigne
3. Erreur de compilation

### Comportement Attendu
La ligne devrait être dupliquée avec un nouvel ID

### Comportement Actuel
Erreur de compilation, impossible de compiler le projet

## 🎯 Ce dont j'ai besoin
- [x] Diagnostic de l'erreur
- [x] Code corrigé à copier-coller
- [x] Instructions d'application
```
