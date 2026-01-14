# 🎨 MAQUETTES D'INTERFACE - TL21 WEB

**Projet** : TL21 Web - Application de Gestion de Production Moderne  
**Date** : 14 janvier 2026  
**Designer** : Manus AI

---

## 📱 VUE D'ENSEMBLE

Voici les maquettes d'interface pour la nouvelle application web TL21, conçue pour remplacer l'application WinDev tout en conservant toutes les fonctionnalités et en améliorant l'expérience utilisateur.

### 🎯 Objectifs de Design

1. **Interface moderne et épurée** : Design 2026 avec Material Design 3
2. **Collaboration temps réel visible** : Indicateurs visuels de présence et d'édition
3. **Notifications non intrusives** : Système de notifications intelligent et discret
4. **Responsive** : Adaptable à tous les écrans (desktop, tablette, mobile)
5. **Accessibilité** : Conforme aux standards WCAG 2.1

---

## 🖼️ MAQUETTE 1 : ÉCRAN PRINCIPAL

**Fichier** : `01_ecran_principal.png`

### Description

L'écran principal affiche la table de production avec toutes les fonctionnalités essentielles.

### Éléments Clés

#### Barre de Navigation Supérieure
- **Logo TL21** : Identité visuelle claire
- **Sélecteur de date** : Navigation rapide entre les dates de production
- **Profil utilisateur** : Avatar + nom (D. Dexet)
- **Notifications** : Badge rouge avec nombre (3 notifications)
- **Paramètres** : Accès rapide aux réglages

#### Panneau Latéral Gauche (Filtres)
- **Recherche** : Champ de recherche global
- **Filtres** :
  - Client (dropdown)
  - Affaire (input)
  - Couleur (badges J/V/C cliquables)
- **Bouton "Apply Filters"** : Application des filtres

#### Table de Production (Zone Principale)
- **En-têtes de colonnes** : Ordre | Client | Affaire | Commande | Pièce | Désignation | Qté | Couleur | Observations | Actions
- **Lignes alternées** : Blanc et gris clair pour meilleure lisibilité
- **Badges de couleur** : J (vert), V (jaune), C (rouge)
- **Icônes d'action** : Éditer (crayon), Supprimer (poubelle)

#### Indicateurs de Collaboration Temps Réel
- **Ligne en cours d'édition** : Fond bleu clair (#dbeafe)
- **Avatar de l'éditeur** : Bulle "A.D." sur la ligne 2
- **Tooltip** : "A. David est en train de modifier cette ligne"

#### Barre Inférieure
- **Compteur** : "156 lignes au total"
- **Pagination** : 1 2 3 ... 16
- **Bouton d'ajout** : "+ Nouvelle ligne" (bleu, prominent)

