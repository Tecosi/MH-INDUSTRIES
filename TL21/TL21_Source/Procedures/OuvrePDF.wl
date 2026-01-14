procédure OuvrePDF(PDFDest)
// ═══════════════════════════════════════════════════════════════
// GESTION DES EXCEPTIONS POUR ÉVITER LE CRASH
// ═══════════════════════════════════════════════════════════════
quand exception dans
// ═══════════════════════════════════════════════════════════════
// NETTOYER LE CHEMIN
// ═══════════════════════════════════════════════════════════════
PDFDest = SansEspace(PDFDest, sscExtérieur)
// ═══════════════════════════════════════════════════════════════
// VÉRIFIER QUE LE FICHIER EXISTE
// ═══════════════════════════════════════════════════════════════
si fFichierExiste(PDFDest) = Faux alors
// Tenter de corriger les espaces multiples
sPDFCorrigé est une chaîne = Remplace(PDFDest, "
", " ")
si fFichierExiste(sPDFCorrigé) alors
PDFDest = sPDFCorrigé
sinon
// Afficher un message d'erreur clair
Erreur("Le fichier n'existe pas ou n'est pas accessible :" + RC + RC + ...
"📄" + fExtraitChemin(PDFDest, fFichier + fExtension) + RC + RC + ...
"Causes possibles :" + RC + ...
" • Le fichier a été déplacé ou supprimé" + RC + ...
" • Le lecteur réseau n'est pas accessible" + RC + ...
" • Vous n'avez pas les droits d'accès" + RC + RC + ...
"Chemin complet : " + PDFDest)
retour
fin
fin
// ═══════════════════════════════════════════════════════════════
// TROUVER LE PREMIER ONGLET PDF DISPONIBLE
// ═══════════════════════════════════════════════════════════════
// Onglet PDF principal (ONG_PDF)
si ONG_PDF.Visible = Faux alors
ONG_Recherche_et_selection.ONG_PDF.Visible = Vrai
si LecteurPDFOuvre(PDF_Lecteur, PDFDest) alors
PDF_Lecteur.BarreOutilsVisible = Faux
PDF_Lecteur.Zoom
= 100
ONG_Recherche_et_selection
= 6
sinon
Erreur("Impossible d'ouvrir le PDF dans le lecteur 1")
fin
retour
fin
// Onglet PDF 2
si ONG_PDF2.Visible = Faux alors
ONG_Recherche_et_selection.ONG_PDF2.Visible = Vrai
si LecteurPDFOuvre(PDF_Lecteur2, PDFDest) alors
PDF_Lecteur2.BarreOutilsVisible
= Faux
PDF_Lecteur2.Zoom
= 100
ONG_Recherche_et_selection
= 7
sinon
Erreur("Impossible d'ouvrir le PDF dans le lecteur 2")
fin
retour
fin
// Onglet PDF 3
si ONG_PDF3.Visible = Faux alors
ONG_Recherche_et_selection.ONG_PDF3.Visible = Vrai
si LecteurPDFOuvre(PDF_Lecteur3, PDFDest) alors
PDF_Lecteur3.BarreOutilsVisible
= Faux
PDF_Lecteur3.Zoom
= 100
ONG_Recherche_et_selection
= 8
sinon
Erreur("Impossible d'ouvrir le PDF dans le lecteur 3")
fin
retour
fin
// Onglet PDF 4
si ONG_PDF4.Visible = Faux alors
ONG_Recherche_et_selection.ONG_PDF4.Visible = Vrai
si LecteurPDFOuvre(PDF_Lecteur4, PDFDest) alors
PDF_Lecteur4.BarreOutilsVisible
= Faux
PDF_Lecteur4.Zoom
= 100
ONG_Recherche_et_selection
= 9
sinon
Erreur("Impossible d'ouvrir le PDF dans le lecteur 4")
fin
retour
fin
// Tous les onglets sont occupés, ouvrir dans le lecteur principal
si LecteurPDFOuvre(PDF_Lecteur, PDFDest) alors
PDF_Lecteur.BarreOutilsVisible = Faux
PDF_Lecteur.Zoom
= 100
ONG_Recherche_et_selection
= 6
sinon
Erreur("Impossible d'ouvrir le PDF : tous les lecteurs sont occupés")
fin
faire
// ═══════════════════════════════════════════════════════════════
// EN CAS D'EXCEPTION, AFFICHER UN MESSAGE CLAIR
// ═══════════════════════════════════════════════════════════════
Erreur("Une erreur s'est produite lors de l'ouverture du fichier :" + RC + RC + ...
fExtraitChemin(PDFDest, fFichier + fExtension) + RC + RC + ...
"Erreur : " + ExceptionInfo())
fin
Procédure locale Tranfertvol2
// Résumé : <indiquez ici ce que fait la procédure>
// Syntaxe :
//Tranfertvol2 ()
//
// Paramètres :
// Aucun
// Valeur de retour :
// Aucune
//
// Exemple :
// <Indiquez ici un exemple d'utilisation>
//

