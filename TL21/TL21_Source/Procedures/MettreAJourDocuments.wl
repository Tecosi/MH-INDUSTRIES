procédure MettreAJourDocuments(nAffaire est un entier) : chaîne
Partie 7 › Collection de procédures › COL_PROCÉDURES_DE_GESTION_DES_ERREURS › Code
listdoc est une chaîne
k est un entier = ""
= 20
HExécuteRequête(REQ_Documents, hRequêteDéfaut, nAffaire)
pour tout REQ_Documents
sPDFDest est une chaîne = REQ_Documents.Documents_Piece
// --- GESTION DES FICHIERS MANQUANTS --si fFichierExiste(sPDFDest) = Faux alors
continuer
fin
// --- CONVERSION DOCX EN PDF --si Contient(REQ_Documents.Documents_Piece, ".docx") alors
d est un Document
d = REQ_Documents.Documents_Piece
si fFichierExiste(d) = Vrai alors
sPDFDest = fExtraitChemin(d, fDisque + fRépertoire + fFichier) + ".pdf"
// Convertir uniquement si le PDF n'existe pas
si fFichierExiste(sPDFDest) = Faux alors
si pas DocVersPDF(d, sPDFDest) alors
continuer
fin
fin
fin
fin
// --- FICHIERS .DOC (ANCIEN FORMAT) --si ChaîneFinitPar(REQ_Documents.Documents_Piece, ".doc") alors
continuer
fin
// --- CONVERSION XLS EN PDF --si Contient(REQ_Documents.Documents_Piece, ".xls") et fFichierExiste(REQ_Documents.Documents_Piece)
alors
sPDFDest = fExtraitChemin(REQ_Documents.Documents_Piece, fDisque + fRépertoire + fFichier) + "
.pdf"
// Convertir uniquement si le PDF n'existe pas
si fFichierExiste(sPDFDest) = Faux alors
doc_comp est un xlsDocument
doc_comp = xlsOuvre(REQ_Documents.Documents_Piece, xlsEcriture)
si ErreurDétectée = Faux alors
iDestination(iPDF, sPDFDest)
iImprimeXLS(doc_comp)
sinon
continuer
fin
fin
fin
// --- CONCATÉNATION DES DOCUMENTS AVEC RC --si listdoc <> "" alors listdoc += RC
listdoc += sPDFDest
fin
renvoyer listdoc
Procédure globale RenumeroterOrdresPourDate
Partie 7 › Collection de procédures › COL_PROCÉDURES_DE_GESTION_DES_ERREURS › Code
// ═══════════════════════════════════════════════════════════════════════════════
// PROCÉDURE : RenumeroterOrdresPourDate
// ═══════════════════════════════════════════════════════════════════════════════
// DESCRIPTION :
//
Renuméroter tous les enregistrements d'une date donnée dans l'ordre croissant
//
en utilisant une transaction pour garantir la cohérence multi-utilisateur
//
// PARAMÈTRES :
//
dDate : Date pour laquelle renuméroter les enregistrements
//
// RETOUR :
//
Booléen : Vrai si succès, Faux si échec
//
// VERSION : 3.0 - Correction boucle de notifications
// DATE : 06/12/2025
// ═══════════════════════════════════════════════════════════════════════════════

