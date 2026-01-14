procédure Socket_RechargerTable()
LogSocket("[RELOAD-TABLE] 🔄Rechargement complet de la table" )
gbVerrouMajTable = Vrai
TableAffiche(FEN_Principale.TABLE_Prod_TL21, taRéExécuteRequete)
gbVerrouMajTable = Faux
LogSocket("[RELOAD-TABLE] ✅
Table rechargée"
)
Procédure globale Socket_ReconnecterAuServeur
// ============================================================================
// NOUVELLE PROCÉDURE : Socket_ReconnecterAuServeur
// ============================================================================

