# 📗 GUIDE UTILISATEUR - TL21

**Application** : TL21 - Gestion de Production  
**Version** : 2.0  
**Date** : Janvier 2026

---

## 📋 TABLE DES MATIÈRES

1. [Introduction](#introduction)
2. [Démarrage de l'application](#démarrage-de-lapplication)
3. [Interface principale](#interface-principale)
4. [Gestion de la production](#gestion-de-la-production)
5. [Travail collaboratif](#travail-collaboratif)
6. [Consultation des documents](#consultation-des-documents)
7. [Recherche et filtres](#recherche-et-filtres)
8. [Trucs et astuces](#trucs-et-astuces)
9. [Résolution de problèmes](#résolution-de-problèmes)
10. [FAQ](#faq)

---

## 1. INTRODUCTION

### 1.1 Qu'est-ce que TL21 ?

TL21 est une application de **gestion de production** qui permet à plusieurs utilisateurs de travailler **simultanément** sur le planning de production, avec une **synchronisation automatique** des modifications en temps réel.

### 1.2 Fonctionnalités Principales

✅ **Planning de production** : Visualisation et modification du planning  
✅ **Synchronisation temps réel** : Les modifications sont visibles instantanément par tous  
✅ **Consultation de documents** : Accès aux plans et documents techniques  
✅ **Recherche avancée** : Filtres par affaire, pièce, client, etc.  
✅ **Gestion des incidents** : Suivi des incidents de production  

### 1.3 Nouveautés Version 2.0

🆕 **Synchronisation multi-utilisateurs** : Plus besoin de recharger manuellement !  
🆕 **Indicateurs visuels** : Voyez qui modifie quoi en temps réel  
🆕 **Connexion automatique** : Le premier utilisateur devient automatiquement le serveur  
🆕 **Protection des données** : Vos modifications ne seront jamais perdues  

---

## 2. DÉMARRAGE DE L'APPLICATION

### 2.1 Lancement

1. **Double-cliquer** sur l'icône TL21 sur votre bureau
2. L'application vérifie automatiquement votre identité
3. La connexion au réseau s'établit automatiquement

### 2.2 Écran de Démarrage

Au démarrage, vous verrez :

```
┌─────────────────────────────────────┐
│  🔄 Chargement en cours...          │
│                                     │
│  ✅ Utilisateur : votre_nom         │
│  ✅ Connexion réseau : OK           │
│  ✅ Base de données : OK            │
└─────────────────────────────────────┘
```

### 2.3 Statut de Connexion

En haut à droite de l'écran, vous verrez votre statut :

| Icône | Signification |
|-------|---------------|
| 🟢 **Serveur** | Vous êtes le premier connecté (serveur) |
| 🔵 **Client** | Vous êtes connecté au serveur |
| 🔄 **Réélection...** | Reconnexion en cours |
| 🔴 **Déconnecté** | Problème de connexion |

---

## 3. INTERFACE PRINCIPALE

### 3.1 Vue d'Ensemble

```
┌────────────────────────────────────────────────────────────────┐
│  TL21 - Gestion de Production          [Utilisateur: Vous] 🟢 │
├────────────────────────────────────────────────────────────────┤
│  [Date] [Filtres] [Recherche]                    [Incidents: 3]│
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐  │
│  │ Date │ Ordre │ Client │ Affaire │ Pièce │ ... │ Doc │   │  │
│  ├─────────────────────────────────────────────────────────┤  │
│  │ 14/01│  10   │ ACME   │ A12345  │ P001  │ ... │ 📄  │   │  │
│  │ 14/01│  20   │ BETA   │ B67890  │ P002  │ ... │ 📄📄│   │  │
│  │ 15/01│  30   │ GAMMA  │ G11111  │ P003  │ ... │     │   │  │
│  └─────────────────────────────────────────────────────────┘  │
│                                                                 │
├────────────────────────────────────────────────────────────────┤
│  [Onglets: Recherche | Affaires | Documents | PDF | ...]      │
└────────────────────────────────────────────────────────────────┘
```

### 3.2 Barre d'Outils

| Bouton | Fonction |
|--------|----------|
| **📅 Date** | Sélectionner la date de production |
| **➕ Ajouter** | Ajouter une nouvelle ligne |
| **❌ Supprimer** | Supprimer la ligne sélectionnée |
| **🔍 Rechercher** | Ouvrir la recherche avancée |
| **🎨 Couleurs** | Appliquer des couleurs (J/V/C) |
| **🔄 Actualiser** | Recharger les données |

### 3.3 Colonnes de la Table

| Colonne | Description | Éditable |
|---------|-------------|----------|
| **Date** | Date de production prévue | ✅ Oui |
| **Ordre** | Ordre de priorité | ✅ Oui |
| **Client** | Nom du client | ✅ Oui |
| **Affaire** | Numéro d'affaire | ✅ Oui |
| **Commande** | Numéro de commande | ✅ Oui |
| **Pièce** | Référence de la pièce | ✅ Oui |
| **Désignation** | Description de la pièce | ✅ Oui |
| **Qté Restante** | Quantité restante à produire | ✅ Oui |
| **Couleur** | Codification couleur (J/V/C) | ✅ Oui |
| **Observations** | Remarques diverses | ✅ Oui |
| **Doc** | Icônes de documents | ❌ Non |
| **Modifié par** | Dernier utilisateur | ❌ Non |

---

## 4. GESTION DE LA PRODUCTION

### 4.1 Ajouter une Ligne

1. Cliquer sur le bouton **➕ Ajouter**
2. Une nouvelle ligne apparaît en bas de la table
3. Remplir les champs obligatoires :
   - Date
   - Ordre
   - Client
   - Affaire
   - Pièce
4. Les autres champs sont optionnels
5. Sortir de la ligne pour sauvegarder automatiquement

💡 **Astuce** : La nouvelle ligne est automatiquement visible par tous les utilisateurs !

### 4.2 Modifier une Ligne

1. **Cliquer** sur la cellule à modifier
2. **Saisir** la nouvelle valeur
3. **Appuyer sur Tab ou Entrée** pour valider
4. La modification est **automatiquement sauvegardée**

⚠️ **Important** : Si un autre utilisateur modifie la même ligne, vous verrez un indicateur.

### 4.3 Supprimer une Ligne

1. **Sélectionner** la ligne à supprimer
2. Cliquer sur le bouton **❌ Supprimer**
3. Confirmer la suppression
4. La ligne disparaît pour tous les utilisateurs

### 4.4 Réorganiser les Ordres

1. **Modifier** la colonne **Ordre**
2. Les lignes se réorganisent automatiquement
3. Tous les utilisateurs voient le nouvel ordre

💡 **Astuce** : Utilisez des multiples de 10 (10, 20, 30...) pour faciliter les insertions.

### 4.5 Codification Couleur

La colonne **Couleur** utilise un code à 3 lettres :

| Code | Signification |
|------|---------------|
| **J** | Jaune |
| **V** | Vert |
| **C** | Bleu (Cyan) |

**Exemples** :
- `J` = Jaune uniquement
- `JV` = Jaune et Vert
- `JVC` = Jaune, Vert et Bleu

### 4.6 Paramètres de Mise en Forme (FLAG)

La colonne **FLAG** permet d'appliquer des styles visuels :

| Code | Effet |
|------|-------|
| **G** | Texte en gras |
| **R** | Texte en rouge |
| **N** | Texte en noir (normal) |

**Exemples** :
- `G` = Gras
- `R` = Rouge
- `GR` = Gras et Rouge

---

## 5. TRAVAIL COLLABORATIF

### 5.1 Synchronisation Automatique

**Tout est automatique !** Vous n'avez rien à faire.

Quand un utilisateur modifie une ligne :
1. ✅ La modification est **automatiquement sauvegardée**
2. ✅ Les autres utilisateurs voient la modification **instantanément**
3. ✅ Aucune perte de données

### 5.2 Indicateurs Visuels

#### Ligne en Cours de Modification

Quand un autre utilisateur modifie une ligne, vous voyez :

```
┌─────────────────────────────────────────────────┐
│ ⚠️ Ligne modifiée par : Jean Dupont            │
└─────────────────────────────────────────────────┘
```

#### Statut de Connexion

En haut à droite :

| Statut | Signification |
|--------|---------------|
| 🟢 **Serveur** | Vous gérez les connexions |
| 🔵 **Client** | Vous êtes connecté |
| 🔄 **Réélection...** | Reconnexion automatique en cours |

### 5.3 Protection de Votre Saisie

**Votre saisie est protégée !**

Si vous êtes en train de modifier une cellule et qu'un autre utilisateur modifie la même ligne :
- ✅ **Votre saisie est préservée**
- ✅ Les autres colonnes sont mises à jour
- ✅ Vous pouvez continuer à travailler

### 5.4 Gestion des Conflits

#### Conflit Détecté

Si deux utilisateurs modifient **exactement la même cellule** en même temps :

```
┌─────────────────────────────────────────────────┐
│  ⚠️ CONFLIT DE MODIFICATION                    │
│                                                 │
│  Cette ligne a été modifiée par un autre       │
│  utilisateur pendant votre saisie.             │
│                                                 │
│  Vos modifications n'ont pas été enregistrées. │
│                                                 │
│  [OK]                                          │
└─────────────────────────────────────────────────┘
```

**Solution** :
1. Cliquer sur **OK**
2. La ligne se recharge avec les dernières données
3. Refaire votre modification
4. Sauvegarder à nouveau

💡 **Astuce** : Les conflits sont rares ! Le système fait tout pour les éviter.

---

## 6. CONSULTATION DES DOCUMENTS

### 6.1 Icônes de Documents

Dans la colonne **Doc**, vous voyez des icônes 📄 :

| Icône | Signification |
|-------|---------------|
| 📄 | 1 document disponible |
| 📄📄 | 2 documents disponibles |
| 📄📄📄 | 3 documents disponibles |
| (vide) | Aucun document |

### 6.2 Ouvrir un Document

1. **Double-cliquer** sur une icône 📄
2. Le document s'ouvre dans un onglet PDF
3. Vous pouvez zoomer, naviguer, etc.

### 6.3 Onglets PDF

L'application peut ouvrir **jusqu'à 5 documents PDF** simultanément dans des onglets séparés.

**Navigation** :
- Cliquer sur l'onglet pour basculer entre les PDF
- Fermer l'onglet avec le bouton **❌**

### 6.4 Recherche de Documents

#### Par Affaire

1. Aller dans l'onglet **Documents**
2. Saisir le **numéro d'affaire** (au moins 4 caractères)
3. La liste des documents s'affiche automatiquement
4. Double-cliquer pour ouvrir

#### Par Pièce

1. Aller dans l'onglet **Documents**
2. Saisir la **référence de pièce** (au moins 3 caractères)
3. La liste des documents s'affiche automatiquement
4. Double-cliquer pour ouvrir

---

## 7. RECHERCHE ET FILTRES

### 7.1 Filtre par Date

En haut de l'écran :

1. Sélectionner la **date de début** (Du)
2. Sélectionner la **date de fin** (Au)
3. Cliquer sur **🔄 Actualiser**
4. La table affiche uniquement les lignes dans cette période

💡 **Astuce** : Par défaut, la date du jour est affichée.

### 7.2 Recherche par Affaire

1. Aller dans l'onglet **Affaires**
2. Saisir le **numéro d'affaire** dans le champ de recherche
3. Les affaires correspondantes s'affichent
4. Cliquer sur une affaire pour filtrer la table

### 7.3 Recherche Avancée

1. Cliquer sur le bouton **🔍 Rechercher**
2. Saisir vos critères :
   - Client
   - Affaire
   - Pièce
   - Commande
3. Cliquer sur **Rechercher**
4. Les résultats s'affichent dans la table

### 7.4 Réinitialiser les Filtres

Pour afficher à nouveau toutes les lignes :

1. Cliquer sur **🔄 Actualiser**
2. Ou modifier les dates pour élargir la période

---

## 8. TRUCS ET ASTUCES

### 8.1 Raccourcis Clavier

| Raccourci | Action |
|-----------|--------|
| **Tab** | Passer à la cellule suivante |
| **Shift+Tab** | Passer à la cellule précédente |
| **Entrée** | Valider et passer à la ligne suivante |
| **Échap** | Annuler la saisie en cours |
| **Ctrl+F** | Ouvrir la recherche |
| **F5** | Actualiser |

### 8.2 Navigation Rapide

- **Cliquer sur un en-tête de colonne** pour trier
- **Double-cliquer sur une ligne** pour voir les détails
- **Utiliser la molette de la souris** pour défiler

### 8.3 Saisie Rapide

- **Copier-Coller** fonctionne dans toutes les cellules
- **Glisser-Déposer** pour réorganiser (si activé)
- **Saisie semi-automatique** dans certains champs

### 8.4 Indicateurs Visuels

| Indicateur | Signification |
|------------|---------------|
| **Ligne en gras** | Ligne prioritaire (FLAG = G) |
| **Ligne en rouge** | Alerte ou problème (FLAG = R) |
| **Icône 📄** | Documents disponibles |
| **Nombre en rouge** | Incidents en cours |

### 8.5 Optimisation

- **Fermez les onglets PDF** inutilisés pour libérer de la mémoire
- **Utilisez les filtres** pour réduire le nombre de lignes affichées
- **Évitez de modifier** la même ligne qu'un autre utilisateur en même temps

---

## 9. RÉSOLUTION DE PROBLÈMES

### 9.1 Problèmes Courants

#### "Impossible de se connecter au réseau"

**Symptômes** : Statut 🔴 Déconnecté en haut à droite

**Solutions** :
1. Vérifier votre **connexion réseau**
2. Vérifier que le **serveur est démarré** (un autre utilisateur doit être connecté)
3. Contacter l'administrateur si le problème persiste

#### "Conflit de modification"

**Symptômes** : Message d'erreur lors de la sauvegarde

**Solutions** :
1. Cliquer sur **OK**
2. La ligne se recharge automatiquement
3. Refaire votre modification
4. Sauvegarder à nouveau

#### "L'application est lente"

**Solutions** :
1. Fermer les **onglets PDF** inutilisés
2. Réduire la **période de dates** affichée
3. Utiliser les **filtres** pour afficher moins de lignes
4. Redémarrer l'application si nécessaire

#### "Les modifications ne s'affichent pas"

**Solutions** :
1. Vérifier le **statut de connexion** (en haut à droite)
2. Cliquer sur **🔄 Actualiser**
3. Redémarrer l'application si nécessaire

#### "Document PDF ne s'ouvre pas"

**Solutions** :
1. Vérifier que le **fichier existe** sur le serveur
2. Vérifier que vous avez les **droits d'accès**
3. Essayer de fermer un onglet PDF et réessayer
4. Contacter l'administrateur si le fichier est introuvable

### 9.2 Messages d'Erreur

| Message | Signification | Solution |
|---------|---------------|----------|
| "Utilisateur non autorisé" | Vous n'êtes pas dans la liste des utilisateurs | Contacter la production pour demander l'accès |
| "Enregistrement modifié par un autre utilisateur" | Conflit de modification | Recharger et refaire la modification |
| "Erreur de connexion réseau" | Problème réseau | Vérifier la connexion, contacter l'admin |
| "Le fichier n'existe pas ou n'est pas accessible" | Document introuvable | Vérifier le chemin, contacter l'admin |

### 9.3 Que Faire en Cas de Blocage ?

1. **Sauvegarder** votre travail en cours (si possible)
2. **Fermer** l'application proprement
3. **Redémarrer** l'application
4. Si le problème persiste, **contacter l'administrateur**

---

## 10. FAQ

### Questions Générales

#### Q : Combien d'utilisateurs peuvent travailler en même temps ?

**R** : Autant que nécessaire ! Le système est conçu pour supporter de nombreux utilisateurs simultanés.

#### Q : Que se passe-t-il si le serveur se déconnecte ?

**R** : Un autre utilisateur devient automatiquement le serveur. Vous verrez le statut "🔄 Réélection..." pendant quelques secondes.

#### Q : Mes modifications sont-elles sauvegardées automatiquement ?

**R** : Oui ! Dès que vous sortez d'une cellule (Tab, Entrée), la modification est sauvegardée et synchronisée.

#### Q : Puis-je travailler hors ligne ?

**R** : Non, l'application nécessite une connexion réseau pour la synchronisation temps réel.

### Questions Techniques

#### Q : Quel est le délai de synchronisation ?

**R** : Moins de 100 millisecondes ! Les modifications sont quasi-instantanées.

#### Q : Les données sont-elles sécurisées ?

**R** : Oui, le système utilise un verrouillage optimiste pour éviter les pertes de données.

#### Q : Puis-je voir qui a modifié une ligne ?

**R** : Oui, la colonne "Modifié par" affiche le nom du dernier utilisateur.

#### Q : Les logs sont-ils conservés ?

**R** : Oui, les logs sont conservés pendant 7 jours pour le dépannage.

### Questions sur les Documents

#### Q : Quels formats de documents sont supportés ?

**R** : Principalement les PDF. Les autres formats peuvent être consultés via l'explorateur Windows.

#### Q : Combien de documents PDF puis-je ouvrir en même temps ?

**R** : Jusqu'à 5 documents dans des onglets séparés.

#### Q : Puis-je ajouter des documents ?

**R** : Non, l'ajout de documents se fait via le système de gestion documentaire externe.

### Questions sur la Saisie

#### Q : Que signifient les codes J, V, C dans la colonne Couleur ?

**R** : J = Jaune, V = Vert, C = Bleu (Cyan). Vous pouvez combiner : JV, JVC, etc.

#### Q : Comment mettre une ligne en gras ou en rouge ?

**R** : Utilisez la colonne FLAG : G = Gras, R = Rouge, GR = Gras et Rouge.

#### Q : Puis-je annuler une modification ?

**R** : Non, les modifications sont sauvegardées immédiatement. Vous devez refaire la modification manuellement.

---

## 📞 SUPPORT

### Contacts

| Besoin | Contact |
|--------|---------|
| **Problème technique** | Service Informatique |
| **Demande d'accès** | Service Production |
| **Formation** | Responsable Production |
| **Bug ou suggestion** | Service Informatique |

### Informations Utiles

- **Version de l'application** : 2.0
- **Date de mise à jour** : Janvier 2026
- **Plateforme** : Windows 10/11
- **Base de données** : HFSQL

---

## ✅ CHECKLIST DE DÉMARRAGE

Avant de commencer à utiliser TL21 :

- [ ] J'ai vérifié que mon **nom d'utilisateur** est autorisé
- [ ] J'ai vérifié ma **connexion réseau**
- [ ] Je connais l'emplacement des **documents** sur le serveur
- [ ] J'ai lu les sections **Gestion de la production** et **Travail collaboratif**
- [ ] Je sais comment **rechercher** et **filtrer** les données
- [ ] Je connais les **codes couleur** (J/V/C) et **FLAG** (G/R/N)
- [ ] Je sais quoi faire en cas de **conflit de modification**

---

**Bon travail avec TL21 ! 🚀**

*Guide Utilisateur - Version 2.0 - Janvier 2026*
