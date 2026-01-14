procédure ConvertirDocumentEnPDF(local sCheminSource est une chaîne) : chaîne
// ═══════════════════════════════════════════════════════════════
// VÉRIFICATIONS PRÉALABLES
// ═══════════════════════════════════════════════════════════════
si fFichierExiste(sCheminSource) = Faux alors
ToastAffiche("❌
Fichier introuvable : "
+ fExtraitChemin(sCheminSource, fFichier+fExtension),
toastLong, cvHaut)
renvoyer ""
fin
sExtension est une chaîne = fExtraitChemin(sCheminSource, fExtension)
sExtension = Minuscule(sExtension)
// Vérifier que c'est un format supporté
si sExtension <> ".docx" et sExtension <> ".xls" et sExtension <> ".xlsx" alors
ToastAffiche("⚠Format non supporté : " + sExtension, toastLong, cvHaut)
renvoyer ""
fin
// ═══════════════════════════════════════════════════════════════
// PRÉPARER LE CHEMIN DE DESTINATION
// ═══════════════════════════════════════════════════════════════
sPDFDest est une chaîne = fExtraitChemin(sCheminSource, fDisque + fRépertoire + fFichier) + ".pdf
"
bDoitConvertir est un booléen = Faux
// ═══════════════════════════════════════════════════════════════
// VÉRIFIER SI LA CONVERSION EST NÉCESSAIRE
// ═══════════════════════════════════════════════════════════════
si fFichierExiste(sPDFDest) = Faux alors
// Le PDF n'existe pas, il faut le créer
bDoitConvertir = Vrai
sinon
// Le PDF existe, vérifier s'il est plus ancien que le document source
dtDateSource est une DateHeure = fDateHeure(sCheminSource, "", fModification)
dtDatePDF est une DateHeure = fDateHeure(sPDFDest, "", fModification) si dtDateSource > dtDatePDF alors // Le document source a été modifié après le PDF, reconvertir bDoitConvertir = Vrai
ToastAffiche("🔄Document modifié, reconversion..." , toastCourt, cvMilieu)
sinon
// Le PDF est à jour
ToastAffiche("✓PDF à jour : " + fExtraitChemin(sPDFDest, fFichier+fExtension), toastCourt,
cvMilieu)
renvoyer sPDFDest
fin
fin
Partie 7 › Collection de procédures › COL_PROCÉDURES_DE_GESTION_DES_ERREURS › Code
// ═══════════════════════════════════════════════════════════════
// CONVERTIR SI NÉCESSAIRE
// ═══════════════════════════════════════════════════════════════
si bDoitConvertir alors
// Vérifier si le fichier est verrouillé
nHandle est un entier = fOuvre(sCheminSource, foLecture)
si nHandle = -1 alors
// Fichier verrouillé
ToastAffiche("⚠Document ouvert, conversion impossible : "
fFichier+fExtension), toastLong, cvHaut)
+ fExtraitChemin(sCheminSource,
// Utiliser le PDF existant si disponible
si fFichierExiste(sPDFDest) alors
ToastAffiche("ℹUtilisation du PDF existant (peut être obsolète)" , toastCourt, cvMilieu)
renvoyer sPDFDest
sinon
renvoyer ""
fin
sinon
// Fichier accessible
fFerme(nHandle)
// Désactiver les messages d'erreur système
ErreurChangeParamètre(epAfficheMessage,Faux)
// ═══════════════════════════════════════════════════════════════
// CONVERSION SELON LE TYPE DE FICHIER
// ═══════════════════════════════════════════════════════════════
bSuccès est un booléen = Faux
selon sExtension
cas ".docx"
// Conversion DOCX vers PDF
// Conversion DOCX vers PDF
d est un Document
d = sCheminSource // Charger le document depuis le chemin
si DocVersPDF(d, sPDFDest) alors
bSuccès = Vrai
ToastSupprimeTout()
ToastAffiche("✓" + fExtraitChemin(sPDFDest, fFichier+fExtension) + " converti",
toastCourt, cvMilieu, chCentre)
fin
cas ".xls", ".xlsx"
// Conversion Excel vers PDF
doc_comp est un xlsDocument
doc_comp = xlsOuvre(sCheminSource, xlsEcriture)
si ErreurDétectée = Faux alors
iDestination(iPDF, sPDFDest)
iImprimeXLS(doc_comp)
bSuccès = Vrai
ToastAffiche("✓ Excel converti : " + fExtraitChemin(sPDFDest, fFichier+fExtension
), toastCourt, cvMilieu)
fin
fin
// Réactiver les messages d'erreur
ErreurChangeParamètre(epAfficheMessage, Vrai)
// ═══════════════════════════════════════════════════════════════
// VÉRIFIER LE RÉSULTAT
// ═══════════════════════════════════════════════════════════════
Partie 7 › Collection de procédures › COL_PROCÉDURES_DE_GESTION_DES_ERREURS › Code
si bSuccès = Faux alors
ToastAffiche("❌
Création PDF impossible : "
fExtension), toastLong, cvHaut)
+ fExtraitChemin(sPDFDest, fFichier+
// Utiliser le PDF existant si disponible
si fFichierExiste(sPDFDest) alors
ToastAffiche("ℹUtilisation du PDF existant (peut être obsolète)" , toastCourt,
cvMilieu)
renvoyer sPDFDest
sinon
renvoyer ""
fin
fin
fin
fin
// Retourner le chemin du PDF
renvoyer sPDFDest
Procédure globale ConvertirDocumentsDeListe
// ═══════════════════════════════════════════════════════════════
// Procédure : ConvertirDocumentsDeListe
// Description : Convertit tous les documents DOCX/XLS d'une liste en PDF
// Paramètres :
// sListeDocuments (chaîne Unicode) : Liste de chemins séparés par RC ou ";"
// Retour : Rien

