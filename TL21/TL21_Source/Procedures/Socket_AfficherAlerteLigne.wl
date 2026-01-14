procédure Socket_AfficherAlerteLigne(nIDLigne est un entier, sUtilisateur est une chaîne)
LogSocket("[ALERTE] ⚠Affichage alerte pour ligne "
")")
+ nIDLigne + " (utilisateur : " + sUtilisateur +
nLigne est un entier = TableCherche(FEN_Principale.TABLE_Prod_TL21.COL_ID, nIDLigne)
si nLigne > 0 alors
// Changer la couleur de fond en orange
FEN_Principale.TABLE_Prod_TL21[nLigne]..CouleurFond = RougePastel
LogSocket("[ALERTE] ✅
Ligne "
+ nLigne + " colorée en rouge")
// ✅
CORRECTION : Vérifier si l'utilisateur actuel est sur cette ligne
nLigneCourante est un entier = TableSelect(FEN_Principale.TABLE_Prod_TL21)
si nLigneCourante = nLigne alors
Info("⚠Attention !" + RC + RC + ...
"L'utilisateur " + sUtilisateur + " est en train d'éditer cette ligne." + RC + RC + ...
"Vos modifications risquent d'être écrasées.")
fin
fin
Procédure globale Socket_AfficherErreurConnexion
// ============================================================================
// PROCÉDURE EXISTANTE : Socket_AfficherErreurConnexion (MODIFIÉE)
// ============================================================================

