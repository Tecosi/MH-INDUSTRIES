procédure Socket_OnEntreeColonne()
si gbSaisieEnCours alors retour
// Récupérer l'indice de la ligne sélectionnée dans la table
// Utiliser TableSelect() pour obtenir la ligne sélectionnée
nLigne est un entier = TableSelect(FEN_Principale.TABLE_Prod_TL21)
si nLigne <= 0 alors retour
// On passe en mode saisie
gbSaisieEnCours
= Vrai
// Stocker les informations de la ligne en cours d'édition
// Utiliser la syntaxe TABLE[ligne].COLONNE pour accéder aux valeurs
gnEnregistrementEnCours
= FEN_Principale.TABLE_Prod_TL21[nLigne].COL_ID
gdhVersionEnCours
= FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Version
// Notifier les autres utilisateurs qu'on commence à éditer cette ligne
si gbSocketActif alors
Socket_Envoyer("editing", gnEnregistrementEnCours)
fin
Procédure globale Socket_OnSortieColonne

