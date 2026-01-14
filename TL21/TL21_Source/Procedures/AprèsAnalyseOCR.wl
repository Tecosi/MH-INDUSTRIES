procédure AprèsAnalyseOCR(sTexte est une chaîne)
Initialisation de SAI_Aff
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
A chaque modification de SAI_Aff
Cherche_Doc()
Initialisation de SAI_Date
// Version 1
// Description
// Saisie d'une date avec calendrier
MoiMême=DateSys()
Initialisation de SAI_Date1
// Version 1
// Description
// Saisie d'une date avec calendrier
MoiMême=DateSys()
Initialisation de SAI_Date2
// Version 1
// Description
// Saisie d'une date avec calendrier
MoiMême=DateSys()
Initialisation de SAI_incident
HLitRecherchePremier(Incidents,Date_incident,SAI_DatePrevi)
si HTrouve() alors
SAI_incident = Incidents.Info_Incident
fin
Entrée dans SAI_incident
Sortie de SAI_incident
// ========== DÉBUT DE LA TRANSACTION ==========
HTransactionDébut()
// On tente de lire ET de verrouiller l'enregistrement en une seule opération
si HLitRecherchePremier(Incidents, Date_incident, SAI_DatePrevi) alors
// L'enregistrement existe et est verrouillé pour nous
Incidents.Info_Incident = SAI_incident
// --- DÉBUT DE L'ENCAPSULATION --gbModificationParMoiMeme = Vrai
// Votre code de modification
HModifie(Incidents)
// Libérer le verrou d'auto-notification
gbModificationParMoiMeme = Faux
// --- FIN DE L'ENCAPSULATION --// Vérification des erreurs
si HErreur() alors
Erreur("Erreur lors de la modification de l'incident : " + HErreurInfo())
HTransactionAnnule()
retour
fin
// Validation de la transaction de modification
HTransactionFin()
sinon
// L'enregistrement n'existe pas OU il est bloqué
si HErreurBlocage() alors
Info(
"L'incident pour cette date est actuellement modifié par un autre utilisateur. Veuillez
réessayer."
)
HTransactionAnnule()
retour
fin
// L'enregistrement n'existe pas, on peut l'ajouter
// Double vérification pour éviter un doublon (race condition)
si HLitRecherchePremier(Incidents, Date_incident, SAI_DatePrevi) alors
// Un autre utilisateur l'a créé entre temps
HTransactionAnnule()
Info("Cet incident a été créé par un autre utilisateur. Veuillez actualiser.")
// Actualisation de l'interface
HLitRecherchePremier(Incidents, Date_incident, SAI_DatePrevi)
si HTrouve() alors
SAI_incident = Incidents.Info_Incident
fin
retour
fin
// L'enregistrement n'existe vraiment pas, on l'ajoute
HRAZ(Incidents)
Incidents.Date_incident
= SAI_DatePrevi
Incidents.Info_Incident
= SAI_incident
// --- DÉBUT DE L'ENCAPSULATION --gbModificationParMoiMeme = Vrai
// AJOUTER CETTE LIGNE
HAjoute(Incidents)
// Libérer le verrou d'auto-notification
gbModificationParMoiMeme = Faux
// --- FIN DE L'ENCAPSULATION --//
// Vérification des erreurs
si HErreurDoublon() alors
Erreur("Un doublon a été détecté : " + HErreurInfo())
HTransactionAnnule()
retour
fin
si HErreur() alors
Erreur("Erreur lors de l'ajout de l'incident : " + HErreurInfo())
HTransactionAnnule()
retour
fin
// Validation de la transaction d'ajout
HTransactionFin()
fin
// ========== FIN DE LA TRANSACTION ==========
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
/////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
////////
//////////////////////////////////////////AVANT
CORRECTION/////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
// Incidents.Info_Incident = SAI_incident
//SINON
// Incidents.Date_incident = SAI_DatePrevi
// Incidents.Info_Incident = SAI_incident
//FIN
Initialisation de SAI_Piece
// Version 1
// Description
// Combo liste simple avec saisie
A chaque modification de SAI_Piece
Cherche_doc2()
Initialisation de SAI_Piece1
// Version 1
// Description
// Combo liste simple avec saisie
A chaque modification de SAI_Piece1
Cherche_doc2()
Sélection d'une ligne de TABLE_Doc
sPDFDest est une chaîne
documentsel est un entier = TableSelect(TABLE_Doc)
si fFichierExiste(TABLE_Doc.COL_Documents[documentsel]) = Vrai alors
si Contient(TABLE_Doc.COL_Documents[documentsel],".docx") alors
d est un Document
d = TABLE_Doc.COL_Documents[documentsel]
si fFichierExiste(d) = Vrai alors
sPDFDest = fRépertoireTemp()
sPDFDest += fExtraitChemin(d, fFichier)
sPDFDest += ".pdf"
si DocVersPDF(d, sPDFDest) alors
ToastSupprimeTout()
ToastAffiche(sPDFDest + " converti",toastCourt,cvMilieu,chCentre)
OuvrePDF(sPDFDest)
sinon
Erreur("Création fichier PDF Impossible")
fin
sinon
Erreur("Fichier inexistant")
fin
fin
si ChaîneFinitPar(TABLE_Doc.COL_Documents[documentsel],".doc") alors
Erreur("Fichier doc à convertir",TABLE_Doc.COL_Documents[documentsel])
fin
si ChaîneFinitPar(TABLE_Doc.COL_Documents[documentsel],".pdf") _ou_ ChaîneFinitPar(TABLE_Doc.COL_
Documents[documentsel],".PDF")alors
OuvrePDF(sPDFDest)
fin
si Contient(TABLE_Doc.COL_Documents[documentsel],".xls") alors
doc_comp est un xlsDocument
doc_comp = xlsOuvre(TABLE_Doc.COL_Documents[documentsel],xlsEcriture)
sPDFDest = fRépertoireTemp()
sPDFDest += fExtraitChemin(TABLE_Doc.COL_Documents[documentsel], fFichier)
sPDFDest += ".pdf"
iDestination(iPDF, sPDFDest)
si iImprimeXLS(doc_comp) = Faux alors Erreur("Ouverture fichier impossible")
OuvrePDF(sPDFDest)
fin
si Contient(TABLE_Doc.COL_Documents[documentsel],".mp4") alors
LanceAppliAssociée(TABLE_Doc.COL_Documents[documentsel])
fin
sinon
Erreur("Fichier inexistant")
fin
Initialisation de TABLE_Prod_TL21
TableAffiche(TABLE_Prod_TL21,taRéExécuteRequete)
Fin d'initialisation de TABLE_Prod_TL21
// Activer le filtre sur la date
TableActiveFiltre(TABLE_Prod_TL21.COL_Date, filtreEgal, SAI_DatePrevi)
// Trier par ordre
TableTrie(TABLE_Prod_TL21, "+COL_Ordre")
// Activer la surveillance
////HSurveille(Prod_TL21, HSurveille_Callback)
//////trace("surveillance ok")
//// procédure interne HSurveille_Callback(FichierDeDonnéesModifié Source de Données,
////
NuméroDeLenregistrement entier,
////
Action entier)
////
////
////
////
// NE PAS TRAITER SES PROPRES MODIFICATIONS
////
si gbModificationParMoiMeme = Vrai alors
////
// ✅
INCRÉMENTER LE COMPTEUR (pas de toast, pas d'actualisation)
////
gnNombreModifications++
////
retour
////
fin
////
////
// NE PAS ACTUALISER SI UNE SAISIE EST EN COURS
////
si gbSaisieEnCours = Vrai alors
////
gbActualisationEnAttente = Vrai
////
ToastAffiche("⏸
Actualisation en attente", toastCourt, cvBas, chCentre)
////
retour
////
fin
////
////
// MÉMORISER LA POSITION
////
nPositionActuelle est un entier
= TableSelect(TABLE_Prod_TL21)
////
nIDActuel est un entier = 0
////
ncolonne est un entier =ColonneEnCours()
////
si nPositionActuelle > 0 alors
////
nIDActuel = TABLE_Prod_TL21.COL_ID[nPositionActuelle]
////
fin
////
////
// ✅
RÉ-EXÉCUTER LA REQUÊTE
////
////
////
// ✅
ACTUALISER LA TABLE
////
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
////
TableTrie(TABLE_Prod_TL21, "+COL_Ordre")
////
////
// RESTAURER LA POSITION
////
si nIDActuel > 0 alors
////
pour i = 1 à TableOccurrence(TABLE_Prod_TL21)
////
si TABLE_Prod_TL21.COL_ID[i] = nIDActuel alors
////
TableSelectPlus(TABLE_Prod_TL21, i)
////
////
sortir
////
fin
////
fin
////
fin
////
////
// ✅
RAFRAÎCHIR LES ICÔNES
////
AfficheIconesDoc()
////
////
// NOTIFICATION
////
ToastAffiche("📥Données actualisées", toastCourt, cvBas, chCentre)
////
//// fin
// Afficher l'onglet
Entrée dans TABLE_Prod_TL21
Entrée en saisie d'une ligne de TABLE_Prod_TL21
// ═══════════════════════════════════════════════════════════════
// RÉCUPÉRER L'ID DE LA LIGNE
// ═══════════════════════════════════════════════════════════════
nIDLigne est un entier = TABLE_Prod_TL21.COL_ID
sUtilisateur est une chaîne
si nIDLigne = 0 alors
retour // Ligne vide
fin
// ═══════════════════════════════════════════════════════════════
// TENTER DE VERROUILLER L'ENREGISTREMENT
// ═══════════════════════════════════════════════════════════════
si HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDLigne) = Faux alors
// Impossible de verrouiller
si HErreurBlocage() alors
// Lire en lecture seule pour voir qui modifie
si HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDLigne) alors
sUtilisateur = Prod_TL21.Modifie_par
si sUtilisateur = "" alors
sUtilisateur = "un autre utilisateur"
fin
sinon
sUtilisateur = "un autre utilisateur"
fin
Info("🔒Ligne verrouillée" + RC + RC + ...
"Cette ligne est en cours de modification par :" + RC + ...
"👤" + sUtilisateur + RC + RC + ...
"Veuillez réessayer dans quelques instants.")
DonneFocusEtRetourUtilisateur()
retour
fin
fin
// --- ENCAPSULER POUR ÉVITER HSurveille --gbModificationParMoiMeme = Vrai
// ═══════════════════════════════════════════════════════════════
// VERROUILLAGE RÉUSSI : MARQUER QUI MODIFIE
// ═══════════════════════════════════════════════════════════════
si Prod_TL21.Modifie_par <> gsUtilisateurActuel alors
// Mémoriser la position actuelle
nPositionActuelle est un entier = TableSelect(TABLE_Prod_TL21)
nPositionAvant est un entier = TableSelect(TABLE_Prod_TL21)
Prod_TL21.Modifie_par
HModifie(Prod_TL21)
= gsUtilisateurActuel
gbModificationParMoiMeme = Faux
// --- FIN ENCAPSULATION --nPositionApres est un entier = TableSelect(TABLE_Prod_TL21)
// Restaurer la position si elle a changé
si TableSelect(TABLE_Prod_TL21) <> nPositionActuelle alors
TableSelectPlus(TABLE_Prod_TL21, nPositionActuelle)
fin
fin
// ═══════════════════════════════════════════════════════════════
// MÉMORISER LA LIGNE VERROUILLÉE
// ═══════════════════════════════════════════════════════════════
gnIDLigneEnCoursDeModification = nIDLigne
gnIDLigneEnCoursDeModification="+gnIDLigneEnCoursDeModification+hNumEnrEnCours)
Sortie d'une ligne de TABLE_Prod_TL21
// Récupérer l'ID de la ligne avant l'enregistrement
nIDLigne est un entier = TABLE_Prod_TL21.COL_ID
EnregistrerLigneModifiee()
// ═══════════════════════════════════════════════════════════════
// NOTIFIER VIA SOCKET
// ═══════════════════════════════════════════════════════════════
Socket_Envoyer("unlock", nIDLigne)
LogSocket("🔓Déverrouillage de la ligne " + nIDLigne + " notifié")
Socket_Envoyer("update", nIDLigne)
LogSocket("📝Mise à jour de la ligne "
+ nIDLigne + " notifiée")
// ═══════════════════════════════════════════════════════════════
// LIBÉRER LE VERROU HFSQL
// ═══════════════════════════════════════════════════════════════
si gnIDLigneEnCoursDeModification <> 0 alors
HDébloqueNumEnr(Prod_TL21, hNumEnrEnCours)
gnIDLigneEnCoursDeModification = 0
fin
// ═══════════════════════════════════════════════════════════════
// LIBÉRER LE CHAMP Modifie_par
// ═══════════════════════════════════════════════════════════════
gbSaisieEnCours = Faux
si TABLE_Prod_TL21 > 0 alors
nIDActuel est un entier = TABLE_Prod_TL21.COL_ID
si HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDActuel) alors
si Prod_TL21.Modifie_par = gsUtilisateurActuel alors
gbModificationParMoiMeme = Vrai
Prod_TL21.Modifie_par
= ""
HModifie(Prod_TL21)
gbModificationParMoiMeme = Faux
gnNombreModifications
= 0
fin
fin
fin
// ═══════════════════════════════════════════════════════════════
// ACTUALISER SI NÉCESSAIRE
// ═══════════════════════════════════════════════════════════════
si gbActualisationEnAttente = Vrai alors
gbActualisationEnAttente = Faux
nPositionActuelle est un entier
= TableSelect(TABLE_Prod_TL21)
nIDActuelPos est un entier = 0
si nPositionActuelle > 0 alors
nIDActuelPos = TABLE_Prod_TL21.COL_ID[nPositionActuelle]
fin
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
TableTrie(TABLE_Prod_TL21, "+COL_Ordre")
si nIDActuelPos > 0 alors
pour i = 1 à TableOccurrence(TABLE_Prod_TL21)
si TABLE_Prod_TL21.COL_ID[i] = nIDActuelPos alors
TableSelectPlus(TABLE_Prod_TL21, i)
sortir
fin
fin
fin
ToastAffiche("📥Données actualisées ("
cvBas, chCentre)
gnNombreModifications = 0
+ gnNombreModifications + " modifications)", toastCourt,
fin
Affichage d'une ligne de TABLE_Prod_TL21
// ═══════════════════════════════════════════════════════════════
// VÉRIFIER SI LA LIGNE CORRESPOND AU FILTRE
// ═══════════════════════════════════════════════════════════════
si TABLE_Prod_TL21.COL_Date <> SAI_DatePrevi alors
// Cette ligne ne correspond pas au filtre, ne rien faire
retour
fin
// Afficher les icônes de documents
AfficheIconesDoc()
// ═══════════════════════════════════════════════════════════════
// METTRE À JOUR LES DOCUMENTS SI NÉCESSAIRE
// ═══════════════════════════════════════════════════════════════
si TABLE_Prod_TL21.COL_Doc = "" et TABLE_Prod_TL21.COL_Affaire <> "" alors
// Pas de documents enregistrés, les récupérer
// Convertir la chaîne en entier
nAffaire est un entier = Val(TABLE_Prod_TL21.COL_Affaire)
si nAffaire > 0 alors
sListeDoc est une chaîne = MettreAJourDocuments(nAffaire)
si sListeDoc <> "" alors
// ───────────────────────────────────────────────────────────
// DÉBUT DE L'ENCAPSULATION
// ───────────────────────────────────────────────────────────
gbModificationParMoiMeme = Vrai
// Mettre à jour dans la base
si HLitRecherchePremier(Prod_TL21, IDProd_TL21, TABLE_Prod_TL21.COL_ID) alors
Prod_TL21.Doc
= sListeDoc
Prod_TL21.Modifie_par = gsUtilisateurActuel
HModifie(Prod_TL21)
Prod_TL21.Modifie_par = ""
HModifie(Prod_TL21)
fin
// Mettre à jour l'affichage
TABLE_Prod_TL21.COL_Doc
= sListeDoc
// ───────────────────────────────────────────────────────────
// ───────────────────────────────────────────────────────────
gbModificationParMoiMeme = Faux
fin
fin
fin
// ═══════════════════════════════════════════════════════════════
// GESTION DES COULEURS ET STYLES
// ═══════════════════════════════════════════════════════════════
si TABLE_Prod_TL21.COL_Param <> "" alors
selon TABLE_Prod_TL21.COL_Param
cas "R" :
// Police rouge
TABLE_Prod_TL21[TABLE_Prod_TL21].CouleurFond
= Transparent
TABLE_Prod_TL21[TABLE_Prod_TL21].Couleur
= RougeClair
TABLE_Prod_TL21[TABLE_Prod_TL21].PoliceGras
= Faux
cas "B" :
// Police noire
TABLE_Prod_TL21[TABLE_Prod_TL21].CouleurFond
TABLE_Prod_TL21[TABLE_Prod_TL21].Couleur
TABLE_Prod_TL21[TABLE_Prod_TL21].PoliceGras
= Transparent
= Noir
= Faux
cas "G" :
// Gras
TABLE_Prod_TL21[TABLE_Prod_TL21].CouleurFond
TABLE_Prod_TL21[TABLE_Prod_TL21].Couleur
TABLE_Prod_TL21[TABLE_Prod_TL21].PoliceGras
= Transparent
= CouleurDéfaut
= Vrai
cas "C" :
// Fond gris foncé + police blanche
TABLE_Prod_TL21[TABLE_Prod_TL21].CouleurFond
TABLE_Prod_TL21[TABLE_Prod_TL21].Couleur
TABLE_Prod_TL21[TABLE_Prod_TL21].PoliceGras
= BleuPastel
= Noir
= Faux
cas "J" :
// Fond jaune clair + police noire
TABLE_Prod_TL21[TABLE_Prod_TL21].CouleurFond
TABLE_Prod_TL21[TABLE_Prod_TL21].Couleur
TABLE_Prod_TL21[TABLE_Prod_TL21].PoliceGras
= JaunePastel
= Noir
= Faux
cas "V" :
// Fond vert clair + police noire
TABLE_Prod_TL21[TABLE_Prod_TL21].CouleurFond
= VertPastel
TABLE_Prod_TL21[TABLE_Prod_TL21].Couleur
TABLE_Prod_TL21[TABLE_Prod_TL21].PoliceGras
= Noir
= Faux
fin
sinon
// État normal : transparent pour conserver l'alternance
TABLE_Prod_TL21[TABLE_Prod_TL21].CouleurFond
= Transparent
TABLE_Prod_TL21[TABLE_Prod_TL21].Couleur
= CouleurDéfaut
TABLE_Prod_TL21[TABLE_Prod_TL21].PoliceGras
= Faux
fin
Entrée dans COL_Affaire ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_Affaire ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Balancelle ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_Balancelle ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Client ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_Client ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Commande ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_Commande ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Couleur ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
////// ═══════════════════════════════════════════════════════════════
////// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
////// ═══════════════════════════════════════════════════════════════
////
////// Appeler la procédure de verrouillage (existante)
////VerrouillerLignePourSaisie()
////
////
////// ═══════════════════════════════════════════════════════════════
////// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
////// ═══════════════════════════════════════════════════════════════
////
////// Récupérer l'ID de la ligne
////nIDLigne est un entier = TABLE_Prod_TL21.COL_ID
////
////// Envoyer le message de verrouillage
////Socket_Envoyer("lock", nIDLigne)
////
////Trace("🔒Verrouillage de la ligne " + nIDLigne + " notifié")
////
////
////// ═══════════════════════════════════════════════════════════════
////// NOTES
////// ═══════════════════════════════════════════════════════════════
//////
////// Séquence :
////// 1. User A entre dans une cellule
////// 2. VerrouillerLignePourSaisie() verrouille localement
////// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
////// 4. User B reçoit le message et voit "Modifié par User A"
//////
////// Avantages :
////// - Notification instantanée (< 50ms)
////// - Indicateur visuel pour tous les utilisateurs
////// - Évite les conflits d'édition
//////
////// ═══════════════════════════════════════════════════════════════
Sortie de COL_Couleur ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_CT ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
Sortie de COL_CT ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Date ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
Sortie de COL_Date ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_DESA ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_DESA ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_DetailCT ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
Sortie de COL_DetailCT ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Sortie de COL_Doc ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Clic sur COL_Doc1 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 1 alors
ToastSupprimeTout()
ToastAffiche(sLigneDoc,toastCourt,cvMilieu,chCentre)
fin
fin
Double clic sur COL_Doc1 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 1 alors
ToastSupprimeTout()
ToastAffiche("Ouverture du document : "+sLigneDoc,toastCourt,cvMilieu,chCentre)
si ChaîneFinitPar(sLigneDoc,".PDF") _ou_ ChaîneFinitPar(sLigneDoc,".pdf") alors
OuvrePDF(sLigneDoc)
sinon
LanceAppliAssociée(sLigneDoc)
fin
fin
fin
Clic sur COL_Doc2 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 2 alors
ToastSupprimeTout()
ToastAffiche(sLigneDoc,toastCourt,cvMilieu,chCentre)
fin
fin
Double clic sur COL_Doc2 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 2 alors
ToastSupprimeTout()
ToastAffiche("Ouverture du document : "+sLigneDoc,toastCourt,cvMilieu,chCentre)
si ChaîneFinitPar(sLigneDoc,".PDF") _ou_ ChaîneFinitPar(sLigneDoc,".pdf") alors
OuvrePDF(sLigneDoc)
sinon
LanceAppliAssociée(sLigneDoc)
fin
fin
fin
Clic sur COL_Doc3 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 3 alors
ToastSupprimeTout()
ToastAffiche(sLigneDoc,toastCourt,cvMilieu,chCentre)
fin
fin
Double clic sur COL_Doc3 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 3 alors
ToastSupprimeTout()
ToastAffiche("Ouverture du document : "+sLigneDoc,toastCourt,cvMilieu,chCentre)
si ChaîneFinitPar(sLigneDoc,".PDF") _ou_ ChaîneFinitPar(sLigneDoc,".pdf") alors
OuvrePDF(sLigneDoc)
sinon
LanceAppliAssociée(sLigneDoc)
fin
fin
fin
Clic sur COL_Doc4 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 4 alors
ToastSupprimeTout()
ToastAffiche(sLigneDoc,toastCourt,cvMilieu,chCentre)
fin
fin
Double clic sur COL_Doc4 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 4 alors
ToastSupprimeTout()
ToastAffiche("Ouverture du document : "+sLigneDoc,toastCourt,cvMilieu,chCentre)
si ChaîneFinitPar(sLigneDoc,".PDF") _ou_ ChaîneFinitPar(sLigneDoc,".pdf") alors
OuvrePDF(sLigneDoc)
sinon
LanceAppliAssociée(sLigneDoc)
fin
fin
fin
Clic sur COL_Doc5 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 5 alors
ToastSupprimeTout()
ToastAffiche(sLigneDoc,toastCourt,cvMilieu,chCentre)
fin
fin
Double clic sur COL_Doc5 ( TABLE_Prod_TL21 )
y est un entier = 0
pour toute chaîne sLigneDoc de TABLE_Prod_TL21.COL_Doc séparée par RC
y++
si y = 5 alors
ToastSupprimeTout()
ToastAffiche("Ouverture du document : "+sLigneDoc,toastCourt,cvMilieu,chCentre)
si ChaîneFinitPar(sLigneDoc,".PDF") _ou_ ChaîneFinitPar(sLigneDoc,".pdf") alors
OuvrePDF(sLigneDoc)
sinon
LanceAppliAssociée(sLigneDoc)
fin
fin
fin
Entrée dans COL_Epaisseurapres ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_Epaisseurapres ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Epaisseuravant ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_Epaisseuravant ( TABLE_Prod_TL21 )
Entrée dans COL_HeureVC ( TABLE_Prod_TL21 )
TABLE_Prod_TL21.COL_HeureVC = HeureSys()
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_HeureVC ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_HSF1Ereb ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_HSF1Ereb ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_HSFDerb ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_HSFDerb ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Sortie de COL_ID ( TABLE_Prod_TL21 )
Sortie de COL_Modifié_par ( TABLE_Prod_TL21 )
Entrée dans COL_Observations ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_Observations ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Ordre ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
Sortie de COL_Ordre ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Sortie de COL_Param ( TABLE_Prod_TL21 )
Entrée dans COL_PIECE ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_PIECE ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_QTEREST ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_QTEREST ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_R ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_R ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Reprise ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_Reprise ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Vconvoyeur ( TABLE_Prod_TL21 )
Socket_OnEntreeColonne()
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 1 : VERROUILLER LA LIGNE LOCALEMENT
//// ═══════════════════════════════════════════════════════════════
//
//// Appeler la procédure de verrouillage (existante)
//
//
//// ═══════════════════════════════════════════════════════════════
//// ÉTAPE 2 : NOTIFIER LES AUTRES UTILISATEURS VIA SOCKET
//// ═══════════════════════════════════════════════════════════════
//
//// Récupérer l'ID de la ligne
//
//// Envoyer le message de verrouillage
//
//
//
//// ═══════════════════════════════════════════════════════════════
//// NOTES
//// ═══════════════════════════════════════════════════════════════
////
//// Séquence :
//// 1. User A entre dans une cellule
//// 2. VerrouillerLignePourSaisie() verrouille localement
//// 3. Socket_Envoyer("lock") notifie les autres utilisateurs
//// 4. User B reçoit le message et voit "Modifié par User A"
////
//// Avantages :
//// - Notification instantanée (< 50ms)
//// - Indicateur visuel pour tous les utilisateurs
//// - Évite les conflits d'édition
////
//// ═══════════════════════════════════════════════════════════════
Sortie de COL_Vconvoyeur ( TABLE_Prod_TL21 )
Socket_OnSortieColonne()
Entrée dans COL_Select ( TABLE_vol1_Seletion_Affaires )
si COL_Select = 0 alors
nCompteselect ++
COL_Select = nCompteselect
sinon
COL_Select
= 0
fin
A chaque modification de COL_Select ( TABLE_vol1_Seletion_Affaires )
Initialisation de TBLR_Previ
n'est pas déjà ouvert","sur un autre poste")
TableurCharge(TBLR_Previ,unfichier)
TBLR_Previ.Zoom = 40
// FIN
Initialisation de TBLR_Prod
//
SI ErreurDétectée = Vrai ALORS Erreur("Impossible d'ouvrir le fichier","Merci de vérifier si il n'est
pas déjà ouvert","sur un autre poste")
// TBLR_Prod.SelectFeuille("Previ")
// TBLR_Prod.Zoom = 40
// FIN
Clic sur un lien de TBLR_Prod