#### Badge de Notifications
- **Position** : Flottant en haut à droite
- **Couleur** : Orange (#f97316)
- **Texte** : "2 modifications en attente"

### Fonctionnalités Implémentées

✅ **Affichage de la production** : Table complète avec toutes les colonnes  
✅ **Filtrage** : Par client, affaire, couleur  
✅ **Recherche** : Champ de recherche global  
✅ **Pagination** : Navigation entre les pages  
✅ **Indicateurs temps réel** : Lignes en cours d'édition visibles  
✅ **Actions rapides** : Éditer, Supprimer directement depuis la table  

---

## 🖼️ MAQUETTE 2 : ÉDITION DE LIGNE

**Fichier** : `02_edition_ligne.png`

### Description

Modal d'édition d'une ligne de production avec formulaire complet et avertissement de conflit.

### Éléments Clés

#### Modal Dialog
- **Overlay** : Fond semi-transparent (#00000080)
- **Dialog** : Centré, fond blanc, coins arrondis, ombre portée
- **Bouton de fermeture** : X en haut à droite

#### En-tête
- **Fond** : Bleu clair (#eff6ff)
- **Titre** : "Modifier la ligne de production"

#### Formulaire (2 Colonnes)

**Colonne Gauche** :
- Client : Input "SAFRAN"
- Affaire : Input "AF-2024-157"
- Commande : Input "CMD-002"
- Pièce : Input "P-12346"
- Désignation : Textarea "Support moteur haute température"

**Colonne Droite** :
- Quantité : Number input "180"
- Couleur : Badges J/V/C (V sélectionné avec bordure bleue)
- Épaisseur avant : Number input "2.5 mm"
- Épaisseur après : Number input "2.3 mm"
- Observations : Textarea "Urgent - Livraison prévue vendredi"

#### Avertissement de Conflit
- **Bannière** : Fond jaune clair (#fef3c7), bordure ambre
- **Icône** : Triangle d'avertissement (ambre)
- **Message** : "Cette ligne a été modifiée par A. David il y a 2 minutes. Vos modifications écraseront les siennes."

#### Pied de Modal
- **Fond** : Gris clair (#f9fafb)
- **Bouton "Annuler"** : Gris, à gauche
- **Bouton "Enregistrer"** : Bleu (#3b82f6), à droite, prominent
- **Info** : "Dernière modification: D. Dexet - 14/01/2026 14:32"

### Fonctionnalités Implémentées

✅ **Édition complète** : Tous les champs modifiables  
✅ **Détection de conflits** : Avertissement si modification concurrente  
✅ **Verrouillage optimiste** : Basé sur le champ Version  
✅ **Validation** : Formulaire avec validation côté client  
✅ **Historique** : Affichage de la dernière modification  

---

## 🖼️ MAQUETTE 3 : NOTIFICATIONS TEMPS RÉEL

**Fichier** : `03_notifications_temps_reel.png`

### Description

Interface montrant le système complet de notifications et de collaboration temps réel.

### Éléments Clés

#### Panneau de Notifications (Haut Droite)
- **En-tête** : "Notifications en temps réel" avec point bleu
- **Liste de notifications** :
  1. A. David a modifié la ligne #45 - 2 min ago (non lu, point bleu)
  2. L. Baumgart a ajouté une nouvelle ligne - 5 min ago (non lu, point bleu)
  3. J. Martin a supprimé la ligne #23 - 8 min ago (lu, gris)
  4. D. Dexet est en train d'éditer la ligne #12 - En cours (point vert)
- **Pied** : "Marquer tout comme lu" (lien)

#### Indicateurs Visuels sur la Table
- **Ligne #45** : Lueur bleue subtile (récemment modifiée)
- **Ligne #12** : Avatar "D.D." avec point vert (en cours d'édition)
- **Animation** : Sparkles sur ligne #45 (changement récent)

#### Toast Notification (Bas Droite)
- **Icône** : Checkmark vert
- **Titre** : "Ligne #45 mise à jour par A. David"
- **Détail** : "Affaire: AF-2024-157"
- **Bouton** : X pour fermer
- **Barre de progression** : Vert, 80% (auto-dismiss)

#### Indicateur de Connexion (Barre Supérieure)
- **Point vert** + "Connecté"
- **Info** : "4 utilisateurs en ligne"

#### Présence Utilisateurs
- **Avatars flottants** : Bulles sur les lignes en cours d'édition
- **Tooltip au survol** : "A. David - En édition depuis 2 min"

### Fonctionnalités Implémentées

✅ **Notifications en temps réel** : Panneau déroulant avec historique  
✅ **Toast notifications** : Messages éphémères non intrusifs  
✅ **Indicateurs de présence** : Avatars sur les lignes en édition  
✅ **Statut de connexion** : Nombre d'utilisateurs en ligne  
✅ **Animations subtiles** : Feedback visuel des changements  
✅ **Gestion des notifications** : Marquer comme lu, fermer  

### Conformité avec les Préférences Utilisateur

✅ **Notifications non intrusives** : Pas de blocage de la saisie  
✅ **Accumulation des modifications** : Notifications groupées pour opérations en masse  
✅ **Compteur de modifications** : Badge orange "2 modifications en attente"  
✅ **Saisie concurrente autorisée** : Avertissement mais pas de blocage  

---

## 🖼️ MAQUETTE 4 : GESTION DES DOCUMENTS

**Fichier** : `04_gestion_documents.png`

### Description

Interface de consultation et gestion des documents techniques (plans, PDF, images).

### Éléments Clés

#### Panneau Gauche (40% - Liste Documents)
- **En-tête** : "Documents techniques" + bouton "Upload" (bleu)
- **Recherche** : Champ avec icône loupe + filtre
- **Liste de documents** (cartes) :
  - Plan_AF-2024-156.pdf (2.4 MB, 12/01/2026) - **Sélectionné**
  - Fiche_technique_P12345.pdf (856 KB, 10/01/2026)
  - Photo_piece_finale.jpg (1.2 MB, 14/01/2026)
  - Controle_qualite.xlsx (445 KB, 13/01/2026)
  - Rapport_incident.docx (678 KB, 11/01/2026)
- **Icônes** : PDF, Image, Excel, Word
- **Actions** : Œil (voir), Télécharger

#### Panneau Droit (60% - Visionneuse)
- **Barre d'outils** :
  - Zoom : -, 100%, +
  - Rotation
  - Imprimer
  - Télécharger
  - Plein écran
- **Visionneuse PDF** : Affichage du plan technique
  - Dessin technique professionnel
  - Dimensions : 250mm x 180mm
  - Trous, cotes, annotations
  - Cartouche : AIRBUS, PLAN DE FABRICATION

#### Panneau Métadonnées (Bas)
- **Titre** : "Informations du document"
- **Champs** :
  - Nom : Plan_AF-2024-156.pdf
  - Affaire : AF-2024-156
  - Client : AIRBUS
  - Ajouté par : D. Dexet
  - Date : 12/01/2026
  - Tags : "Plan", "Aluminium", "Urgent" (badges bleus)

### Fonctionnalités Implémentées

✅ **Upload de documents** : Bouton d'ajout  
✅ **Visionneuse intégrée** : PDF, images, documents  
✅ **Recherche et filtrage** : Par nom, type, date  
✅ **Métadonnées** : Informations complètes sur chaque document  
✅ **Tags** : Catégorisation flexible  
✅ **Actions** : Voir, télécharger, imprimer  

---

## 🖼️ MAQUETTE 5 : DASHBOARD STATISTIQUES

**Fichier** : `05_dashboard_statistiques.png`

### Description

Tableau de bord avec statistiques et visualisations de la production.

### Éléments Clés

#### KPI Cards (4 Cartes en Ligne)

**Carte 1 : Lignes de Production**
- Nombre : 156 (bleu)
- Tendance : +12% ↑
- Mini sparkline (ligne bleue)

**Carte 2 : Utilisateurs Connectés**
- Nombre : 4 (vert)
- Statut : "En ligne" (point vert)
- Avatars : D.D., A.D., L.B., J.M.

**Carte 3 : Modifications Aujourd'hui**
- Nombre : 23 (ambre)
- Tendance : +5% ↑
- Mini bar chart

**Carte 4 : Taux de Complétion**
- Pourcentage : 98.5% (vert émeraude)
- Progress ring (98.5% rempli)

#### Graphique 1 : Production par Client (60%)
- **Type** : Barres horizontales
- **Données** :
  - AIRBUS : 450 pièces
  - SAFRAN : 380 pièces
  - THALES : 320 pièces
  - DASSAULT : 280 pièces
  - AUTRES : 170 pièces
- **Couleurs** : Gradient bleu (#3b82f6 → #60a5fa)

#### Graphique 2 : Répartition par Couleur (40%)
- **Type** : Donut chart
- **Données** :
  - J (Jaune) : 45% (segment vert)
  - V (Vert) : 32% (segment jaune)
  - C (Critique) : 23% (segment rouge)
- **Centre** : "156 total"
- **Légende** : Badges de couleur

#### Timeline d'Activité (Bas)
- **Titre** : "Activité récente"
- **Événements** :
  - 14:32 - D. Dexet a modifié la ligne #45 (point bleu)
  - 14:28 - A. David a ajouté une nouvelle ligne (point vert)
  - 14:15 - L. Baumgart a supprimé la ligne #23 (point rouge)
  - 14:05 - J. Martin a exporté les données (point gris)
  - 13:45 - Système: Sauvegarde automatique effectuée (point gris)

### Fonctionnalités Implémentées

✅ **KPIs en temps réel** : Métriques clés actualisées  
✅ **Graphiques interactifs** : Charts.js ou Recharts  
✅ **Timeline d'activité** : Historique des actions  
✅ **Présence utilisateurs** : Avatars des connectés  
✅ **Tendances** : Évolution des métriques  

---

## 🎨 CHARTE GRAPHIQUE

### Palette de Couleurs

#### Couleurs Principales
- **Bleu primaire** : `#3b82f6` (boutons, liens, accents)
- **Bleu foncé** : `#1e3a8a` (barre de navigation)
- **Bleu clair** : `#dbeafe` (fond ligne en édition)
- **Bleu très clair** : `#eff6ff` (en-têtes de modal)

#### Couleurs de Statut
- **Vert** : `#10b981` (succès, en ligne, badge J)
- **Jaune** : `#f59e0b` (avertissement, badge V)
- **Rouge** : `#ef4444` (erreur, critique, badge C)
- **Orange** : `#f97316` (notifications)
- **Gris** : `#6b7280` (texte secondaire)

#### Couleurs de Fond
- **Blanc** : `#ffffff` (fond principal)
- **Gris très clair** : `#f9fafb` (fond alternatif)
- **Gris clair** : `#f3f4f6` (sidebar)
- **Gris moyen** : `#e5e7eb` (en-têtes de table)

### Typographie

- **Police principale** : Inter, system-ui, sans-serif
- **Titres** : 24px, 20px, 18px (bold)
- **Corps de texte** : 14px, 16px (regular)
- **Petits textes** : 12px (regular)

### Espacements

- **Padding cards** : 16px, 24px
- **Margin entre sections** : 24px, 32px
- **Gap entre éléments** : 8px, 12px, 16px

### Éléments UI

- **Coins arrondis** : 8px (boutons), 12px (cards), 16px (modals)
- **Ombres** : `0 1px 3px rgba(0,0,0,0.1)` (subtle), `0 10px 25px rgba(0,0,0,0.15)` (modals)
- **Transitions** : 200ms ease-in-out

---

## 🚀 FONCTIONNALITÉS CLÉS

### 1. Collaboration Temps Réel

✅ **Indicateurs de présence** : Avatars sur les lignes en édition  
✅ **Notifications instantanées** : Toast + panneau de notifications  
✅ **Compteur de modifications** : Badge orange en haut à droite  
✅ **Statut de connexion** : "4 utilisateurs en ligne"  
✅ **Détection de conflits** : Avertissement avant écrasement  

### 2. Gestion de la Production

✅ **Table interactive** : Tri, filtrage, recherche  
✅ **Édition en ligne** : Modal d'édition complet  
✅ **Actions rapides** : Éditer, Supprimer depuis la table  
✅ **Pagination** : Navigation entre les pages  
✅ **Ajout de lignes** : Bouton "+ Nouvelle ligne"  

### 3. Documents Techniques

✅ **Upload de fichiers** : PDF, images, documents  
✅ **Visionneuse intégrée** : Affichage dans le navigateur  
✅ **Métadonnées** : Informations complètes  
✅ **Tags** : Catégorisation flexible  
✅ **Recherche** : Par nom, type, date  

### 4. Statistiques et Reporting

✅ **KPIs en temps réel** : 4 métriques clés  
✅ **Graphiques** : Barres, donut, sparklines  
✅ **Timeline d'activité** : Historique des actions  
✅ **Tendances** : Évolution des métriques  

---

## 📱 RESPONSIVE DESIGN

### Desktop (> 1280px)
- Layout complet avec sidebar
- Table avec toutes les colonnes visibles
- Graphiques côte à côte

### Tablet (768px - 1280px)
- Sidebar repliable
- Table avec scroll horizontal
- Graphiques empilés verticalement

### Mobile (< 768px)
- Menu hamburger
- Cards au lieu de table
- Graphiques simplifiés
- Actions en bottom sheet

---

## ♿ ACCESSIBILITÉ

✅ **Contraste** : Ratio 4.5:1 minimum (WCAG AA)  
✅ **Navigation clavier** : Tab, Enter, Espace  
✅ **Lecteurs d'écran** : ARIA labels et roles  
✅ **Focus visible** : Bordure bleue sur focus  
✅ **Taille des cibles** : 44x44px minimum  

---

## 🎯 CONFORMITÉ AVEC LES PRÉFÉRENCES UTILISATEUR

### Notifications Non Intrusives

✅ **Pas de blocage** : La saisie n'est jamais interrompue  
✅ **Accumulation** : Notifications groupées pour opérations en masse  
✅ **Compteur** : Badge "2 modifications en attente" au lieu de toasts multiples  
✅ **Avertissement** : Message visible mais pas bloquant  

### Saisie Concurrente

✅ **Autorisée** : Plusieurs utilisateurs peuvent éditer simultanément  
✅ **Avertissement** : Message si conflit potentiel  
✅ **Pas de blocage** : L'utilisateur décide d'écraser ou non  
✅ **Indicateurs visuels** : Avatars sur les lignes en édition  

### Surveillance des Modifications

✅ **Déclenchement** : Dès l'entrée en saisie (double-clic ou F2)  
✅ **Non intrusif** : Ne sort pas les autres utilisateurs de leur saisie  
✅ **Notifications discrètes** : Panneau + badge, pas de popup  

---

## 🔄 COMPARAISON AVEC L'APPLICATION WINDEV

| Fonctionnalité | WinDev TL21 | TL21 Web |
|----------------|-------------|----------|
| **Interface** | Windows native | Web moderne |
| **Synchronisation** | Sockets TCP/IP | WebSockets |
| **Notifications** | Toasts WinDev | Toast + panneau |
| **Présence** | Fichier de verrouillage | Avatars temps réel |
| **Documents** | Ouverture externe | Visionneuse intégrée |
| **Statistiques** | Absentes | Dashboard complet |
| **Mobile** | Non | Oui (responsive) |
| **Installation** | Requise | Aucune (navigateur) |

---

## 🚀 PROCHAINES ÉTAPES

1. ✅ **Validation des maquettes** par l'utilisateur
2. ⏳ **Développement du prototype** (React + Node.js)
3. ⏳ **Tests utilisateurs** avec les équipes de production
4. ⏳ **Itérations** basées sur les retours
5. ⏳ **Déploiement** en production

---

**Ces maquettes représentent une évolution moderne de TL21 tout en conservant l'essence de l'application WinDev et en améliorant l'expérience utilisateur !** 🎉
