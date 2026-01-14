procédure Socket_SupprimerLigneTable(nIDEnreg est un entier)
LogSocket("[SUPPRESSION] 🔍Recherche de la ligne avec ID="
+ nIDEnreg)
// Protéger contre les boucles infinies
gbVerrouMajTable = Vrai
// Cette procédure sera appelée dans le thread principal
nLigne est un entier = TableCherche(FEN_Principale.TABLE_Prod_TL21.COL_ID, nIDEnreg, tcLinéaire)
si nLigne > 0 alors
TableSupprime(FEN_Principale.TABLE_Prod_TL21, nLigne)
LogSocket("[SUPPRESSION] ✅
Ligne "
+ nLigne + " supprimée de la table")
sinon
LogSocket("[SUPPRESSION] ⚠Ligne ID=" + nIDEnreg + " non trouvée")
fin
// Libérer le verrou
gbVerrouMajTable = Faux
Procédure globale Socket_ThreadGestionClient

