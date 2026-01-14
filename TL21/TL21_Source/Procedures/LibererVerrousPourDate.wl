procédure LibererVerrousPourDate(dDate est une Date) : booléen
// ═══════════════════════════════════════════════════════════════
// LIBÉRER TOUS LES VERROUS POUR UNE DATE DONNÉE
// ═══════════════════════════════════════════════════════════════
sRequête est une chaîne = [
SELECT IDProd_TL21
FROM Prod_TL21
WHERE [Date] = {ParamDate}
]
dsResultat est une Source de Données
dsResultat.ParamDate = dDate
si pas HExécuteRequêteSQL(dsResultat, hRequêteDéfaut, sRequête) alors
Erreur("Erreur lors de la lecture des enregistrements", HErreurInfo(hErrComplet))
retour Faux
fin
nNbVerrousLiberes est un entier = 0
pour tout dsResultat
// ✅
LIRE L'ENREGISTREMENT PAR SON ID
si HLitRecherchePremier(Prod_TL21, IDProd_TL21, dsResultat.IDProd_TL21) alors
// ✅
DÉBLOQUER EN UTILISANT hNumEnrEnCours
HDébloqueNumEnr(Prod_TL21, hNumEnrEnCours)
nNbVerrousLiberes++
fin
fin
si nNbVerrousLiberes > 0 alors
ToastAffiche("🔓" + nNbVerrousLiberes + " verrou(s) libéré(s)", toastCourt, cvBas, chCentre)
fin
retour Vrai
Procédure globale MettreAJourDocuments

