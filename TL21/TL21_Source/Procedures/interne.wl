procédure interne pMajChamp
extern WDOBJ_LecteurDocument
WDOBJ_LecteurDocument.ObjExecute(ChampLecteur, nConstanteUPDATE, pMoiMeme)
fin
pRafraichissementRuban += pMajChamp
Partie 9 › Table des matières
Partie 9
Table des matières
Partie 9 › Table des matières
Partie 1 Projet
....................................................... 3
Informations générales
................................................... 3
Gestionnaire de Sources
................................................... 3
Liste des éléments du projet
Code
............................................... 3
.................................................................... 4
Erreurs, warnings et informations
Statistiques sur le code
................................................... 6
Composants internes
..................................................... 7
Partie 2 Schéma des données
Graphe
......................................... 9
.................................................................. 9
Informations générales
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
Dictionnaire des rubriques
Liaisons
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
Connexions
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
Tables et rubriques
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
AFFAIRE
CLIENT
CONTROLE_OSMOSEUR
CONTROLE_PLAQUE
CONTROLE_TTS
DocumentsGAMME
DocumentsGAPIECE
ENGAPI
GAMME
GAPIECE
Incidents
Prod_TL21
RAL
Users_TL21
Partie 3 Fenêtre WINDEV
FEN_Principale
.......................................... 5
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 49
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 49
Image
Informations générales
Informations sur les champs
Informations sur les menus
Partie 9 › Table des matières
Code
Code des champs
Procédures
FEN_ADD_COLOR
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 333
Image
Informations générales
Informations sur les champs
Code
Code des champs
FEN_Gestion_utilisateurs
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 340
Image
Informations générales
Informations sur les champs
Code
Code des champs
FEN_CT_Plaques
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 350
Image
Informations générales
Informations sur les champs
Code
Code des champs
FEN_Controle_Osmoseur
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 366
Image
Informations générales
Informations sur les champs
Code
Code des champs
FEN_Controle_TTS
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 381
Image
Informations générales
Informations sur les champs
Code
Code des champs
Partie 4 Etat
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 405
ETAT_ORDO
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 405
Image
Informations générales
Informations sur les champs
Code
Code des champs
Partie 5 Requête
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 410
REQ_Seletion_Affaires
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 410
Image
Partie 9 › Table des matières
Informations générales
Informations sur le résultat
Informations complémentaires
Code
REQ_Documents
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 413
Image
Informations générales
Informations sur le résultat
Informations complémentaires
Code
REQ_Documents2
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 416
Image
Informations générales
Informations sur le résultat
Informations complémentaires
Code
REQ_Documents3
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 419
Image
Informations générales
Informations sur le résultat
Informations complémentaires
Code
REQ_init_Modifie_par
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 422
Image
Informations générales
Informations sur le résultat
Informations complémentaires
Code
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 424
Informations générales
Informations sur le résultat
Informations complémentaires
Code
Partie 6 Classe
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 427

