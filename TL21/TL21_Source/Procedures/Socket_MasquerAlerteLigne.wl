procédure Socket_MasquerAlerteLigne(nIDLigne est un entier)
LogSocket("[ALERTE] ✅
Masquage alerte pour ligne "
+ nIDLigne)
nLigne est un entier = TableCherche(FEN_Principale.TABLE_Prod_TL21.COL_ID, nIDLigne)
si nLigne > 0 alors
// Restaurer la couleur de fond par défaut
FEN_Principale.TABLE_Prod_TL21[nLigne]..CouleurFond = Transparent
LogSocket("[ALERTE] ✅
Ligne "
+ nLigne + " couleur restaurée")
fin
Procédure globale Socket_MettreAJourStatutUI
// Procédure globale, à mettre dans votre collection "Socket_Gestion"

