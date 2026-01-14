procédure Socket_TriggerModification() : booléen
// Récupérer l'ID de l'enregistrement impacté
// On lit directement depuis le contexte du fichier de données
nID est un entier = Prod_TL21.IDProd_TL21
// Vérifier si c'est une modification initiée par le réseau (pour éviter les boucles)
si gbVerrouMajTable = Vrai alors
LogSocket("[TRIGGER] ⚠Modification réseau (boucle évitée), pas de notification" )
renvoyer Vrai // On autorise l'opération mais on n'envoie rien
fin
// Logguer la fonction HFSQL qui a déclenché le trigger
LogSocket("[TRIGGER] Déclenché par la fonction : '" + H.FonctionTrigger + "' sur l'ID=" + nID)
// Envoyer la notification selon le nom de la fonction
// ON UTILISE H.FonctionTrigger (chaîne) car H.NuméroFonctionTrigger est instable
selon H.FonctionTrigger
cas "HModifie"
LogSocket("[TRIGGER] ➡Action HMODIFIE détectée." )
ExécuteThreadPrincipal(Socket_EnvoyerDepuisTrigger, "update", nID)
cas "HAjoute"
LogSocket("[TRIGGER] ➕
Ajout ID="
+ nID)
ExécuteThreadPrincipal(Socket_EnvoyerDepuisTrigger, "add", nID)
cas "HSupprime"
LogSocket("[TRIGGER] ❌
Suppression ID="
+ nID)
ExécuteThreadPrincipal(Socket_EnvoyerDepuisTrigger, "delete", nID)
autre cas
LogSocket("[TRIGGER] ⚠Fonction non gérée : "
+ H.FonctionTrigger)
fin
renvoyer Vrai
Partie 8 › Composant interne WDFAA
Partie 8
Composant
interne WDFAA
Partie 8 › Composant interne WDFAA
Composant interne WDFAA
Informations générales
Répertoire
Nom physique
WDFAA.wci
Composant interne WDFAA
Schéma des données et contextes
Le composant interne utilise le schéma des données du projet ou aucun schéma des données (partage complet).
Le composant interne accède aux tables du projet et utilise les mêmes contextes d'exécution que le projet.
Composant interne WDFAA
Liste des éléments du composant interne
Nom
Libellé
Public
FI_WindevFAA_RubanLecteurPDF
Statistiques
Nombre de fenêtres :
Partie 8
FI_WindevFAA_RubanLecteurPDF
Image
FI_WindevFAA_RubanLecteurPDF
Informations générales
FI_WindevFAA_RubanLecteurPDF
Fichier physique
C:\Mes
wdw
Créé par
patrick.kessen@mh-industries.fr
Date de création
22/07/2025 10:03:42
Dernière modification par
david.dexet@mh-industries.fr
Date dernière modification
06/01/2026 14:11:27
Type fenêtre
Fenêtre libre
Mode ouverture (Desktop)
Centrée par rapport à la mère
Position X
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
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations générales
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
<Aucun>
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
Statistiques de la fenêtre
Champ de saisie
Libellé
Bouton
Interrupteur
Image
Potentiomètre
Fenêtre interne
Option d'interrupteur
Option de menu
Ruban
Regroupement
Volet (Ruban)
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations générales
Nombre d'éléments dans la fenêtre : 72
FI_WindevFAA_RubanLecteurPDF
Informations sur les champs
Fenêtre : FI_WindevFAA_RubanLecteurPDF
Etat initial
Cadrage vert.
Centre
Centre
Touche TAB
Plan
Touche TAB
Visible
Actif
Hauteur
Cadrage horz.
Etat initial
Etat initial
FI_WindevFAA_RubanLecteurPDF
Largeur
Position Y
Position X
Fenêtre interne
Fenêtre interne : FI_WindevFAA_RubanLecteurPDF
LIB_LectureSeule
Animée par défaut
Format RTF
Visible
Plan
Hauteur
Largeur
Position Y
Position X
Libellé
Type bouton
Visible
Plan
Hauteur
Largeur
Position Y
Position X
Bouton
BTN_Raccourci_CTRL_0
-62
Actif
Interrup
BTN_Raccourci_CTRL_1
-62
Actif
Interrup
BTN_Raccourci_CTRL_2
-62
Actif
Interrup
BTN_Raccourci_CTRL_F
-61
Actif
Interrup
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
RUBAN_WINDEVFAA_LecteurDocument
Touche TAB
Etat initial
Visible
Plan
Hauteur
Largeur
Position Y
Position X
Ruban
Actif
Ruban : FI_WindevFAA_RubanLecteurPDF.RUBAN_WINDEVFAA_LecteurDocument
SAI_WDFAA_NumPag
Actif
Texte
Non
SAI_WDFAA_Recherch
Actif
Texte
Non
Actif
Numéri
Non
SAI_WDFAA_Zoom
Asc. vertical
Asc. horizontal
Défilement vert.
Défilement Horz.
Fin saisie automatique
Effacement automatique
Saisie assistée fichier
NULL si vide
Mise à blanc
Saisie obligatoire
Mot de passe
Format RTF
Multiligne
Type saisie
Touche TAB
Etat initial
Visible
Plan
Hauteur
Largeur
Position Y
Position X
Champ de saisie
Actif
Droite
Centre
Actif
Droite
Centre
LIB_SeparateurNBPage
Actif
Centre
Haut
Actif
Centre
Centre
Actif
Droite
Centre
Actif
Gauche
Haut
Etat initial
Touche TAB
LIB_Signature
LIB_TitreSignature
LIB_WDFAA_NombrePage
Plan
Largeur
Position Y
Animée par défaut
Cadrage vert.
Format RTF
Cadrage horz.
Visible
LIB_PbSignature
Hauteur
LIB_NbSignature
Position X
Etat initial
Libellé
Type bouton
Visible
Plan
Hauteur
Largeur
Position Y
Position X
Bouton
BTN_WDFAA_Copier
Actif
Interrup
BTN_WDFAA_Filigrane
Actif
Normal
BTN_WDFAA_Importer
Actif
Normal
BTN_WDFAA_Imprimer
Actif
Interrup
BTN_WDFAA_MODEAFFICHAGE_1PAGE
Actif
Interrup
BTN_WDFAA_MODEAFFICHAGE_2PAGE
Actif
Interrup
BTN_WDFAA_MODEDEPLACEMENT
Actif
Interrup
BTN_WDFAA_MODEOCR
Actif
Interrup
BTN_WDFAA_MODESELECTION
Actif
Interrup
Type bouton
Touche TAB
Etat initial
Visible
Plan
Hauteur
Largeur
Position Y
Position X
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
BTN_WDFAA_Ouvrir
Actif
Interrup
BTN_WDFAA_PageDernier
Actif
Normal
BTN_WDFAA_PagePrecedent
Actif
Normal
BTN_WDFAA_PagePremier
Actif
Normal
BTN_WDFAA_PageSuivant
Actif
Normal
BTN_WDFAA_RecherchePrecedent
Actif
Interrup
BTN_WDFAA_RechercheSuivant
Actif
Interrup
BTN_WDFAA_RotationAntihoraire
Actif
Normal
BTN_WDFAA_RotationHoraire
Actif
Normal
BTN_WDFAA_Save
Actif
Normal
BTN_WDFAA_Signature
Actif
Normal
BTN_WDFAA_SignatureNumerique
Actif
Normal
BTN_WDFAA_SupprimeMultiPage
Actif
Normal
BTN_WDFAA_SupprimePageEnCours
Actif
Normal
BTN_WDFAA_VOLETNAVIGATIONVISIBL
Actif
Interrup
BTN_WDFAA_Zoom100
Actif
Interrup
BTN_WDFAA_ZoomLargeur
Actif
Interrup
BTN_WDFAA_ZoomMoins
Actif
Interrup
BTN_WDFAA_ZoomPageEntiere
Actif
Interrup
BTN_WDFAA_ZoomPlus
Actif
Interrup
Actif
Actif
Actif
INT_WDFAA_RechercheMotEntier
Trois états
Avec focus
INT_WDFAA_RechercheCasse
Col. proportionnelle
INT_WDFAA_MODEAFFICHAGE_CO
Animée par défaut
Nb. colonnes
Touche TAB
Etat initial
Visible
Plan
Hauteur
Largeur
Position Y
Position X
Interrupteur
IMG_LienSignature
Actif
IMG_PbSignature
Actif
IMG_SansNom1
Actif
Prioritaire pour clic
Avec clic
Etat initial
Visible
Plan
Hauteur
Largeur
Position Y
Position X
Image
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Grad. dessous
Grad. dessus
-1
Pas graduation
Avant rép.
Entre rép.
Avance rapide
Borne max.
Actif
Borne min.
Vertical
Touche TAB
Hauteur
Etat initial
Largeur
Visible
Position Y
POT_WDFAA_Zoom
Plan
Position X
Potentiomètre
GRPRUB_Insertion
GRPRUB_ModifPage
GRPRUB_Recherche
GRPRUB_SansNom1
GRPRUB_WDFAA_Affichage_Zoom
GRPRUB_WDFAA_General
GRPRUB_WDFAA_Mode
GRPRUB_WDFAA_ModeAffichage
GRPRUB_WDFAA_Page
GRPRUB_WDFAA_PressePapier
GRPRUB_WDFAA_Signature
Touche TAB
Etat initial
Visible
Plan
Hauteur
Largeur
Position Y
Position X
Regroupement
Fenêtre : FI_WindevFAA_RubanLecteurPDF
Fenêtre interne : FI_WindevFAA_RubanLecteurPDF
Note pour la documentation technique
FR:
Champ Lecteur PDF : ruban
GB: PDF Reader control: ribbon
ES:
Control Lector de PDF: cinta de opciones
UI par l'utilisateur
Selon fenêtre
Unité des tailles
Plateforme unique desktop OU mobile
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Numéro aide
Thème destination
Oui
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Ctx. HFSQL indép.
Non
Ancrage
<Aucun>
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Fenêtre interne : FI_WindevFAA_RubanLecteurPDF
Bouton : FI_WindevFAA_RubanLecteurPDF.BTN_Raccourci_CTRL_0
Libellé
FR:
Raccourci CTRL_0
GB: CTRL_0 shortcut
ES:
Atajo CTRL_0
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Nb. états image
Nb. états fond
Etirement de l'image de fond
Largeur et hauteur
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton : FI_WindevFAA_RubanLecteurPDF.BTN_Raccourci_CTRL_1
Libellé
FR:
Raccourci CTRL_1
GB: CTRL_1 shortcut
ES:
Atajo CTRL_1
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Nb. états image
Nb. états fond
Etirement de l'image de fond
Largeur et hauteur
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton : FI_WindevFAA_RubanLecteurPDF.BTN_Raccourci_CTRL_2
Libellé
FR:
Raccourci CTRL_2
GB: CTRL_2 shortcut
ES:
Atajo CTRL_2
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Nb. états image
Nb. états fond
Etirement de l'image de fond
Largeur et hauteur
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton : FI_WindevFAA_RubanLecteurPDF.BTN_Raccourci_CTRL_F
Libellé
FR:
Raccourci CTRL_F
GB: CTRL_F shortcut
ES:
Atajo CTRL_F
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Nb. états image
Nb. états fond
Etirement de l'image de fond
Largeur et hauteur
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Libellé : FI_WindevFAA_RubanLecteurPDF.LIB_LectureSeule
Libellé
FR:
Lecture seule
GB: Read-only
ES:
Solo lectura
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Taille police min
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Type saisie
Texte
Masque saisie
FR,GB,...: 0
Mode ellipse
<Aucun>
Unicode
Non
Transforme le &
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Mise à blanc
Oui
Texte Markdown
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Ruban : FI_WindevFAA_RubanLecteurPDF.RUBAN_WINDEVFAA_LecteurDocument
Libellé
FR:
&Ruban
GB: &Ribbon
ES:
&Cinta de opciones
Valeur initiale
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Retrait gauche
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Retrait des onglets
Numéro aide
Autorise ChangeGabarit
Oui
Volets détachables
Non
Mémoriser Configuration
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Valeur persistante
Oui
Texte Markdown
Non
Nb. états image
Nb. étapes animation
Ancrage
Largeur
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Ruban : FI_WindevFAA_RubanLecteurPDF.RUBAN_WINDEVFAA_LecteurDocument
Bouton :
Libellé
FR:
Copier
GB: Copy
ES:
Copiar
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bulle d'aide
FR:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}{\f1\fnil\fcharset0 MS Shell Dlg;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 Copier (Ctrl+C)\b0\par
\fs16 Placer une copie de la s\'e9lection dans le Presse-papiers, pour pouvoir la coller
ailleurs, plus tard.\f1\fs17\par
}
GB: {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}{\f1\fnil\fcharset0 MS Shell Dlg;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Copy
(Ctrl+C)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Put a copy of the selection
on the clipboard so you can paste it somewhere else.\f1\fs17\par
}
ES:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}{\f1\fnil\fcharset0 MS Shell Dlg;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Copiar
(Ctrl+C)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Colocar una copia de la
selecci\u243?n en el portapapeles para que se pueda pegar en otro sitio.\f1\fs17\par
}
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
2_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
Ajouter un filigrane
GB: Add a watermark
ES:
Agregar una marca de agua
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
Mark_32_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
Importer des pages
GB: Import pages
ES:
Importar páginas
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
Imprimer
GB: Print
ES:
Imprimir
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.16299}\viewkind4\uc1
\pard\b\f0\fs18 Imprimer (Ctrl+P)\b0\fs17\par
Ouvrir la fen\'eatre de param\'e9trage de l'impression et lancer l'impression du
document.\par
}
GB: {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.16299}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Print
(Ctrl+P)\b0\fs17\par
\ql\b0\i0\ul0\strike0\nosupersub\f0\fs17\cf0\highlight0 Open the print settings window
and start printing the document.\par
}
ES:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.16299}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Imprimir
(Ctrl+P)\b0\fs17\par
\ql\b0\i0\ul0\strike0\nosupersub\f0\fs17\cf0\highlight0 Abrir la ventana para configurar
la impresi\u243?n e iniciar la impresi\u243?n del documento.\par
}
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Image
FR,GB,...: C:\Mes
rimer.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Une page
GB: A page
ES:
Una página
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Oui
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
Page.png
Nb. états image
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Deux pages
GB: Two pages
ES:
Dos páginas
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Oui
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Afficher les pages deux par deux
GB: Show pages two by two
ES:
Mostrar páginas de dos en dos
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
xPages.png
Nb. états image
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Déplacement
GB: Move
ES:
Mover
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Oui
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR,GB,...: OCR
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Oui
Recopie Option menu flèche
Non
Menu contextuel
<NO CONTEXT MENU>
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Réduire jusqu'au mode <petit picto sans libellé> au maximum
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.19041}\viewkind4\uc1
\pard\b\f0\fs16 R\'e9cup\'e9rer le texte contenu dans la partie s\'e9lectionn\'e9e de
l'image\b0\par
Le texte sera copi\'e9 dans le presse-papiers.\par
}
GB: {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.19041}\viewkind4\uc1
\pard\b\f0\fs16 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Retrieve the text
contained in the selected part of the image\b0\par
\ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 The text will be copied to the
clipboard.\par
}
ES:
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.19041}\viewkind4\uc1
\pard\b\f0\fs16 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Extraer el texto
de la parte seleccionada en la imagen\b0\par
\ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 El texto se copiar\u225? en el
portapapeles.\par
}
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
32_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Sélection
GB: Select
ES:
Seleccionar
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Oui
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Ouvrir
GB: Open
ES:
Abrir
Groupe
GRP_WDFAA_CHAMPRUBAN
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bulle d'aide
FR:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}{\f1\fnil\fcharset0 MS Shell Dlg;}}
{\*\generator Riched20 10.0.16299}\viewkind4\uc1
\pard\b\f0\fs18 Ouvrir (Ctrl+O)\b0\par
\fs16 Ouvrir un fichier existant.\f1\fs17\par
}
GB: {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}{\f1\fnil\fcharset0 MS Shell Dlg;}}
{\*\generator Riched20 10.0.16299}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Open
(Ctrl+O)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Open an existing
file.\f1\fs17\par
}
ES:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}{\f1\fnil\fcharset0 MS Shell Dlg;}}
{\*\generator Riched20 10.0.16299}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Abrir
(Ctrl+O)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Abrir un archivo
existente.\f1\fs17\par
}
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
2_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
&Bouton
GB: &Button
ES:
&Botón
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Afficher la dernière page
GB: Display the last page
ES:
Mostrar la última página
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
_BrwLast_V_24_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
&Bouton
GB: &Button
ES:
&Botón
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Afficher la page précédente
GB: Display the previous page
ES:
Mostrar página anterior
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
_BrwForward_V_24_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
&Bouton
GB: &Button
ES:
&Botón
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Afficher la première page
GB: Display the first page
ES:
Mostrar la primera página
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
_BrwFirst_V_24_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
&Bouton
GB: &Button
ES:
&Botón
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Afficher la page suivante
GB: Display the next page
ES:
Mostrar página siguiente
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
_BrwNext_V_24_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Occurrence précédente (Shift+F3)
GB: Previous occurrence (Shift+F3)
ES:
Instancia anterior (Mayús+F3)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
_BrwForward_V_24_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Occurrence Suivante (F3)
GB: Next occurrence (F3)
ES:
Siguiente instancia (F3)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
_BrwNext_V_24_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
Rotation
antihoraire
GB: Counterclockwise
rotation
ES:
Rotación
antihoraria
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
Rotation
horaire
GB: Clockwise
rotation
ES:
Rotación
horaria
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
Enregistrer
GB: Save
ES:
Guardar
Groupe
GRP_WDFAA_TT_Tous,GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
Menu flèche
WINDEVFAA_PDF_CTX_Sauver
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.14393}\viewkind4\uc1
\pard\b\f0\fs18 Enregistrer (Ctrl+S)\b0\fs17\par
Enregistrer le document.\par
}
GB: {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.14393}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Save
(Ctrl+S)\b0\fs17\par
\ql\b0\i0\ul0\strike0\nosupersub\f0\fs17\cf0\highlight0 Save document.\par
}
ES:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.14393}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Guardar
(Ctrl+S)\b0\fs17\par
\ql\b0\i0\ul0\strike0\nosupersub\f0\fs17\cf0\highlight0 Guardar documento.\par
}
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
Bouton avec flèche distincte
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Signature manuscrite
GB: Handwritten signature
ES:
Firma manuscrita
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
Bouton flèche
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Signature numérique
GB: Digital signature
ES:
Firma digital
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Supprimer des pages
GB: Delete pages
ES:
Eliminar páginas
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Supprimer la page en cours
GB: Delete current page
ES:
Eliminar página actual
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
age_32_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR:
Volet vignettes
GB: Thumbnails pane
ES:
Panel miniaturas
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Oui
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Afficher le volet des vignettes
GB: Show the thumbnails pane
ES:
Mostrar panel de miniaturas
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
gnette_32_5.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Libellé
FR,GB,...: 100%
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 100% (CTRL+0)\b0\par
\fs16 Agrandir votre document \'e0 100%.\fs18\par
}
GB: {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 100%
(CTRL+0)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Zoom document to
100%.\fs18\par
}
ES:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 100%
(CTRL+0)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Aplica un zoom del 100% al
documento.\fs18\par
}
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
.png
Nb. états image
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Largeur de la page
GB: Page width
ES:
Ancho de página
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 Largeur de la page (CTRL+1)\b0\par
\fs16 Effectuer un zoom sur le document afin que la largeur de la page corresponde \'e0
la largeur de la fen\'eatre.\fs18\par
}
GB: {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Page width
(CTRL+1)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Zoom the document so
that the width of the page matches the width of the the window.\fs18\par
}
ES:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Ancho de la
p\u225?gina (CTRL+1)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Hacer zoom en el
documento para que el ancho de la p\u225?gina corresponda con el ancho de la
ventana.\fs18\par
}
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
eurpage.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR,GB,...: Zoom -10%
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
ns.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Bouton :
Libellé
FR:
Page entière
GB: Entire page
ES:
Página entera
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bulle d'aide
FR:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 Une page (CTRL+2)\b0\par
\fs16 Effectuer un zoom sur le document de mani\'e8re \'e0 afficher une page enti\'e8re
dans la fen\'eatre.\fs18\par
}
GB: {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 One page
(CTRL+2)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Zoom the document so you
can see the entire page in the window.\fs18\par
}
ES:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\*\generator Riched20 10.0.15063}\viewkind4\uc1
\pard\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf0\highlight0 Una p\u225?gina
(CTRL+2)\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf0\highlight0 Hacer zoom en el
documento para mostrar toda la p\u225?gina en la ventana.\fs18\par
}
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
epage.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton :
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
On/Off
Non
Recopie Option menu flèche
Non
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Retrait gauche
Réduction Ruban
Ne pas réduire le bouton
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR,GB,...: Zoom + 10%
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Animée par défaut
Oui
Mode ellipse
<Aucun>
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Type flèche
<Aucun>
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Image
FR,GB,...: C:\Mes
s.png
Nb. états image
Nb. états fond
Etirement de l'image de fond
Mode 9 images personnalisé
Nb. étapes animation
Largeur Halo
Hauteur Halo
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Regroupement :
Libellé
FR:
Insertion
GB: Insert
ES:
Insertar
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Regroupement :
Libellé
FR:
Pages
GB: Pages
ES:
Páginas
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Regroupement :
Libellé
FR:
Recherche
GB: Find
ES:
Buscar
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Regroupement :
Libellé
FR:
Rotation
GB: Rotation
ES:
Rotación
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Regroupement :
Libellé
FR,GB,...: Zoom
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Regroupement :
Libellé
FR:
Général
GB: General
ES:
General
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Regroupement :
Libellé
FR:
Outils
GB: Tools
ES:
Herramientas
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Regroupement :
Libellé
FR:
Mode d'affichage
GB: Display mode
ES:
Modo de visualización
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Regroupement :
Libellé
FR:
Pages
GB: Pages
ES:
Páginas
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Regroupement :
Libellé
FR:
Presse-papiers
GB: Clipboard
ES:
Portapapeles
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Regroupement :
Libellé
FR:
Signatures
GB: Signatures
ES:
Firmas
Curseur survol
UI par l'utilisateur
Selon fenêtre
Avec bouton
Non
Taux Paral. hauteur
Taux Paral. Y
Nb. états image
Image :
Groupe
GRP_WDFAA_SIGNATURE
Curseur survol
UI par l'utilisateur
Selon fenêtre
Menu contextuel
<NO CONTEXT MENU>
Menu manip. image
<Aucun menu>
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Cadrage vert.
Haut
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Ascenseur et zoom auto.
Non
Autorise ChangeGabarit
Oui
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Texte Markdown
Non
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Mode menu ctx.
<Aucun>
Mire visible
Oui
Zoom par double taps
Oui
Force monochrome
Non
Mode 9 images
Non
Chargement en fond
Non
Orientation EXIF
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Image :
Valeur initiale
FR,GB,...: C:\Mes
e.svg
Groupe
GRP_WDFAA_SIGNATURE
Curseur survol
UI par l'utilisateur
Selon fenêtre
Menu manip. image
<Aucun menu>
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Cadrage vert.
Haut
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Le document n'est pas fiable
GB: The document cannot be trusted
ES:
El documento no es de confianza
Numéro aide
Opacité
Ascenseur et zoom auto.
Non
Autorise ChangeGabarit
Oui
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Mire visible
Oui
Zoom par double taps
Oui
Force monochrome
Non
Mode 9 images
Non
Chargement en fond
Non
Orientation EXIF
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Image :
Valeur initiale
FR,GB,...: C:\Mes
g
Groupe
GRP_WDFAA_SIGNATURE
Curseur survol
UI par l'utilisateur
Selon fenêtre
Menu manip. image
<Aucun menu>
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Cadrage vert.
Haut
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Ascenseur et zoom auto.
Non
Autorise ChangeGabarit
Oui
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Mire visible
Oui
Zoom par double taps
Oui
Force monochrome
Non
Mode 9 images
Non
Chargement en fond
Non
Orientation EXIF
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Interrupteur :
Valeur initiale
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage vert.
Haut
Hauteur options auto
Oui
Compacter option
Oui
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Afficher la première page comme page de couverture en mode deux pages
GB: Display the first page as cover page in two-page mode
ES:
Mostrar la primera página como página portada en el modo de dos páginas
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Look Vista
Non
Type bandeau
Toute la hauteur de l'option
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Saisie obligatoire
Non
Saisie obligatoire (erreur) : Style
Oui
Saisie obligatoire (erreur) : Texte
Non
Saisie obligatoire (erreur) : Picto
Non
Valeur persistante
Non
Option multilignes
Non
Option format RTF
Non
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Nb. états image
Largeur image
Nb. étapes animation
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Interrupteur :
Valeur initiale
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage vert.
Haut
Hauteur options auto
Oui
Compacter option
Non
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Look Vista
Non
Type bandeau
Libellé et sous-libellé
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Saisie obligatoire
Non
Saisie obligatoire (erreur) : Style
Oui
Saisie obligatoire (erreur) : Texte
Non
Saisie obligatoire (erreur) : Picto
Non
Valeur persistante
Non
Option multilignes
Non
Option format RTF
Non
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Nb. états image
Largeur image
Nb. étapes animation
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Interrupteur :
Valeur initiale
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage vert.
Haut
Hauteur options auto
Oui
Compacter option
Non
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Look Vista
Non
Type bandeau
Libellé et sous-libellé
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Saisie obligatoire
Non
Saisie obligatoire (erreur) : Style
Oui
Saisie obligatoire (erreur) : Texte
Non
Saisie obligatoire (erreur) : Picto
Non
Valeur persistante
Non
Option multilignes
Non
Option format RTF
Non
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Nb. états image
Largeur image
Nb. étapes animation
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Libellé :
Libellé
FR:
3 signatures
GB: 3 signatures
ES:
3 firmas
Groupe
GRP_WDFAA_SIGNATURE,GRP_WDFAA_SignatureOk
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Taille police min
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Type saisie
Texte
Masque saisie
FR,GB,...: 0
Mode ellipse
<Aucun>
Unicode
Non
Transforme le &
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Mise à blanc
Oui
Texte Markdown
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Libellé :
Libellé
FR:
Problème détecté
GB: Problem found
ES:
Problema detectado
Groupe
GRP_WDFAA_SIGNATURE
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Taille police min
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Type saisie
Texte
Masque saisie
FR,GB,...: 0
Mode ellipse
<Aucun>
Unicode
Non
Transforme le &
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Mise à blanc
Oui
Texte Markdown
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Libellé :
Libellé
FR,GB,...: /
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Taille police min
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Type saisie
Texte
Masque saisie
FR,GB,...: 0
Mode ellipse
<Aucun>
Unicode
Non
Transforme le &
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Mise à blanc
Oui
Texte Markdown
Non
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Taux anc. hauteur
Libellé :
Groupe
GRP_WDFAA_SIGNATURE
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Taille police min
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Type saisie
Texte
Masque saisie
FR,GB,...: 0
Mode ellipse
<Aucun>
Unicode
Non
Transforme le &
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Mise à blanc
Oui
Texte Markdown
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Libellé :
Libellé
FR:
Le PDF est signé numériquement
GB: This document is digitally signed
ES:
PDF firmado digitalmente
Groupe
GRP_WDFAA_SIGNATURE,GRP_WDFAA_SignatureOk
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Taille police min
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Type saisie
Texte
Masque saisie
FR,GB,...: 0
Mode ellipse
<Aucun>
Unicode
Non
Transforme le &
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Mise à blanc
Oui
Texte Markdown
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Libellé :
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Opacité
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Taille police min
Autorise ChangeGabarit
Oui
Animer si trop long
Non
Type saisie
Texte
Masque saisie
FR,GB,...: 0
Mode ellipse
<Aucun>
Unicode
Non
Transforme le &
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Mise à blanc
Oui
Texte Markdown
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Taux anc. hauteur
Potentiomètre :
Libellé
FR:
&Potentiomètre
GB: &Slider
ES:
Control de&slizante
Valeur initiale
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Numéro aide
Autorise ChangeGabarit
Oui
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Avec focus
Non
Valeur persistante
Non
Texte Markdown
Non
Nb. états image
Personnaliser le picto AMI
Non
Indice du picto AMI
Ancrage
Taux anc. droite
<Aucun>
Taux anc. bas
Taux anc. largeur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Champ de saisie :
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calendrier
Non
Bouton Calculatrice
Non
Bouton Suppression
<Aucun>
Touche TAB
Accessible par TAB
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage horz.
Centre
Position X interne
Largeur interne
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
Numéro de la page en cours
GB: Number of the current page
ES:
Número de la página actual
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Format HTML
Sécurité HTML
Oui
Visualisation markdown
Non
Saisie manuscrite
Non
Taille de saisie
Masque saisie
FR,GB,...: 0
Borne dans bulle
Non
Borne dans texte d'indication
Oui
Sélection multiple
Non
Mode ellipse
<Aucun>
Lien automatique
Non
Verifier l'orthographe
Non
Unicode
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Asc. horizontal
Jamais
Asc. vertical
Jamais
Complétion système de fichier
Non
Saisie invalide
Oui, bloquant
Saisie obligatoire (erreur) : Style
Oui
Saisie obligatoire (erreur) : Texte
Non
Saisie obligatoire (erreur) : Picto
Non
Saisie obligatoire (indication) : Picto
Non
Saisie obligatoire (indication) : Texte
Non
Saisie obligatoire (indication) : Style
Oui
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Saisie invalide : Picto
Non
Saisie invalide : Texte
Non
Saisie invalide : Style
Oui
Avec focus
Oui
Historique des saisies
Non
Valeurs multiples (jetons)
Non
Autoriser les doublons
Non
Jeton supprimable
Oui
Valeur persistante
Non
Barre d'outils RTF
En saisie
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Gestion Euro
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Bouton gauche : Nombre d'états
Bouton droit : Nombre d'états
Bouton gauche : Largeur
Bouton droit : Largeur
Bouton gauche : Hauteur
Bouton droit : Hauteur
Bouton gauche : Monochrome
Couleur monochrome du style
Bouton droit : Monochrome
Couleur monochrome du style
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Champ de saisie :
Libellé
FR:
Rechercher :
GB: Find:
ES:
Buscar:
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
-1
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calendrier
Non
Bouton Calculatrice
Non
Bouton Suppression
<Aucun>
Touche TAB
Aucune action
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage horz.
Gauche
Position X interne
Largeur interne
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Numéro aide
Texte d'indication si vide
FR:
Rechercher
GB: Find
ES:
Buscar
Opacité
Autorise ChangeGabarit
Oui
Format HTML
Sécurité HTML
Non
Visualisation markdown
Non
Saisie manuscrite
Non
Taille de saisie
Masque saisie
FR,GB,...: 0
Borne dans bulle
Non
Borne dans texte d'indication
Non
Sélection multiple
Non
Mode ellipse
<Aucun>
Lien automatique
Non
Verifier l'orthographe
Non
Unicode
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Asc. horizontal
Jamais
Asc. vertical
Jamais
Complétion système de fichier
Non
Saisie invalide
Oui, bloquant
Saisie obligatoire (erreur) : Style
Oui
Saisie obligatoire (erreur) : Texte
Non
Saisie obligatoire (erreur) : Picto
Non
Saisie obligatoire (indication) : Picto
Non
Saisie obligatoire (indication) : Texte
Non
Saisie obligatoire (indication) : Style
Oui
Saisie invalide : Picto
Non
Saisie invalide : Texte
Non
Saisie invalide : Style
Oui
Avec focus
Oui
Historique des saisies
Non
Valeurs multiples (jetons)
Non
Autoriser les doublons
Non
Jeton supprimable
Oui
Valeur persistante
Non
Barre d'outils RTF
Jamais
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Gestion Euro
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Bouton gauche : Nombre d'états
Bouton droit : Nombre d'états
Bouton gauche : Largeur
Bouton droit : Largeur
Bouton gauche : Hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Bouton droit : Hauteur
Bouton gauche : Monochrome
Couleur monochrome du style
Bouton droit : Monochrome
Couleur monochrome du style
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Champ de saisie :
Groupe
GRP_WDFAA_CHAMPRUBAN,GRP_WDFAA_PDF_Tous
Ordre navigation
Curseur survol
UI par l'utilisateur
Selon fenêtre
Bouton Calendrier
Non
Bouton Calculatrice
Non
Bouton Suppression
<Aucun>
Touche TAB
Accessible par TAB
Taux Paral. hauteur
Taux Paral. Y
Épinglé
Non
Masquer lors du scrolling
Non
Ancrage au contenu
<Aucun>
Cadrage horz.
Droite
Position X interne
Largeur interne
Cadrage fonctions gXXX
Cadrage ignoré (pour compatibilité)
Bulle d'aide
FR:
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\colortbl ;\red45\green45\blue45;}
{\*\generator Riched20 10.0.14393}\viewkind4\uc1
\pard\cf1\b\f0\fs18 Zoom\b0\par
\fs16 Choisir le pourcentage d'agrandissement qui vous convient.\fs18\par
}
GB: {\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\colortbl ;\red45\green45\blue45;}
{\*\generator Riched20 10.0.14393}\viewkind4\uc1
\pard\cf1\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf1\highlight0 Zoom\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf1\highlight0 Choose the desired
enlargement percentage.\fs18\par
}
ES:
Numéro aide
Opacité
Autorise ChangeGabarit
Oui
Format HTML
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1036{\fonttbl{\f0\fswiss\fprq2\fcharse
t0 Trebuchet MS;}}
{\colortbl ;\red45\green45\blue45;}
{\*\generator Riched20 10.0.14393}\viewkind4\uc1
\pard\cf1\b\f0\fs18 \ql\b1\i0\ul0\strike0\nosupersub\f0\fs18\cf1\highlight0 Zoom\b0\par
\fs16 \ql\b0\i0\ul0\strike0\nosupersub\f0\fs16\cf1\highlight0 Seleccionar el porcentaje
de ampliaci\u243?n m\u225?s conveniente.\fs18\par
}
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les champs
Sécurité HTML
Oui
Visualisation markdown
Non
Saisie manuscrite
Non
Taille de saisie
Masque saisie
FR,GB,...: 999 999%
Borne dans bulle
Non
Borne dans texte d'indication
Oui
Sélection multiple
Non
Mode ellipse
<Aucun>
Lien automatique
Non
Verifier l'orthographe
Non
Unicode
Non
Alignement sur l'axe secondaire
défini par le champ flexbox (auto)
Facteur de rétrécissement
Facteur d'agrandissement
Asc. horizontal
Jamais
Asc. vertical
Jamais
Complétion système de fichier
Non
Saisie invalide
Oui, bloquant
Saisie obligatoire (erreur) : Style
Oui
Saisie obligatoire (erreur) : Texte
Non
Saisie obligatoire (erreur) : Picto
Non
Saisie obligatoire (indication) : Picto
Non
Saisie obligatoire (indication) : Texte
Non
Saisie obligatoire (indication) : Style
Oui
Saisie invalide : Picto
Non
Saisie invalide : Texte
Non
Saisie invalide : Style
Oui
Avec focus
Oui
Historique des saisies
Non
Valeurs multiples (jetons)
Non
Autoriser les doublons
Non
Jeton supprimable
Oui
Valeur persistante
Non
Barre d'outils RTF
En saisie
Texte Markdown
Non
Mode menu ctx.
<Aucun>
Gestion Euro
Non
Personnaliser le picto AMI
Non
Indice du picto AMI
Bouton gauche : Nombre d'états
Bouton droit : Nombre d'états
Bouton gauche : Largeur
Bouton droit : Largeur
Bouton gauche : Hauteur
Bouton droit : Hauteur
Bouton gauche : Monochrome
Couleur monochrome du style
Bouton droit : Monochrome
Couleur monochrome du style
Ancrage
<Aucun>
Taux anc. droite
Taux anc. bas
Taux anc. largeur
Taux anc. hauteur
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Informations sur les menus
FI_WindevFAA_RubanLecteurPDF
Informations sur les menus
Menu contextuel : 'WINDEVFAA_PDF_CTX_Sauver'
Nom des options
WINDEVFAA_TT_OPT_Save (2)
WINDEVFAA_TT_OPT_SaveAs (3)
Libellé des options : Français
Enregistrer
Enregistrer sous...
Libellé des options : Anglais
Save
Save as...
Libellé des options : Espagnol
Guardar
Guardar como...
FI_WindevFAA_RubanLecteurPDF
Code des champs
Déclarations globales de FI_WindevFAA_RubanLecteurPDF
procédure MaFenêtre()
externe "KeyConst.WL"
//Champ manipulé par ce ruban
ChampLecteur est un Champ
pRafraichissementRuban est une procédure
constante
trtMiseAJourRuban = 261
// Fonctions
FONC_Ouvrir
FONC_Imprimer
= 1
= 2
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
FONC_Zoom100pc
FONC_ZoomLargeurPage
FONC_ZoomPageEntiere
FONC_SetZoom
FONC_ZoomPlus
FONC_ZoomMoins
FONC_AffichageUnePage
FONC_AffichageDeuxPages
FONC_SetNumPage
FONC_PagePremiere
FONC_PagePrecedente
FONC_PageSuivante
FONC_PageDerniere
FONC_Recherche
FONC_RechercheSuivant
FONC_RecherchePrecedent
= 3
= 4
= 5
= 6
= 7
= 8
= 9
= 10
= 11
= 12
= 13
= 14
= 15
= 16
= 17
= 18
FONC_VoletNavigationVisible
FONC_ModeDéplacement
FONC_ModeSélection
= 20
= 21
= 22
FONC_Copier
= 24
FONC_PrendFocus
FONC_PerdFocus
= 25
= 26
FONC_RechercheOnModifSAI
FONC_RechercheOnModifMotEntier
FONC_RechercheOnModifCasse
FONC_PageRotationHoraire
FONC_PageRotationAntihoraire
= 27
= 28
FONC_Enregistrer
FONC_EnregistrerSous
= 32
= 33
FONC_SupprimerDesPages
FONC_InsérerDesPages
= 35
= 29
= 30
= 31
= 34
FONC_AjouterUnFiligrane
= 36
FONC_AjouterUneSignature
= 37
FONC_AjouterUneSignatureNumerique = 38
FONC_ModeOCR
= 39
// Mises à jour
GET_NumPage
GET_NombrePage
GET_Zoom
GET_AffichageUnePage
GET_AffichageDeuxPages
GET_AffichagePageDeCouverture
GET_VoletNavigationVisible
GET_ModeDéplacement
GET_ModeSélection
= 1001
= 1002
= 1003
= 1004
= 1005
= 1006
= 1007
= 1008
= 1009
GET_DocumentCharge
// Mise à jour particulières
UPDATE_BTN_Ouvrir
UPDATE_BTN_Imprimer
UPDATE_BTN_CopiePressePapier
UPDATE_BTN_Enregistrer
= 1010
= 2001
= 2002
= 2003
= 2004
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
UPDATE_BTN_Zoom100
UPDATE_BTN_ZoomLargeur
UPDATE_BTN_ZoomPageEntiere
UPDATE_POT_Zoom
UPDATE_SAI_Zoom
UPDATE_BTN_ZoomPlus
UPDATE_BTN_ZoomMoins
= 2010
= 2011
= 2012
= 2013
= 2014
= 2015
= 2016
UPDATE_BTN_ModeUnePage
UPDATE_BTN_ModeDeuxPages
UPDATE_INT_PageCouverture
= 2020
= 2021
= 2022
UPDATE_BTN_VoletMiniature
= 2030
UPDATE_SAI_NumPage
UPDATE_LIB_NbPage
UPDATE_BTN_PagePremiere
UPDATE_BTN_PagePrecedente
UPDATE_BTN_PageSuivante
UPDATE_BTN_PageDerniere
= 2040
= 2041
= 2042
= 2043
= 2044
= 2045
UPDATE_BTN_ModeDeplacement
UPDATE_BTN_ModeSelection
UPDATE_BTN_ModeOCR
= 2050
= 2051
= 2052
UPDATE_SAI_Recherche
UPDATE_BTN_RecherchePrecedent
UPDATE_BTN_RechercheSuivant
UPDATE_INT_RechercheMotEntier
UPDATE_INT_RechercheCasse
= 2060
= 2061
= 2062
= 2063
= 2064
UPDATE_BTN_Signature
UPDATE_BTN_Filigrane
UPDATE_Modification
= 2065
= 2066
= 2067
fin
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjInitRuban()
Clic sur BTN_Raccourci_CTRL_0
ExécuteTraitement(BTN_WDFAA_Zoom100, trtClic)
Clic sur BTN_Raccourci_CTRL_1
ExécuteTraitement(BTN_WDFAA_ZoomLargeur, trtClic)
Clic sur BTN_Raccourci_CTRL_2
ExécuteTraitement(BTN_WDFAA_ZoomPageEntiere, trtClic)
Clic sur BTN_Raccourci_CTRL_F
RUBAN_WINDEVFAA_LecteurDocument=2
DonneFocus(SAI_WDFAA_Recherche)
Modification du volet affiché de RUBAN_WINDEVFAA_LecteurDocument
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
si RUBAN_WINDEVFAA_LecteurDocument=2 alors
DonneFocus(SAI_WDFAA_Recherche)
fin
Initialisation de BTN_WDFAA_Filigrane
_AjouteUpdate(MoiMême, UPDATE_BTN_Filigrane)
Clic sur BTN_WDFAA_Filigrane
extern WDOBJ_LecteurDocument
// ouvrir le dialogue qui demande les pages a supprimer
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_AjouterUnFiligrane)
Initialisation de BTN_WDFAA_Signature
_AjouteUpdate(MoiMême, UPDATE_BTN_Signature)
Clic sur BTN_WDFAA_Signature
externe WinDevFAA_PopupSignature
si ChampLecteur<>Null _et_ ChampLecteur..NombrePage <= 0 alors
retour
fin
bufImage est un Buffer = OuvrePopupPosition(WinDevFAA_PopupSignature, poBas + poDroite)
si bufImage..Taille > 0 alors
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_AjouterUneSignature, bufImage)
fin
Initialisation de BTN_WDFAA_SignatureNumerique
_AjouteUpdate(MoiMême, UPDATE_BTN_Signature)
Clic sur BTN_WDFAA_SignatureNumerique
extern FEN_WinDevFAA_PDF_SignatureNumerique
si ChampLecteur..NombrePage <= 0 alors
retour
fin
bufImage est un Buffer
sNumSerie est une chaîne Unicode
sMotPasse est une chaîne Unicode
(bufImage, sNumSerie, sMotPasse) = Ouvre(FEN_WinDevFAA_PDF_SignatureNumerique)
si Taille(bufImage) <> 0 alors
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_AjouterUneSignatureNumerique, bufImage,
sNumSerie, sMotPasse)
fin
Initialisation de BTN_WDFAA_Importer
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
_AjouteUpdate(MoiMême, UPDATE_Modification)
Clic sur BTN_WDFAA_Importer
extern WDOBJ_LecteurDocument
// ouvrir le dialogue qui demande les pages a supprimer
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_InsérerDesPages)
Initialisation de BTN_WDFAA_SupprimeMultiPage
_AjouteUpdate(MoiMême, UPDATE_Modification)
Clic sur BTN_WDFAA_SupprimeMultiPage
extern WDOBJ_LecteurDocument
// ouvrir le dialogue qui demande les pages a supprimer
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_SupprimerDesPages)
Initialisation de BTN_WDFAA_SupprimePageEnCours
_AjouteUpdate(MoiMême, UPDATE_Modification)
Clic sur BTN_WDFAA_SupprimePageEnCours
soit faaPdfSupprimePageCourante_ = 32232
ExécuteFAA( ChampLecteur, faaPdfSupprimePageCourante_)
Initialisation de BTN_WDFAA_RecherchePrecedent
_AjouteUpdate(MoiMême, UPDATE_BTN_RecherchePrecedent)
Clic sur BTN_WDFAA_RecherchePrecedent
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_RecherchePrecedent)
Initialisation de BTN_WDFAA_RechercheSuivant
_AjouteUpdate(MoiMême, UPDATE_BTN_RechercheSuivant)
Clic sur BTN_WDFAA_RechercheSuivant
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_RechercheSuivant)
Initialisation de INT_WDFAA_RechercheCasse
_AjouteUpdate(MoiMême, UPDATE_INT_RechercheCasse)
A chaque modification de INT_WDFAA_RechercheCasse
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_RechercheOnModifCasse, SAI_WDFAA_Recherche..Valeur,
INT_WDFAA_RechercheMotEntier..Valeur, INT_WDFAA_RechercheCasse..Valeur)
Initialisation de INT_WDFAA_RechercheMotEntier
_AjouteUpdate(MoiMême, UPDATE_INT_RechercheMotEntier)
A chaque modification de INT_WDFAA_RechercheMotEntier
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_RechercheOnModifMotEntier, SAI_WDFAA_Recherche..
Valeur, INT_WDFAA_RechercheMotEntier..Valeur, INT_WDFAA_RechercheCasse..Valeur)
Initialisation de SAI_WDFAA_Recherche
_AjouteUpdate(MoiMême, UPDATE_SAI_Recherche)
A chaque modification de SAI_WDFAA_Recherche
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_RechercheOnModifSAI, SAI_WDFAA_Recherche..Valeur,
INT_WDFAA_RechercheMotEntier..Valeur, INT_WDFAA_RechercheCasse..Valeur)
Touche enfoncée (WM_KEYDOWN) de SAI_WDFAA_Recherche
si _EVE.wParam = VK_RETURN alors
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_RechercheSuivant)
renvoyer Faux
fin
Prise de focus (WM_SETFOCUS) de SAI_WDFAA_Recherche
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_PrendFocus)
Perte de focus (WM_KILLFOCUS) de SAI_WDFAA_Recherche
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_PerdFocus)
Initialisation de BTN_WDFAA_RotationAntihoraire
_AjouteUpdate(MoiMême, UPDATE_Modification)
Clic sur BTN_WDFAA_RotationAntihoraire
extern WDOBJ_LecteurDocument
// Tourne la page courante
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_PageRotationAntihoraire)
Initialisation de BTN_WDFAA_RotationHoraire
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
_AjouteUpdate(MoiMême, UPDATE_Modification)
Clic sur BTN_WDFAA_RotationHoraire
extern WDOBJ_LecteurDocument
// Tourne la page courante
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_PageRotationHoraire)
Initialisation de BTN_WDFAA_Zoom100
_AjouteUpdate(MoiMême, UPDATE_BTN_Zoom100)
Clic sur BTN_WDFAA_Zoom100
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_Zoom100pc)
Initialisation de BTN_WDFAA_ZoomLargeur
_AjouteUpdate(MoiMême, UPDATE_BTN_ZoomLargeur)
Clic sur BTN_WDFAA_ZoomLargeur
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_ZoomLargeurPage)
Initialisation de BTN_WDFAA_ZoomMoins
_AjouteUpdate(MoiMême, UPDATE_BTN_ZoomMoins)
Clic sur BTN_WDFAA_ZoomMoins
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_ZoomMoins)
Initialisation de BTN_WDFAA_ZoomPageEntiere
_AjouteUpdate(MoiMême, UPDATE_BTN_ZoomPageEntiere)
Clic sur BTN_WDFAA_ZoomPageEntiere
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_ZoomPageEntiere)
Initialisation de BTN_WDFAA_ZoomPlus
_AjouteUpdate(MoiMême, UPDATE_BTN_ZoomPlus)
Clic sur BTN_WDFAA_ZoomPlus
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_ZoomPlus)
Initialisation de POT_WDFAA_Zoom
_AjouteUpdate(MoiMême, UPDATE_POT_Zoom)
A chaque modification de POT_WDFAA_Zoom
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_SetZoom, MoiMême..Valeur)
Initialisation de SAI_WDFAA_Zoom
_AjouteUpdate(MoiMême, UPDATE_SAI_Zoom)
Sortie de SAI_WDFAA_Zoom
extern WDOBJ_LecteurDocument
soit nZoom=MoiMême..Valeur*100
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_SetZoom, nZoom)
Touche enfoncée (WM_KEYDOWN) de SAI_WDFAA_Zoom
si _EVE.wParam = VK_RETURN alors
// valide
ExécuteTraitement(MoiMême,trtSortie)
DonneFocus(ChampLecteur)
renvoyer Faux
fin
Initialisation de BTN_WDFAA_Imprimer
_AjouteUpdate(MoiMême, UPDATE_BTN_Imprimer)
Clic sur BTN_WDFAA_Imprimer
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_Imprimer)
Initialisation de BTN_WDFAA_Ouvrir
_AjouteUpdate(MoiMême, UPDATE_BTN_Ouvrir)
Clic sur BTN_WDFAA_Ouvrir
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_Ouvrir)
Initialisation de BTN_WDFAA_Save
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
_AjouteUpdate(MoiMême, UPDATE_BTN_Enregistrer)
Clic sur BTN_WDFAA_Save
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_Enregistrer)
Initialisation de BTN_WDFAA_MODEDEPLACEMENT
_AjouteUpdate(MoiMême, UPDATE_BTN_ModeDeplacement)
Clic sur BTN_WDFAA_MODEDEPLACEMENT
extern WDOBJ_LecteurDocument
si MoiMême..Enfoncé alors
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_ModeDéplacement)
fin
Initialisation de BTN_WDFAA_MODEOCR
_AjouteUpdate(MoiMême, UPDATE_BTN_ModeOCR)
Clic sur BTN_WDFAA_MODEOCR
extern WDOBJ_LecteurDocument
si MoiMême..Enfoncé alors
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_ModeOCR)
fin
Initialisation de BTN_WDFAA_MODESELECTION
_AjouteUpdate(MoiMême, UPDATE_BTN_ModeSelection)
Clic sur BTN_WDFAA_MODESELECTION
extern WDOBJ_LecteurDocument
si MoiMême..Enfoncé alors
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_ModeSélection)
fin
Initialisation de BTN_WDFAA_MODEAFFICHAGE_1PAGE
_AjouteUpdate(MoiMême, UPDATE_BTN_ModeUnePage)
Clic sur BTN_WDFAA_MODEAFFICHAGE_1PAGE
extern WDOBJ_LecteurDocument
si MoiMême..Enfoncé alors
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_AffichageUnePage, MoiMême..Valeur)
fin
Initialisation de BTN_WDFAA_MODEAFFICHAGE_2PAGE
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
_AjouteUpdate(MoiMême, UPDATE_BTN_ModeDeuxPages)
Clic sur BTN_WDFAA_MODEAFFICHAGE_2PAGE
extern WDOBJ_LecteurDocument
si MoiMême..Enfoncé alors
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_AffichageDeuxPages, INT_
WDFAA_MODEAFFICHAGE_COUVERTURE[1])
fin
Initialisation de INT_WDFAA_MODEAFFICHAGE_COUVERTURE
_AjouteUpdate(MoiMême, UPDATE_INT_PageCouverture)
A chaque modification de INT_WDFAA_MODEAFFICHAGE_COUVERTURE
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_AffichageDeuxPages, INT_
WDFAA_MODEAFFICHAGE_COUVERTURE[1])
Initialisation de BTN_WDFAA_PageDernier
_AjouteUpdate(MoiMême, UPDATE_BTN_PageDerniere)
Clic sur BTN_WDFAA_PageDernier
extern WDOBJ_LecteurDocument
// On se positionne sur la dernière page
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_PageDerniere)
Initialisation de BTN_WDFAA_PagePrecedent
_AjouteUpdate(MoiMême, UPDATE_BTN_PagePrecedente)
Clic sur BTN_WDFAA_PagePrecedent
extern WDOBJ_LecteurDocument
// Incrémente le numéro de page
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_PagePrecedente)
Initialisation de BTN_WDFAA_PagePremier
_AjouteUpdate(MoiMême, UPDATE_BTN_PagePremiere)
Clic sur BTN_WDFAA_PagePremier
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_PagePremiere)
Initialisation de BTN_WDFAA_PageSuivant
_AjouteUpdate(MoiMême, UPDATE_BTN_PageSuivante)
Clic sur BTN_WDFAA_PageSuivant
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
extern WDOBJ_LecteurDocument
// Incrémente le numéro de page
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_PageSuivante)
Initialisation de BTN_WDFAA_VOLETNAVIGATIONVISIBLE
_AjouteUpdate(MoiMême, UPDATE_BTN_VoletMiniature)
Clic sur BTN_WDFAA_VOLETNAVIGATIONVISIBLE
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_VoletNavigationVisible, MoiMême..Enfoncé)
Initialisation de LIB_WDFAA_NombrePage
_AjouteUpdate(MoiMême, UPDATE_LIB_NbPage)
Initialisation de SAI_WDFAA_NumPage
_AjouteUpdate(MoiMême, UPDATE_SAI_NumPage)
Sortie de SAI_WDFAA_NumPage
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_SetNumPage, MoiMême..Valeur)
Touche enfoncée (WM_KEYDOWN) de SAI_WDFAA_NumPage
si _EVE.wParam = VK_RETURN alors
// valide
ExécuteTraitement(MoiMême,trtSortie)
DonneFocus(ChampLecteur)
renvoyer Faux
fin
Initialisation de BTN_WDFAA_Copier
_AjouteUpdate(MoiMême, UPDATE_BTN_CopiePressePapier)
Clic sur BTN_WDFAA_Copier
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_Copier)
Clic sur IMG_LienSignature
externe WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.VoirSignatures()
Initialisation de LIB_Signature
Partie 8 › FI_WindevFAA_RubanLecteurPDF › Code des champs
__InitChampSignature(MoiMême)
Sélection du menu de WINDEVFAA_PDF_CTX_Sauver.WINDEVFAA_TT_OPT_Save
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_Enregistrer)
Sélection du menu de WINDEVFAA_PDF_CTX_Sauver.WINDEVFAA_TT_OPT_SaveAs
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, FONC_EnregistrerSous)
FI_WindevFAA_RubanLecteurPDF
Procédures
Procédure locale __InitChamp

