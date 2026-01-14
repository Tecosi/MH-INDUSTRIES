procédure RenumeroterOrdresPourDate(dDate est une Date) : booléen
// ═══════════════════════════════════════════════════════════════
// DÉBUT DE L'ENCAPSULATION
// ═══════════════════════════════════════════════════════════════
bAncienneValeur est un booléen = FEN_Principale.gbModificationParMoiMeme
FEN_Principale.gbModificationParMoiMeme
= Vrai
FEN_Principale.gnNombreModifications
= 0 // ✅
RÉINITIALISER LE COMPTEUR
// ═══════════════════════════════════════════════════════════════
// ✅
LIBÉRER TOUS LES VERROUS AVANT LA RENUMÉROTATION
// ═══════════════════════════════════════════════════════════════
si pas LibererVerrousPourDate(dDate) alors
FEN_Principale.gbModificationParMoiMeme = bAncienneValeur
retour Faux
fin
// ═══════════════════════════════════════════════════════════════
// TRANSACTION POUR LA RENUMÉROTATION
// ═══════════════════════════════════════════════════════════════
si pas HTransactionDébut() alors
Erreur("Impossible de démarrer la transaction de renumérotation", HErreurInfo(hErrComplet))
FEN_Principale.gbModificationParMoiMeme = bAncienneValeur
retour Faux
fin
// Lire tous les enregistrements de la date triés par ordre
sRequête est une chaîne = [
SELECT IDProd_TL21
FROM Prod_TL21
WHERE [Date] = {ParamDate}
ORDER BY Ordre ASC
]
dsResultat est une Source de Données
dsResultat.ParamDate = dDate
si pas HExécuteRequêteSQL(dsResultat, hRequêteDéfaut, sRequête) alors
Erreur("Erreur lors de la lecture des enregistrements à renuméroter", HErreurInfo(hErrComplet))
HTransactionAnnule()
FEN_Principale.gbModificationParMoiMeme = bAncienneValeur
retour Faux
fin
// Renuméroter chaque enregistrement
nOrdre est un entier = 1
pour tout dsResultat
Partie 7 › Collection de procédures › COL_PROCÉDURES_DE_GESTION_DES_ERREURS › Code
si pas HLitRecherchePremier(Prod_TL21, IDProd_TL21, dsResultat.IDProd_TL21) alors
Erreur("Erreur lors de la lecture de l'enregistrement ID=" + dsResultat.IDProd_TL21,
HErreurInfo(hErrComplet))
HTransactionAnnule()
FEN_Principale.gbModificationParMoiMeme = bAncienneValeur
retour Faux
fin
si Prod_TL21.Ordre <> nOrdre alors
Prod_TL21.Ordre = nOrdre
si pas HModifie(Prod_TL21) alors
Erreur("Erreur lors de la modification de l'ordre pour l'enregistrement ID=" + dsResultat.
IDProd_TL21, HErreurInfo(hErrComplet))
HTransactionAnnule()
FEN_Principale.gbModificationParMoiMeme = bAncienneValeur
retour Faux
fin
fin
nOrdre++
fin
si pas HTransactionFin() alors
Erreur("Erreur lors de la validation de la transaction de renumérotation", HErreurInfo(hErrComplet)
)
HTransactionAnnule()
FEN_Principale.gbModificationParMoiMeme = bAncienneValeur
retour Faux
fin
// ═══════════════════════════════════════════════════════════════
// ═══════════════════════════════════════════════════════════════
FEN_Principale.gbModificationParMoiMeme = bAncienneValeur
// ═══════════════════════════════════════════════════════════════
// ✅
ACTUALISER LA TABLE UNE SEULE FOIS
// ═══════════════════════════════════════════════════════════════
TableAffiche(FEN_Principale.TABLE_Prod_TL21, taRéExécuteRequete)
TableTrie(FEN_Principale.TABLE_Prod_TL21, "+COL_Ordre")
// ═══════════════════════════════════════════════════════════════
// ✅
AFFICHER UN SEUL TOAST AVEC LE NOMBRE DE MODIFICATIONS
// ═══════════════════════════════════════════════════════════════
si FEN_Principale.gnNombreModifications > 0 alors
ToastAffiche(ChaîneConstruit("✓%1 ligne(s) renumérotée(s)" , FEN_Principale.gnNombreModifications),
toastCourt, cvBas, chCentre)
FEN_Principale.gnNombreModifications = 0 // Réinitialiser
fin
retour Vrai
Partie 7 › Collection de procédures › Entrées_Sorties › Code
Entrées_Sorties
Code
Procédure globale Socket_OnEntreeColonne

