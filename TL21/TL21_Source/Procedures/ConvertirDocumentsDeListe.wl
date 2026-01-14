procédure ConvertirDocumentsDeListe(local sListeDocuments est une chaîne)
// Vérifier si la liste est vide
si sListeDocuments = "" alors
retour
fin
// Déterminer le séparateur
sSéparateur est une chaîne
si Position(sListeDocuments, RC) > 0 alors
sSéparateur = RC
sinon si Position(sListeDocuments, ";") > 0 alors
sSéparateur = ";"
sinon
// Un seul document
ConvertirDocumentEnPDF(sListeDocuments)
retour
fin
// Parcourir la liste avec POUR TOUTE CHAÎNE
pour toute chaîne sCheminDocBrut de sListeDocuments séparée par sSéparateur
// Créer une variable locale pour nettoyer le chemin
sCheminDoc est une chaîne = SansEspace(sCheminDocBrut) // ← CORRECTION ICI
// Nettoyer le chemin
sCheminDoc = SansEspace(sCheminDocBrut,sscTout)
// Ignorer les chaînes vides
si sCheminDoc = "" alors
continuer
fin
// Vérifier si c'est un document à convertir
si Contient(sCheminDoc, ".docx") ou ...
Contient(sCheminDoc, ".xls") ou ...
Partie 7 › Collection de procédures › COL_PROCÉDURES_DE_GESTION_DES_ERREURS › Code
Contient(sCheminDoc, ".xlsx") alors
// Convertir en PDF
sPDFDest est une chaîne = ConvertirDocumentEnPDF(sCheminDoc)
si sPDFDest = "" alors
ToastAffiche("⚠Conversion impossible : " + fExtraitChemin(sCheminDoc, fFichier+
fExtension), toastCourt, cvHaut)
fin
fin
fin
ToastAffiche("✅
Conversions terminées"
, toastCourt, cvMilieu, chCentre)
Procédure globale LibererVerrousPourDate

