// ═══════════════════════════════════════════════════════════════
// DÉCLARATIONS GLOBALES - FEN_Gestion_utilisateurs
// ═══════════════════════════════════════════════════════════════

FEN_Gestion_utilisateurs
Code des champs
Clic sur BTN_Ajout
TABLE_Users_TL21.AjouteLigne("",0)
Clic sur BTN_Sup
si TABLE_Users_TL21.Select()=-1 alors
retour
sinon
TABLE_Users_TL21.SupprimeSelect()
fin
// Rafraichissement de la table
TABLE_Users_TL21.Affiche(taCourantBandeau)
Initialisation de BTN_Valider
// Version 1
// Description
// Bouton en validation
Clic sur BTN_Valider
TABLE_Users_TL21.Affiche(taCourantBandeau)
Ferme(FEN_Gestion_utilisateurs)
Fin d'initialisation de TABLE_Users_TL21
TableTrie(TABLE_Users_TL21,"COL_Login")
FEN_CT_Plaques
Image
FEN_CT_Plaques
Informations générales
FEN_CT_Plaques
Fichier physique
Créé par
david.dexet@mh-industries.fr
Date de création
19/12/2024 15:51:32
Dernière modification par
david.dexet@mh-industries.fr
Date dernière modification
08/01/2026 15:01:28
Titre
FR:
Type fenêtre
Fenêtre libre
Contrôle plaques
Mode ouverture (Desktop)
Position X
Centrée par rapport à la mère
Position Y
Largeur
Hauteur
Visible
Barre de titre
Menu système
Icône réduction
Icône agrandissement
Icône aide ctx.
Barre de message
Détourer le fond
Mode 9 images
Redimensionnable
Avec grip
Grip dans image
Déplace/fond
Sauve position
Ascenseur auto.
Gestion grande police
Thème XP
Ctx. HFSQL indép.
Etat initial
Actif
Curseur survol
Copie d'écran
Oui
Unité des tailles
Plateforme unique desktop OU mobile
Ancrage au contenu
<Aucun>
Opacité
Titre personnalisé
Non
Titre perso. : hauteur
Titre perso. : Affiche le titre
Oui
Pos. Menu Perso
Non
Icône de fermeture
Oui
Type cadre
Double
Transparence Vista
Non
Transparence gérée par Vista
Non
Appliquer le thème du projet
<Défaut>
Grisé : Utiliser couleur perso.
Non
Grisé : Algo pour images
<Défaut>
Style du menu
Office XP
Mode bulle d'aide
Non
Mode Bulle : Point chaud
Haut gauche
Mode Bulle : Décalage X
Mode Bulle : Décalage Y
Optimisations
Comme le projet
Valide auto.
Lib. + tps restant
Oui
Pos. X Menu
Pos. Y Menu
Texte Markdown
Non
Mode menu ctx.
<Aucun>
M.C.U.
Oui
Anim. Ouverture
Anim. Fermeture
Durée Anim. Ouverture
Durée Anim. Fermeture
Adapte Taille contenu
Oui
Assombri quand inactif
Oui
Déplace souris sur bouton par
Non
Compact. barres outils
Non
Icône
Image poignée
Statistiques de la fenêtre
Table
Colonne de table
Nombre d'éléments dans la fenêtre : 16
FEN_CT_Plaques
Informations sur les champs
Fenêtre : FEN_CT_Plaques
Actif
Table av
Compatible 5.5
Colonne ancrée
Mémo. config. col.
Gestion ENTREE
Saisie cascade
Bulle ascenseur
Asc. proportionnel
Affichage/ascenseur
Multisélection
Enregistrement en sortie
Blocage enreg.
Utiliser HFiltre()
Parcours
Table
Touche TAB
Etat initial
Visible
Plan
Hauteur
Largeur
TABLE_CONTROLE_PL
Position Y
Position X
Table
Table : TABLE_CONTROLE_PLAQUE
Actif
Gauche
Centre
Texte
Actif
Gauche
Centre
Texte
COL_RALTest1
COL_Brillance1
Saisie assistée fichier
Avec saisie
Texte
COL_Initiales
Triée
Type saisie
Date
Centre
COL_Date
Format RTF
Cadrage vert.
Centre
Gauche
affichag
Multiligne
Cadrage horz.
Avec recherche
Colonne triable
Largeur ajustable
Droite
Actif
Déplaçable
Actif
COL_IDCONTROLE_PLAQU
Fixée à gauche
Numériqu
Etat initial
Centre
Visible
Droite
Largeur
Type
Colonne de table
Actif
Centre
Centre
Actif
Centre
Centre
COL_Observations1
Actif
Gauche
Centre
Texte
COL_RALTest2
Actif
Gauche
Centre
Texte
COL_Brillance2
Actif
Gauche
Centre
Texte
COL_ValeurB2
Actif
Droite
Centre
Numériqu
COL_Brillance2OK
Actif
Centre
Centre
COL_Quadrillage2
Actif
Centre
Centre
COL_Observations2
Actif
Gauche
Centre
Visible
Saisie assistée fichier
COL_Quadrillage1
Avec saisie
COL_Brillance1OK
Triée
Numériqu
Format RTF
Type saisie
Centre
Multiligne
Cadrage vert.
Droite
Déplaçable
Actif
Etat initial
Largeur
COL_ValeurB1
Type
Cadrage horz.
Avec recherche
Colonne triable
Largeur ajustable
Fixée à gauche
Texte
Fenêtre : FEN_CT_Plaques
Table : TABLE_CONTROLE_PLAQUE
Libellé
FR:
Ordre navigation
Curseur survol
Mode Loupe
Filtre <contient>
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Hauteur ligne max.
Hauteur ligne (sans marges)
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Sens
Vertical
Retrait gauche
Angle titre
Cadrage fonctions gXXX
Tenir compte du cadrage
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Hauteur des lignes
Non
Sélection multiple
Non
Bulle sur tronqués
Oui
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Table CONTROLE_PLAQUE
Facteur d'agrandissement
Scroll au pixel
Oui
Scroll au doigt
Non
Asc. horizontal
Automatique
Asc. vertical
Toujours visible
Mode de sélection
Sélection simple
Sélect. colonnes
Sans sélection
Sélect. cellules
Sans sélection
Ajout éléments supplémentaires
Non
Ajout éléments suppl. par le haut
Non
Nb. max d'éléments
Etat chargement
Non
Retrait gauche FI détail
FI détail au survol
Non
Même contenu/ligne
Non
Aff. résultats
Sans affichage
Somme
FR:
Somme
Moyenne
FR:
Moyenne
Compteur
FR:
Compteur
Minimum
FR:
Minimum
Maximum
FR:
Maximum
Sauve position auto
Non
Ruptures Enroulables
Oui
Titre multiligne
Oui
Menu ctx. colonne
Oui
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Mémoriser filtres
Non
Mémoriser tris
Non
Nb. Enreg. Max
Fichier parcouru
CONTROLE_PLAQUE
Rub. parcourue
-IDCONTROLE_PLAQUE
Ajout/Suppr. dans variable
Oui
Synchro HFSQL C/S
Jamais
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
Largeur et hauteur
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Table : TABLE_CONTROLE_PLAQUE
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_IDCONTROLE_PLAQUE (1)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.IDCONTROLE_PLAQUE
Ancrage
Taux anc. droite
ID
+9 999 999 999 999 999 999
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Date (2)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Date
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Date
Ancrage
<Aucun>
Taux anc. droite
UseSystemMask
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Initiales (3)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Initiales
Ancrage
Taux anc. droite
Initiales
<Aucun>
Taux anc. bas
Taux anc. largeur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_RALTest1 (4)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.RALTest1
Ancrage
Taux anc. droite
RALTest1
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Brillance1 (5)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Brillance1
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Brillance1
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_ValeurB1 (6)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.ValeurB1
Ancrage
Taux anc. droite
Valeur
+99 999,99
<Aucun>
Taux anc. bas
Taux anc. largeur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Brillance1OK (7)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Oui
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Brillance1OK
Ancrage
<Aucun>
Taux anc. droite
Brillance1OK
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Quadrillage1 (8)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Quadrillage1
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Oui
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Quadrillage1
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Observations1 (9)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Observations1
Ancrage
<Aucun>
Taux anc. droite
Observations1
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_RALTest2 (10)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.RALTest2
Ancrage
Taux anc. droite
RALTest2
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Brillance2 (11)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Brillance2
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Brillance2
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_ValeurB2 (12)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.ValeurB2
Ancrage
Taux anc. droite
Valeur2
+99 999,99
<Aucun>
Taux anc. bas
Taux anc. largeur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Brillance2OK (13)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Oui
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Brillance2OK
Ancrage
<Aucun>
Taux anc. droite
Brillance2OK
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Quadrillage2 (14)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Quadrillage2
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Oui
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Quadrillage2
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Colonne de table : TABLE_CONTROLE_PLAQUE.COL_Observations2 (15)
Titre
FR:
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calculatrice
Non
Touche TAB
Accessible par TAB
Marge en haut
Marge en bas
Marge à gauche
Marge à droite
Retrait gauche
Numéro aide
Bandeau visible
Oui
Format HTML
Taille de saisie
Mot de passe
Non
Masque saisie
FR:
Mode ellipse
<Aucun>
Verifier l'orthographe
Non
Unicode
Non
Saisie obligatoire
Non
Export/Impression
Si visible (défaut)
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
CONTROLE_PLAQUE.Observations2
Ancrage
<Aucun>
Taux anc. droite
Observations2
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
FEN_CT_Plaques
Code

