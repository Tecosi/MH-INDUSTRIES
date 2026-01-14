procédure VerrouillerLignePourSaisie()
// ───────────────────────────────────────────────────────────────────────────────
// Verrouille l'enregistrement pour édition exclusive
// ───────────────────────────────────────────────────────────────────────────────
// ✅
INDIQUER QU'UNE SAISIE EST EN COURS
gbSaisieEnCours = Vrai
// Vérifier qu'une ligne est sélectionnée
si TABLE_Prod_TL21 <= 0 alors
retour
fin
// Récupérer l'ID de la ligne sélectionnée
nIDActuel est un entier = TABLE_Prod_TL21.COL_ID
// Lire l'enregistrement dans la base
si HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDActuel) = Faux alors
retour
fin
// ═══════════════════════════════════════════════════════════════
// VÉRIFIER SI LA LIGNE EST DISPONIBLE
// ═══════════════════════════════════════════════════════════════
si Prod_TL21.Modifie_par <> "" et Prod_TL21.Modifie_par <> gsUtilisateurActuel alors
// Ligne déjà verrouillée par un autre utilisateur
ToastAffiche("⚠Ligne en cours d'édition par " + Prod_TL21.Modifie_par, toastCourt, cvBas,
chCentre)
gbSaisieEnCours = Faux
retour
fin
// ═══════════════════════════════════════════════════════════════
// VERROUILLER L'ENREGISTREMENT (HFSQL)
// ═══════════════════════════════════════════════════════════════
si HBloqueNumEnr(Prod_TL21, hNumEnrEnCours) = Faux alors
ToastAffiche("⚠Impossible de verrouiller l'enregistrement" , toastCourt, cvBas, chCentre)
gbSaisieEnCours = Faux
retour
fin
// Mémoriser l'ID de la ligne verrouillée
gnIDLigneEnCoursDeModification= nIDActuel
// ═══════════════════════════════════════════════════════════════
// DÉFINIR LE CHAMP Modifie_par (VERROUILLAGE APPLICATION)
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme
= Vrai
Prod_TL21.Modifie_par
HModifie(Prod_TL21)
= gsUtilisateurActuel
gbModificationParMoiMeme = Faux
// Pas de toast pour ne pas déranger l'utilisateur
FEN_ADD_COLOR
Image
FEN_ADD_COLOR
Informations générales
FEN_ADD_COLOR
Fichier physique
Créé par
patrick.kessen@mh-industries.fr
Date de création
19/02/2025 17:18:11
Dernière modification par
david.dexet@mh-industries.fr
Date dernière modification
06/01/2026 14:11:26
Titre
FR:
Type fenêtre
Fenêtre libre
ADD_COLOR
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
Non
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
Nombre d'éléments dans la fenêtre : 4
FEN_ADD_COLOR
Informations sur les champs
Fenêtre : FEN_ADD_COLOR
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
TABLE_RAL
Position Y
Position X
Table
Table : TABLE_RAL
Gauche
Centre
Texte
Actif
Gauche
Centre
Texte
Saisie assistée fichier
Actif
Avec saisie
COL_HEX
Triée
COL_RAL
Format RTF
Type saisie
Numériqu
Multiligne
Cadrage vert.
Centre
Déplaçable
Droite
Etat initial
affichag
Visible
Largeur
COL_IDRAL
Type
Cadrage horz.
Avec recherche
Colonne triable
Largeur ajustable
Fixée à gauche
Colonne de table
Fenêtre : FEN_ADD_COLOR
Table : TABLE_RAL
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
Table RAL
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
RAL
Rub. parcourue
IDRAL
Ajout/Suppr. dans variable
Oui
Synchro HFSQL C/S
Jamais
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Largeur et hauteur
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Table : TABLE_RAL
Colonne de table : TABLE_RAL.COL_IDRAL (1)
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
Identifiant de RAL
+9 999 999 999 999 999 999
Vide si zéro
Non
Retour à la ligne
Non
Coche tous dans entête
Non
Liaison des données
RAL.IDRAL
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Taux anc. largeur
Taux anc. hauteur
Colonne de table : TABLE_RAL.COL_RAL (2)
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
RAL.RAL
Ancrage
Taux anc. droite
RAL
<Aucun>
Taux anc. bas
Colonne de table : TABLE_RAL.COL_HEX (3)
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
RAL.HEX
Ancrage
Taux anc. droite
HEX
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
FEN_ADD_COLOR
Code

