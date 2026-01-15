// ═══════════════════════════════════════════════════════════════
// DÉCLARATIONS GLOBALES - FEN_Principale
// ═══════════════════════════════════════════════════════════════

// Événement : Initialisation de FEN_Principale
// ═══════════════════════════════════════════════════════════════
// ═══════════════════════════════════════════════════════════════
// LIBÉRER TOUS LES VERROUS DE L'UTILISATEUR ACTUEL
// ═══════════════════════════════════════════════════════════════
HLibère(Prod_TL21)
HLibère(Incidents)
// Réinitialiser la variable globale
gnIDLigneEnCoursDeModification = 0
ToastAffiche("🔓Session initialisée" , toastCourt, cvBas, chCentre)
///////////////////////////////////////////////////////////////////////////////
// ========== VARIABLES DE GESTION DE LA SURVEILLANCE TEMPS RÉEL ==========///
/////////////////////////////////////////////////////////////////////////////
// Indique si l'utilisateur a modifié des données non encore sauvegardées
gbDonnéesModifiées est un booléen = Faux
// Indique qu'une actualisation est en attente (modifications détectées pendant une saisie)
gbActualisationEnAttente est un booléen = Faux
// ========== VARIABLES DE PROTECTION ANTI-BOUCLE ==========
// Cette variable empêche la procédure de surveillance de se déclencher elle-même
gbSurveillanceEnCours est un booléen = Faux
// ========== VARIABLES D'ACTIVATION DIFFÉRÉE ==========
// Indique si la surveillance a déjà été activée
gbSurveillanceActive est un booléen = Faux
// ========== VARIABLE POUR L'AUTO-FILTRAGE ==========
// Cette variable permet d'ignorer les notifications pour ses propres modifications
gbModificationParMoiMeme est un booléen = Faux
// ========== VARIABLE POUR STOCKER LE NOM DE L'UTILISATEUR ACTUEL ==========
// ✅
COMPTEUR DE MODIFICATIONS (pour afficher un seul toast à la fin)
gnNombreModifications est un entier
= 0
///////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
sEnvironnement est une chaîne // Récupère la variable sEnvironnement = SysEnvironnement("USERNAME")
// Extrait la valeur de la variable
sEnvironnement
= ExtraitChaîne(sEnvironnement, 2, "=")
checkuser est un booléen = 0
listusers est une chaîne pour tout Users_TL21 listusers = listusers + Users_TL21.login + "-"
si Users_TL21.login = sEnvironnement
ToastAffiche(Users_TL21.login,toastCourt)
LIB_User.Libellé
= Users_TL21.login
checkuser
= 1
si Users_TL21.admin = 1 alors
BTN_Admin.Visible
BTN_Ajout.Visible
BTN_Filter_sur_la_selection.Visible
BTN_Rechercher.Visible
BTN_Gras.Visible
BTN_Rouge.Visible
= Vrai
= Vrai
= Vrai
= Vrai
= Vrai
= Vrai
BTN_Noir.Visible
BTN_SupLigne.Visible
SAI_Du.Visible
SAI_Au.Visible
LIB_NBAFF.Visible
ONG_Recherche_et_selection.AFFAIRES.Visible
ONG_Recherche_et_selection.CTPlaques.Visible
ONG_Recherche_et_selection.CTOsmo.Visible
ONG_Recherche_et_selection.CT_TTS.Visible
BTN_Libérer..Visible
= Vrai
= Vrai
= Vrai
= Vrai
= Vrai
= Vrai
= Vrai
= Vrai
= Vrai
= Vrai
fin
fin
fin
si checkuser = 0 alors
LIB_User.Libellé
= sEnvironnement
Info ("Utilisateur <"+ sEnvironnement + "> non autorisé.",
"Contacter la PRODUCTION pour demander les accès.")
Ferme(FEN_Principale)
fin
unfichier est une chaîne sFichierdest est une chaîne = gsChemin_groupe+"\PRODUCTION\PROD_PLANNING\2025-2026\" + DateVersChaîne
(DateSys(),"MMMM AAAA") + "\Prod du " + DateVersChaîne(DateSys,"Jjjj JJ Mmmm AAAA") + "_APP.xlsx"
JJ Mmmm AAAA") + "_test.xlsx"
dStockDate est une DateHeure unfichier = "C:\Users\Public\Documents\Sources_SpeMH\Previ_TL21_socket.xlsx"
ajd est une Date = DateSys()
ajd..Année += 1
SAI_Au = ajd
nCompteselect est un entier = 0
gsUtilisateurActuel=SysEnvironnement("USERNAME").ExtraitChaîne(2, "=")
// Notification optionnelle (à retirer en production)
ToastAffiche("⏳
Chargement en cours..." , toastCourt, cvBas, chDroite)
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// ═══════════════════════════════════════════════════════════════
// INITIALISATION SOCKET POUR SYNCHRONISATION TEMPS RÉEL
// ═══════════════════════════════════════════════════════════════
// Initialiser le socket (serveur ou client)
Socket_Initialiser()
/// Appeler la fonction d'initialisation
Fin d'initialisation de FEN_Principale
// =================================================================================
// DÉSACTIVATION DE LA GESTION AUTOMATIQUE DES ERREURS DE BLOCAGE
// On indique à WinDev de ne PAS afficher sa fenêtre d'erreur fatale
// en cas de blocage, pour que notre code personnalisé puisse prendre le relais.
// =================================================================================
HSurErreur("*",hErrBlocage, "") // Ne rien faire en cas d'erreur de blocage
Fermeture de FEN_Principale
// ═══════════════════════════════════════════════════════════════
// FERMETURE DE LA FENÊTRE
// ═══════════════════════════════════════════════════════════════
// Notifier qu'on arrête d'éditer
si gbSaisieEnCours alors
Socket_Envoyer("stop_editing", gnEnregistrementEnCours)
fin
// Fermer le socket proprement
Socket_Fermer()
// Libérer les verrous (sécurité)
HLibère(Incidents)
// Réinitialiser la date
SAI_DatePrevi = DateSys()
FEN_Principale
Code des champs
Clic sur BTN_ActuDoc
//Clic sur BTN_ActuDoc
nLigneSelectionnee
nNbLignes est un entier est un entier = TableSelect(TABLE_Prod_TL21)
= TableOccurrence(TABLE_Prod_TL21, toAffichée)
si nLigneSelectionnee > 0 alors
nChoix est un entier = OuiNon(Oui, "Mettre à jour les documents ?" + RC + RC + ...
"OUI = Ligne sélectionnée uniquement" + RC + ...
"NON = Toutes les lignes (" + nNbLignes + ")")
// ENCAPSULATION
gbModificationParMoiMeme = Vrai
si nChoix = Oui alors
// ───────────────────────────────────────────────────────────
// LIGNE SÉLECTIONNÉE UNIQUEMENT
// ───────────────────────────────────────────────────────────
nAffaire est un entier
= TABLE_Prod_TL21.COL_Affaire[nLigneSelectionnee]
nID est un entier = TABLE_Prod_TL21.COL_ID[nLigneSelectionnee]
si nAffaire <> 0 et nID > 0 alors
// Récupérer la liste des documents
sListeDoc est une chaîne = MettreAJourDocuments(nAffaire)
// Mettre à jour dans la base
si HLitRecherchePremier(Prod_TL21, IDProd_TL21, nID) alors
Prod_TL21.Doc
= sListeDoc
Prod_TL21.Modifie_par = gsUtilisateurActuel
HModifie(Prod_TL21)
fin
// ✅
RAFRAÎCHIR LA TABLE (ajouté)
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
// Restaurer la sélection
pour i = 1 à TableOccurrence(TABLE_Prod_TL21)
si TABLE_Prod_TL21.COL_ID[i] = nID alors
TableSelectPlus(TABLE_Prod_TL21, i)
sortir
fin
fin
AfficheIconesDoc()
ToastAffiche("✅
Documents mis à jour" , toastCourt, cvMilieu, chCentre)
sinon
Info("Aucune affaire associée à cette ligne")
fin
sinon
// ───────────────────────────────────────────────────────────
// TOUTES LES LIGNES
// ───────────────────────────────────────────────────────────
Jauge(0, nNbLignes, "Mise à jour des documents...")
pour i = 1 à nNbLignes
Jauge(i)
nAffaire est un entier
= TABLE_Prod_TL21.COL_Affaire[i]
nID est un entier = TABLE_Prod_TL21.COL_ID[i]
si nAffaire <> 0 et nID > 0 alors
sListeDoc est une chaîne = MettreAJourDocuments(nAffaire)
si HLitRecherchePremier(Prod_TL21, IDProd_TL21, nID) alors
Prod_TL21.Doc
= sListeDoc
Prod_TL21.Modifie_par = gsUtilisateurActuel
HModifie(Prod_TL21)
fin
fin
fin
Jauge()
// ✅
RAFRAÎCHIR LA TABLE (déjà présent)
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
ToastAffiche("✅
Documents mis à jour pour "
chCentre)
+ nNbLignes + " ligne(s)", toastCourt, cvMilieu,
fin
gbModificationParMoiMeme = Faux
sinon
Info("Veuillez sélectionner une ligne")
fin
Clic sur BTN_Admin
Ouvre(FEN_Gestion_utilisateurs)
Clic sur BTN_Ajout
// Clic sur BTN_Ajout
//Clic sur BTN_Ajout
// ═══════════════════════════════════════════════════════════════
// 1. INITIALISER LE TABLEUR
// ═══════════════════════════════════════════════════════════════
TBLR_Previ.SelectFeuille("Previ")
TableurAjouteDonnée(TBLR_Previ, 1, 1, DateVersChaîne(SAI_DatePrevi, "Jjjj JJ Mmmm AAAA"))
// Trouver la dernière ligne utilisée dans le tableur
i, last est un entier
pour i = 1 à 200
si TBLR_Previ["B"][i] <> "" alors last = i
fin
i
= last + 1
// ═══════════════════════════════════════════════════════════════
// 2. ENCAPSULATION POUR HSurveille (AVANT LA BOUCLE)
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Vrai
// ═══════════════════════════════════════════════════════════════
// 3. TRANSACTION POUR GARANTIR LA COHÉRENCE
// ═══════════════════════════════════════════════════════════════
HTransactionDébut()
// ═══════════════════════════════════════════════════════════════
// 4. COMPTEUR D'AFFAIRES AJOUTÉES
// ═══════════════════════════════════════════════════════════════
nbafftab est un entier = 0
// ═══════════════════════════════════════════════════════════════
// 5. PARCOURIR LES AFFAIRES SÉLECTIONNÉES
// ═══════════════════════════════════════════════════════════════
pour j = 1 à TableOccurrence(TABLE_vol1_Seletion_Affaires)
nbafftab++
// ───────────────────────────────────────────────────────────
// 5.1. INITIALISER L'ENREGISTREMENT
// ───────────────────────────────────────────────────────────
HRAZ(Prod_TL21)
// ───────────────────────────────────────────────────────────
// 5.2. AFFECTER LES VALEURS DEPUIS LA TABLE DE SÉLECTION
// ───────────────────────────────────────────────────────────
l est un entier = TableOccurrence(TABLE_Prod_TL21) + 1
Prod_TL21.Date
= SAI_DatePrevi
Prod_TL21.Ordre
= l
Prod_TL21.Client
= TABLE_vol1_Seletion_Affaires.COL_COCLI[j]
Prod_TL21.Affaire
= TABLE_vol1_Seletion_Affaires.COL_NAF[j]
Prod_TL21.Commande
= SansEspace(TABLE_vol1_Seletion_Affaires.COL_COCDE[j], sscExtérieur)
Prod_TL21.PIECE
= SansEspace(TABLE_vol1_Seletion_Affaires.COL_PIECE[j], sscExtérieur)
Prod_TL21.DESA
= SansEspace(TABLE_vol1_Seletion_Affaires.COL_DESA[j], sscExtérieur)
Prod_TL21.QTEREST
= TABLE_vol1_Seletion_Affaires.COL_QTEAFREST[j]
Prod_TL21.Couleur
= TABLE_vol1_Seletion_Affaires.COL_DOSSIER[j]
Prod_TL21.R
= TABLE_vol1_Seletion_Affaires.COL_R[j]
Prod_TL21.Balancelle = TABLE_vol1_Seletion_Affaires.COL_Balancelle[j]
Prod_TL21.Observations
= TABLE_vol1_Seletion_Affaires.COL_Observations[j]
Prod_TL21.Version
= DateSys()+HeureSys()
Prod_TL21.FLAG
= ""
Prod_TL21.Modifie_par = gsUtilisateurActuel
// ───────────────────────────────────────────────────────────
// 5.3. RECHERCHER LES DOCUMENTS ASSOCIÉS À L'AFFAIRE
// ───────────────────────────────────────────────────────────
listdoc est une chaîne
= ""
k est un entier = 20
HExécuteRequête(REQ_Documents, hRequêteDéfaut, TABLE_vol1_Seletion_Affaires.COL_NAF[j])
pour tout REQ_Documents
sPDFDest est une chaîne = REQ_Documents.Documents_Piece
// ───────────────────────────────────────────────────────
// 5.3.1. VÉRIFIER QUE LE FICHIER EXISTE
// ───────────────────────────────────────────────────────
si fFichierExiste(sPDFDest) = Faux alors
ToastAffiche("⚠
Fichier manquant : "
+ fExtraitChemin(sPDFDest, fFichier+fExtension),
toastLong, cvHaut)
continuer
fin
// ───────────────────────────────────────────────────────
// 5.3.2. CONVERSION EN PDF SI NÉCESSAIRE (DOCX, XLS, XLSX)
// ───────────────────────────────────────────────────────
si Contient(REQ_Documents.Documents_Piece, ".docx") ou ...
Contient(REQ_Documents.Documents_Piece, ".xls") alors
// Appeler la procédure de conversion
sPDFDest = ConvertirDocumentEnPDF(REQ_Documents.Documents_Piece)
si sPDFDest = "" alors
// Échec de la conversion et pas de PDF existant
continuer
fin
fin
// ───────────────────────────────────────────────────────
// 5.3.3. AJOUTER AU TABLEUR
// ───────────────────────────────────────────────────────
TableurAjouteDonnée(TBLR_Previ, k, i+j-1, fExtraitChemin(sPDFDest, fFichier + fExtension))
TableurAjouteLien(TBLR_Previ, k, i+j-1, sPDFDest)
k++
// ───────────────────────────────────────────────────────
// 5.3.4. CONCATÉNER LES DOCUMENTS AVEC RC
// ───────────────────────────────────────────────────────
si listdoc <> "" alors listdoc += RC
listdoc += sPDFDest
fin
// ───────────────────────────────────────────────────────────
// 5.4. AFFECTER LA LISTE DES DOCUMENTS
// ───────────────────────────────────────────────────────────
Prod_TL21.Doc = listdoc
// ───────────────────────────────────────────────────────────
// 5.5. AJOUTER L'ENREGISTREMENT
// ───────────────────────────────────────────────────────────
HAjoute(Prod_TL21)
// ───────────────────────────────────────────────────────────
// 5.6. VÉRIFIER LES ERREURS
// ───────────────────────────────────────────────────────────
si HErreurDoublon() alors
Erreur("Un doublon a été détecté lors de l'ajout de l'affaire " + Prod_TL21.Affaire + RC +
HErreurInfo())
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
si HErreur() alors
Erreur("Erreur lors de l'ajout de l'affaire " + Prod_TL21.Affaire + RC + HErreurInfo())
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
l++
fin
// ═══════════════════════════════════════════════════════════════
// 6. VALIDER LA TRANSACTION
// ═══════════════════════════════════════════════════════════════
HTransactionFin()
// ═══════════════════════════════════════════════════════════════
// 7. RENUMÉROTATION AUTOMATIQUE
// ═══════════════════════════════════════════════════════════════
dDateAjout est une Date = SAI_DatePrevi
RenumeroterOrdresPourDate(dDateAjout)
// ═══════════════════════════════════════════════════════════════
// 8. ✅
RAFRAÎCHIR LA TABLE (AJOUTÉ)
// ═══════════════════════════════════════════════════════════════
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
TableTrie(TABLE_Prod_TL21, "+COL_Ordre")
// ═══════════════════════════════════════════════════════════════
// 9. FIN DE L'ENCAPSULATION (APRÈS TOUT, Y COMPRIS LE RAFRAÎCHISSEMENT)
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Faux
// ═══════════════════════════════════════════════════════════════
// 10. MISE EN FORME DU TABLEUR
// ═══════════════════════════════════════════════════════════════
TBLR_Previ["T"]..Largeur = 200
TBLR_Previ["U"]..Largeur = 200
TBLR_Previ["V"]..Largeur = 200
TableurSelectMoins(TBLR_Previ)
TableurSelectMoins(TBLR_Prod)
// ═══════════════════════════════════════════════════════════════
// 11. AFFICHER L'ONGLET ET NOTIFICATION
// ═══════════════════════════════════════════════════════════════
ONG_Recherche_et_selection = 4
ToastAffiche("✅
Ajout réussi : "
+ nbafftab + " affaire(s) ajoutée(s)", toastLong, cvMilieu, chCentre)
Clic sur BTN_AjoutLigne
// ═══════════════════════════════════════════════════════════════
// BOUTON BTN_AjoutLigne - AVEC DUPLICATION MULTIPLE
// ═══════════════════════════════════════════════════════════════

gbSaisieEnCours = Vrai
gbDonnéesModifiées = Faux

// ═══════════════════════════════════════════════════════════════
// 1. VÉRIFIER QU'UNE DATE EST SÉLECTIONNÉE
// ═══════════════════════════════════════════════════════════════
si SAI_DatePrevi = "" alors
	Erreur("Veuillez sélectionner une date avant d'ajouter une ligne.")
	gbSaisieEnCours = Faux
	retour
fin

// ═══════════════════════════════════════════════════════════════
// 2. AFFICHER UN MENU CONTEXTUEL POUR CHOISIR L'ACTION
// ═══════════════════════════════════════════════════════════════
nChoix est un entier = Dialogue("Voulez-vous créer une nouvelle ligne vide ou Dupliquer la(les) ligne(s) sélectionnée(s) ?")

// Si l'utilisateur annule (0 = aucun choix)
si nChoix = 0 alors
	gbSaisieEnCours = Faux
	retour
fin

// ═══════════════════════════════════════════════════════════════
// 3. TRAITER LE CHOIX
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Vrai

// ───────────────────────────────────────────────────────────────
// 3.1 CALCULER LE NOUVEL ORDRE DE DÉPART (max + 1)
// ───────────────────────────────────────────────────────────────
nNouvelOrdre est un entier = 1

pour tout Prod_TL21 avec Date = SAI_DatePrevi
	si Prod_TL21.Ordre > nNouvelOrdre alors
		nNouvelOrdre = Prod_TL21.Ordre
	fin
fin

nNouvelOrdre++

// ───────────────────────────────────────────────────────────────
// 3.2 PRÉPARER L'ENREGISTREMENT SELON LE CHOIX
// ───────────────────────────────────────────────────────────────
si nChoix = 2 alors
	// ═══════════════════════════════════════════════════════════
	// OPTION 2 : DUPLIQUER LA/LES LIGNE(S) SÉLECTIONNÉE(S)
	// ═══════════════════════════════════════════════════════════
	
	// Récupérer toutes les lignes sélectionnées
	tabLignesSelectionnees est un tableau d'entiers
	nIndice est un entier = TableSelectOccurrence(TABLE_Prod_TL21)
	
	si nIndice = 0 alors
		Erreur("Aucune ligne sélectionnée. Impossible de dupliquer.")
		gbModificationParMoiMeme = Faux
		gbSaisieEnCours = Faux
		retour
	fin
	
	// Récupérer les indices de toutes les lignes sélectionnées
	pour i = 1 à nIndice
		nLigneSelectionnee est un entier = TableSelect(TABLE_Prod_TL21, i)
		TableauAjoute(tabLignesSelectionnees, nLigneSelectionnee)
	fin
	
	// Dupliquer chaque ligne sélectionnée
	nDernierID est un entier sur 8 octets = 0
	
	pour tout nLigneSelectionnee de tabLignesSelectionnees
		// Récupérer l'ID de la ligne sélectionnée
		nIDSource est un entier sur 8 octets = TABLE_Prod_TL21.COL_ID[nLigneSelectionnee]
		
		// Lire l'enregistrement source
		si HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDSource) alors
			// Sauvegarder les valeurs dans des variables temporaires
			sClient est une chaîne = Prod_TL21.Client
			nAffaire est un entier = Prod_TL21.Affaire
			sCommande est une chaîne = Prod_TL21.Commande
			sPIECE est une chaîne = Prod_TL21.PIECE
			sDESA est une chaîne = Prod_TL21.DESA
			nQTEREST est un entier = Prod_TL21.QTEREST
			sCouleur est une chaîne = Prod_TL21.Couleur
			sR est une chaîne = Prod_TL21.R
			sBalancelle est une chaîne = Prod_TL21.Balancelle
			sReprise est une chaîne = Prod_TL21.Reprise
			sObservations est une chaîne = Prod_TL21.Observations
			rEpaisseuravant est un réel = Prod_TL21.Epaisseuravant
			rEpaisseurapres est un réel = Prod_TL21.Epaisseurapres
			sHSF1Ereb est une chaîne = Prod_TL21.HSF1Ereb
			sHSFDerb est une chaîne = Prod_TL21.HSFDerb
			sVconvoyeur est une chaîne = Prod_TL21.Vconvoyeur
			hHeureVC est une Heure = Prod_TL21.HeureVC
			bCT est un booléen = Prod_TL21.CT
			sDetailCT est une chaîne = Prod_TL21.DetailCT
			sDoc est une chaîne = Prod_TL21.Doc
			sFLAG est une chaîne = Prod_TL21.FLAG
			
			// Initialiser un nouvel enregistrement
			HRAZ(Prod_TL21)
			
			// Copier les valeurs sauvegardées
			Prod_TL21.Client = sClient
			Prod_TL21.Affaire = nAffaire
			Prod_TL21.Commande = sCommande
			Prod_TL21.PIECE = sPIECE
			Prod_TL21.DESA = sDESA
			Prod_TL21.QTEREST = nQTEREST
			Prod_TL21.Couleur = sCouleur
			Prod_TL21.R = sR
			Prod_TL21.Balancelle = sBalancelle
			Prod_TL21.Reprise = sReprise
			Prod_TL21.Observations = sObservations
			Prod_TL21.Epaisseuravant = rEpaisseuravant
			Prod_TL21.Epaisseurapres = rEpaisseurapres
			Prod_TL21.HSF1Ereb = sHSF1Ereb
			Prod_TL21.HSFDerb = sHSFDerb
			Prod_TL21.Vconvoyeur = sVconvoyeur
			Prod_TL21.HeureVC = hHeureVC
			Prod_TL21.CT = bCT
			Prod_TL21.DetailCT = sDetailCT
			Prod_TL21.Doc = sDoc
			Prod_TL21.FLAG = sFLAG
			
			// Régénérer les champs système
			Prod_TL21.Date = SAI_DatePrevi
			Prod_TL21.Ordre = nNouvelOrdre
			Prod_TL21.Modifie_par = gsUtilisateurActuel
			Prod_TL21.Version = DateHeureSys()
			
			// Ajouter l'enregistrement
			si HAjoute(Prod_TL21) alors
				nDernierID = Prod_TL21.IDProd_TL21
				Socket_Envoyer("add", nDernierID)
				
				// Incrémenter l'ordre pour la prochaine ligne
				nNouvelOrdre++
			sinon
				Erreur("Erreur lors de l'ajout de la ligne " + nLigneSelectionnee + " : " + HErreurInfo())
			fin
		fin
	fin
	
	// Rafraîchir et positionner sur la dernière ligne ajoutée
	TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
	TableTrie(TABLE_Prod_TL21, "+COL_Ordre")
	
	// Positionner le focus sur la dernière ligne dupliquée
	si nDernierID > 0 alors
		pour i = 1 à TableOccurrence(TABLE_Prod_TL21)
			si TABLE_Prod_TL21.COL_ID[i] = nDernierID alors
				TableSelectPlus(TABLE_Prod_TL21, i)
				DonneFocusEtRetourUtilisateur(TABLE_Prod_TL21)
				sortir
			fin
		fin
	fin
	
	gbDonnéesModifiées = Faux
	
	si nIndice = 1 alors
		ToastAffiche("✅ Ligne dupliquée avec succès", toastCourt, cvMilieu, chCentre)
	sinon
		ToastAffiche("✅ " + nIndice + " lignes dupliquées avec succès", toastCourt, cvMilieu, chCentre)
	fin
	
sinon
	// ═══════════════════════════════════════════════════════════
	// OPTION 1 : CRÉER UNE NOUVELLE LIGNE VIDE
	// ═══════════════════════════════════════════════════════════
	
	HRAZ(Prod_TL21)
	
	// Affecter les valeurs minimales pour une ligne vide
	Prod_TL21.Date = SAI_DatePrevi
	Prod_TL21.Ordre = nNouvelOrdre
	Prod_TL21.Client = ""
	Prod_TL21.Affaire = 0
	Prod_TL21.Commande = ""
	Prod_TL21.PIECE = ""
	Prod_TL21.DESA = ""
	Prod_TL21.QTEREST = 0
	Prod_TL21.Couleur = ""
	Prod_TL21.R = ""
	Prod_TL21.Balancelle = ""
	Prod_TL21.Reprise = ""
	Prod_TL21.Observations = ""
	Prod_TL21.Epaisseuravant = 0
	Prod_TL21.Epaisseurapres = 0
	Prod_TL21.HSF1Ereb = ""
	Prod_TL21.HSFDerb = ""
	Prod_TL21.Vconvoyeur = ""
	Prod_TL21.HeureVC = "00:00"
	Prod_TL21.CT = Faux
	Prod_TL21.DetailCT = ""
	Prod_TL21.Doc = ""
	Prod_TL21.FLAG = ""
	Prod_TL21.Modifie_par = gsUtilisateurActuel
	Prod_TL21.Version = DateHeureSys()
	
	// Ajouter l'enregistrement
	si HAjoute(Prod_TL21) alors
		nIDNouvelleLigne est un entier sur 8 octets = Prod_TL21.IDProd_TL21
		
		Socket_Envoyer("add", nIDNouvelleLigne)
		
		TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
		TableTrie(TABLE_Prod_TL21, "+COL_Ordre")
		
		// Positionner le focus sur la nouvelle ligne
		pour i = 1 à TableOccurrence(TABLE_Prod_TL21)
			si TABLE_Prod_TL21.COL_ID[i] = nIDNouvelleLigne alors
				TableSelectPlus(TABLE_Prod_TL21, i)
				DonneFocusEtRetourUtilisateur(TABLE_Prod_TL21)
				sortir
			fin
		fin
		
		gbDonnéesModifiées = Faux
		ToastAffiche("✅ Nouvelle ligne créée - Vous pouvez saisir les données", toastCourt, cvMilieu, chCentre)
	sinon
		si HErreurDoublon() alors
			Erreur("Cette ligne existe déjà.")
		sinon
			Erreur("Erreur lors de l'ajout : " + HErreurInfo())
		fin
	fin
fin

// ═══════════════════════════════════════════════════════════════
// DÉSENCAPSULATION
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Faux
Initialisation de BTN_Coul1
// Version 1
// Description
// Bouton simple
Clic sur BTN_Coul1
//Clic sur BTN_Coul1
// Récupérer la ligne sélectionnée
numlign est un entier = TableSelect(TABLE_Prod_TL21)
si numlign = -1 alors
Info("Veuillez sélectionner une ligne.")
retour
fin
// ═══════════════════════════════════════════════════════════════
// CYCLE ENTRE LES 4 COULEURS (MODIFIER UNIQUEMENT LE PARAMÈTRE)
// ═══════════════════════════════════════════════════════════════
selon TABLE_Prod_TL21.COL_Param
cas "C":
// Cyan → Jaune
TABLE_Prod_TL21.COL_Param = "J"
cas "J":
// Jaune → Vert
TABLE_Prod_TL21.COL_Param = "V"
cas "V":
// Vert → Normal
TABLE_Prod_TL21.COL_Param = ""
autres cas:
// Normal → Cyan
TABLE_Prod_TL21.COL_Param = "C"
fin
// ═══════════════════════════════════════════════════════════════
// ✅
ENREGISTRER (les couleurs seront appliquées automatiquement)
// ═══════════════════════════════════════════════════════════════
EnregistrerLigneModifiee()
// ═══════════════════════════════════════════════════════════════
// METTRE À JOUR LE TABLEUR SI NÉCESSAIRE
// ═══════════════════════════════════════════════════════════════
selon TABLE_Prod_TL21.COL_Param
cas "C":
TableurStyleSélection(TBLR_Previ, tblrCouleurFond, BleuPastel)
TableurStyleSélection(TBLR_Previ, tblrCouleurTexte, Noir)
cas "J":
TableurStyleSélection(TBLR_Previ, tblrCouleurFond, JaunePastel)
TableurStyleSélection(TBLR_Previ, tblrCouleurTexte, Noir)
cas "V":
TableurStyleSélection(TBLR_Previ, tblrCouleurFond, VertPastel)
TableurStyleSélection(TBLR_Previ, tblrCouleurTexte, Noir)
fin
Clic sur BTN_Down
// Clic sur BTN_DOWN
// Récupérer la ligne sélectionnée
ligneselect est un entier = TableSelect(TABLE_Prod_TL21)
// Vérifier qu'une ligne est sélectionnée
si ligneselect = -1 alors
Info("Veuillez sélectionner une ligne à déplacer.")
retour
fin
// Vérifier qu'on n'est pas déjà en dernière position
si ligneselect = TableOccurrence(TABLE_Prod_TL21) alors
Info("Cette ligne est déjà en dernière position.")
retour
fin
// ═══════════════════════════════════════════════════════════════
// RÉCUPÉRER LA DATE ET L'ID AVANT MODIFICATIONS
// ═══════════════════════════════════════════════════════════════
nIDActuel est un entier = TABLE_Prod_TL21[ligneselect].COL_ID
// ═══════════════════════════════════════════════════════════════
// ENCAPSULATION POUR HSurveille
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Vrai
// ═══════════════════════════════════════════════════════════════
// TRANSACTION POUR GARANTIR LA COHÉRENCE
// ═══════════════════════════════════════════════════════════════
HTransactionDébut()
// Récupérer les valeurs d'ordre des deux lignes
nOrdreActuel est un entier
= TABLE_Prod_TL21[ligneselect].COL_Ordre
nOrdreSuivant est un entier = TABLE_Prod_TL21[ligneselect + 1].COL_Ordre
// Récupérer les identifiants des deux enregistrements
nIDSuivant est un entier = TABLE_Prod_TL21[ligneselect + 1].COL_ID
// ───────────────────────────────────────────────────────────────
// MODIFIER LA LIGNE SUIVANTE
// ───────────────────────────────────────────────────────────────
HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDSuivant)
si HTrouve() alors
Prod_TL21.Ordre
= nOrdreActuel
Prod_TL21.Modifie_par = gsUtilisateurActuel
si pas HModifie(Prod_TL21) alors
Erreur("Impossible de modifier l'enregistrement suivant : " + HErreurInfo())
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
sinon
Erreur("Impossible de trouver l'enregistrement suivant.")
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
// ───────────────────────────────────────────────────────────────
// MODIFIER LA LIGNE ACTUELLE
// ───────────────────────────────────────────────────────────────
HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDActuel)
si HTrouve() alors
Prod_TL21.Ordre
= nOrdreSuivant
Prod_TL21.Modifie_par = gsUtilisateurActuel
si pas HModifie(Prod_TL21) alors
Erreur("Impossible de modifier l'enregistrement actuel : " + HErreurInfo())
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
sinon
Erreur("Impossible de trouver l'enregistrement actuel.")
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
// ═══════════════════════════════════════════════════════════════
// VALIDER LA TRANSACTION
// ═══════════════════════════════════════════════════════════════
HTransactionFin()
// ═══════════════════════════════════════════════════════════════
// RENUMÉROTATION AUTOMATIQUE POUR TOUTE LA DATE
// ═══════════════════════════════════════════════════════════════
RenumeroterOrdresPourDate(dDate)
// ═══════════════════════════════════════════════════════════════
// ✅
RAFRAÎCHIR LA TABLE (AJOUTÉ)
// ═══════════════════════════════════════════════════════════════
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
TableTrie(TABLE_Prod_TL21, "+COL_Ordre")
// ═══════════════════════════════════════════════════════════════
// RESTAURER LA SÉLECTION SUR LA LIGNE DÉPLACÉE
// ═══════════════════════════════════════════════════════════════
pour i = 1 à TableOccurrence(TABLE_Prod_TL21)
si TABLE_Prod_TL21.COL_ID[i] = nIDActuel alors
TableSelectPlus(TABLE_Prod_TL21, i)
sortir
fin
fin
// ═══════════════════════════════════════════════════════════════
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Faux
Clic sur BTN_FermePDF1
// SINON
// FIN
ToastAffiche("Fermeture onglets PDF",toastCourt,cvMilieu,chCentre)
ONG_PDF.Visible = Faux
ONG_PDF2.Visible = Faux
ONG_PDF3.Visible = Faux
ONG_PDF4.Visible = Faux
// Afficher l'onglet
ONG_Recherche_et_selection = 4
Clic sur BTN_FermePDFA
// SINON
// FIN
ToastAffiche("Fermeture onglets PDF",toastCourt,cvMilieu,chCentre)
selon ONG_Recherche_et_selection
cas 6 : ONG_PDF.Visible = Faux
cas 7 : ONG_PDF2.Visible = Faux
cas 8 : ONG_PDF3.Visible = Faux
cas 9 : ONG_PDF4.Visible = Faux
autre cas
fin
// Afficher l'onglet
ONG_Recherche_et_selection = 4
Clic sur BTN_Filter_sur_la_selection
TableActiveFiltre(COL_Select,filtreDifférent,0)
TableTrie(TABLE_vol1_Seletion_Affaires,COL_Select)
BTN_Ajout..Grisé = Faux
Bouton droit relâché (WM_RBUTTONUP) de BTN_Filter_sur_la_selection
TableDésactiveFiltre(COL_Select)
BTN_Ajout..Grisé = Vrai
Initialisation de BTN_Gras
// Version 1
// Description
// Bouton simple
Clic sur BTN_Gras
//Clic sur BTN_Gras
// Vérifier l'état actuel
si TABLE_Prod_TL21.COL_Param = "G" alors
// Déjà gras → Repasser en normal
TABLE_Prod_TL21.COL_Param = ""
numlign est un entier = TableSelect(TABLE_Prod_TL21)
TABLE_Prod_TL21[numlign].CouleurFond
= Transparent
TABLE_Prod_TL21[numlign].Couleur
= CouleurDéfaut
TABLE_Prod_TL21[numlign].PoliceGras
= Faux
sinon
// Pas gras → Passer en gras
TABLE_Prod_TL21.COL_Param = "G"
numlign est un entier = TableSelect(TABLE_Prod_TL21)
TABLE_Prod_TL21[numlign].CouleurFond
= Transparent
TABLE_Prod_TL21[numlign].Couleur
= CouleurDéfaut
TABLE_Prod_TL21[numlign].PoliceGras
= Vrai
fin
// ✅
Enregistrer la modification (l'encapsulation est gérée dans la procédure)
EnregistrerLigneModifiee()
// Mettre à jour le tableur si nécessaire
TableurStyleSélection(TBLR_Previ, tblrGras, Vrai)
Clic sur BTN_Init
si OuiNon(0,"Etes-vous certain de vouloir réinitialiser le fichier ?") = Vrai alors
TableurSupprimeTout(TBLR_Previ)
xlsOuvre(unfichier,xlsEcriture)
si ErreurDétectée = Vrai alors Erreur("Impossible d'ouvrir le fichier",
"Merci de vérifier si il n'est pas déjà ouvert","sur un autre poste")
TableurCharge(TBLR_Previ,unfichier)
TBLR_Previ.Zoom = 40
fin
Clic sur BTN_Libérer
// Clic sur BTN_Débloquer
si OuiNon(0, "⚠Déblocage forcé" + RC + RC + ...
"Cette action va libérer TOUS les verrous sur la base de données." + RC + RC + ...
"Êtes-vous sûr de vouloir continuer ?") = Oui alors
// Libérer tous les verrous de tous les utilisateurs
HDébloqueTable(Prod_TL21)
HDébloqueTable(Incidents)
Info("✅
Tous les verrous ont été libérés !"
+ RC + RC + ...
"Les utilisateurs peuvent maintenant modifier les données.")
fin
Clic sur BTN_MàJ
dDate est une Date=SAI_DatePrevi
RenumeroterOrdresPourDate(dDate)
ToastAffiche("Lignes renumérotées",toastCourt,cvMilieu,chCentre,VertClair)
Initialisation de BTN_Noir
// Version 1
// Description
// Bouton simple
Clic sur BTN_Noir
// Récupérer la ligne sélectionnée
numlign est un entier = TableSelect(TABLE_Prod_TL21)
si numlign = -1 alors
Info("Veuillez sélectionner une ligne.")
retour
fin
// ═══════════════════════════════════════════════════════════════
// MODIFIER LA VALEUR ET LE STYLE
// ═══════════════════════════════════════════════════════════════
si TABLE_Prod_TL21.COL_Param = "B" alors
// Déjà noir → Repasser en normal
TABLE_Prod_TL21.COL_Param
= ""
TABLE_Prod_TL21[numlign].CouleurFond
= Transparent
TABLE_Prod_TL21[numlign].Couleur
= CouleurDéfaut
TABLE_Prod_TL21[numlign].PoliceGras
= Faux
sinon
// Pas noir → Passer en noir
TABLE_Prod_TL21.COL_Param
= "B"
TABLE_Prod_TL21[numlign].CouleurFond
= Transparent
TABLE_Prod_TL21[numlign].Couleur
= Noir
TABLE_Prod_TL21[numlign].PoliceGras
= Faux
fin
// ═══════════════════════════════════════════════════════════════
// ✅
ENREGISTRER (l'encapsulation est gérée dans la procédure)
// ═══════════════════════════════════════════════════════════════
EnregistrerLigneModifiee()
// ═══════════════════════════════════════════════════════════════
// METTRE À JOUR LE TABLEUR SI NÉCESSAIRE
// ═══════════════════════════════════════════════════════════════
TableurStyleSélection(TBLR_Previ, tblrCouleurTexte, Noir)
Clic sur BTN_Ouvre
TableurFerme(TBLR_Previ)
TableurCharge(TBLR_Previ,unfichier)
TBLR_Previ.SelectFeuille("Previ")
TBLR_Previ.Zoom = 40
TableurAjouteDonnée(TBLR_Previ,1,1,DateVersChaîne(SAI_DatePrevi,"Jjjj JJ Mmmm AAAA"))
pour p = 1 à TableOccurrence(TABLE_Prod_TL21)
TableurAjouteDonnée(TBLR_Previ,1,p+2,TABLE_Prod_TL21.COL_Client[p])
TableurAjouteDonnée(TBLR_Previ,2,p+2,TABLE_Prod_TL21.COL_Affaire[p])
TableurAjouteDonnée(TBLR_Previ,3,p+2,TABLE_Prod_TL21.COL_Commande[p])
TableurAjouteDonnée(TBLR_Previ,4,p+2,TABLE_Prod_TL21.COL_PIECE[p])
TableurAjouteDonnée(TBLR_Previ,5,p+2,TABLE_Prod_TL21.COL_DESA[p])
TableurAjouteDonnée(TBLR_Previ,6,p+2,TABLE_Prod_TL21.COL_QTEREST[p])
TableurAjouteDonnée(TBLR_Previ,7,p+2,TABLE_Prod_TL21.COL_Couleur[p])
TableurAjouteDonnée(TBLR_Previ,8,p+2,TABLE_Prod_TL21.COL_R[p])
si TABLE_Prod_TL21.COL_Balancelle = 0 alors
TableurAjouteDonnée(TBLR_Previ,9,p+2,"")
sinon
TableurAjouteDonnée(TBLR_Previ,9,p+2,TABLE_Prod_TL21.COL_Balancelle[p])
fin
TableurAjouteDonnée(TBLR_Previ,11,p+2,TABLE_Prod_TL21.COL_Observations[p])
si TABLE_Prod_TL21.COL_Epaisseuravant <> 0 alors TableurAjouteDonnée(TBLR_Previ,12,p+2,TABLE_
Prod_TL21.COL_Epaisseuravant[p])
si TABLE_Prod_TL21.COL_Epaisseurapres <> 0 alors TableurAjouteDonnée(TBLR_Previ,13,p+2,TABLE_
Prod_TL21.COL_Epaisseurapres[p])
TableurAjouteDonnée(TBLR_Previ,14,p+2,TABLE_Prod_TL21.COL_HSF1Ereb[p])
TableurAjouteDonnée(TBLR_Previ,15,p+2,TABLE_Prod_TL21.COL_HSFDerb[p])
TableurAjouteDonnée(TBLR_Previ,16,p+2,TABLE_Prod_TL21.COL_Vconvoyeur[p])
TableurAjouteDonnée(TBLR_Previ,17,p+2,TABLE_Prod_TL21.COL_HeureVC[p])
si TABLE_Prod_TL21.COL_CT[p] = 1 alors TableurAjouteDonnée(TBLR_Previ,18,p+2,"OUI")
TableurAjouteDonnée(TBLR_Previ,19,p+2,TABLE_Prod_TL21.COL_DetailCT[p])
fin
// Gestion dossier exercice
Dossierannee est une chaîne
si MoisEnCours() > 6 alors
Dossierannee = AnnéeEnCours() + "-" + (AnnéeEnCours()+1)
sinon
Dossierannee = (AnnéeEnCours()-1) + "-" + AnnéeEnCours()
fin
//sFichierdest
= "T:\PRODUCTION\PROD_PLANNING\"+Dossierannee
+"\" + DateVersChaîne(SAI_DatePrevi,"MMMM AAAA") + "\Prod du " + DateVersChaîne(SAI_DatePrevi,"Jjjj JJ
Mmmm AAAA") + "_APP.xlsx"
// ═══════════════════════════════════════════════════════════════
// CONSTRUIRE LE CHEMIN DU DOSSIER
// ═══════════════════════════════════════════════════════════════
sCheminDossier est une chaîne = gsChemin_groupe+"PRODUCTION\PROD_PLANNING\" + Dossierannee
+ "\" + DateVersChaîne(SAI_DatePrevi, "MMMM AAAA")
// ═══════════════════════════════════════════════════════════════
// ✅
EXTRAIRE LES 2 PREMIÈRES LETTRES DE L'UTILISATEUR (EN MAJUSCULES)
// ═══════════════════════════════════════════════════════════════
sInitialesUtilisateur est une chaîne
= Majuscule(Gauche(sEnvironnement, 2))
// ═══════════════════════════════════════════════════════════════
// ✅
GÉNÉRER UN NOM DE FICHIER UNIQUE AVEC INITIALES + HORODATAGE
// ═══════════════════════════════════════════════════════════════
sNomFichierBase est une chaîne = "Prod du " + DateVersChaîne(SAI_DatePrevi, "Jjjj JJ Mmmm
AAAA")
sHorodatage est une chaîne = DateVersChaîne(DateSys(), "AAAAMMJJ") + "_" +
HeureVersChaîne(HeureSys(), "HHMMSS")
sFichierdestlocale est une chaîne = sCheminDossier + "\" + sNomFichierBase + "_APP_" +
sInitialesUtilisateur + "_" + sHorodatage + ".xlsx"
// ═══════════════════════════════════════════════════════════════
// SAUVEGARDER LE NOUVEAU FICHIER
// ═══════════════════════════════════════════════════════════════
TableurSauve(TBLR_Previ, sFichierdestlocale, tblrEcrasementAutorisé)
// Vérifier que la sauvegarde a réussi
si ErreurDétectée = Vrai alors
Erreur("❌
Erreur lors de la sauvegarde du fichier
"Chemin : " + sFichierdestlocale + RC + RC + ...
"Erreur : " + ErreurInfo())
retour
fin
Excel" + RC + RC + ...
// Attendre que la sauvegarde soit complètement terminée
Multitâche(100)
// ═══════════════════════════════════════════════════════════════
// ✅
NETTOYER LES ANCIENS FICHIERS (CONSERVER LES 5 PLUS RÉCENTS)
// ═══════════════════════════════════════════════════════════════
ConserverFichiersRecents(sCheminDossier, sNomFichierBase + "_APP_"+ sInitialesUtilisateur+"_*.xlsx", 1)
// ═══════════════════════════════════════════════════════════════
// OUVRIR LE FICHIER DANS EXCEL
// ═══════════════════════════════════════════════════════════════
ToastAffiche("📊Ouverture du fichier Excel...", toastCourt, cvMilieu, chCentre)
LanceAppliAssociée(sFichierdestlocale)
// Vérifier que l'ouverture a réussi
si ErreurDétectée = Vrai alors
Erreur("❌
Impossible d'ouvrir le fichier dans
Excel" + RC + RC + ...
"Chemin : " + sFichierdestlocale + RC + RC + ...
"Vérifiez que Microsoft Excel est installé sur votre ordinateur.")
fin
Clic sur BTN_PrintPDF
selon ONG_Recherche_et_selection
cas ONG_PDF : iImprimePDF(PDF_Lecteur)
cas ONG_PDF2 : iImprimePDF(PDF_Lecteur2)
cas ONG_PDF3 : iImprimePDF(PDF_Lecteur3)
cas ONG_PDF4 : iImprimePDF(PDF_Lecteur4)
autre cas
fin
Initialisation de BTN_Rechercher
// Version 1
// Description
// Bouton en validation
Clic sur BTN_Rechercher
ONG_Recherche_et_selection=1
TableDésactiveFiltre(COL_Select)
Chargement_affaires()
BTN_Ajout..Grisé = Vrai
nCompteselect = 0
LIB_NBAFF = "Affaires : "+TableOccurrence(TABLE_vol1_Seletion_Affaires)
pour k = 1 à TableOccurrence(TABLE_vol1_Seletion_Affaires)
TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k].Couleur = Noir
pour tout RAL
si Contient(TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k],NumériqueVersChaîne(RAL.RAL)) alors
TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k].CouleurFond = HTMLVersRVB(RAL.HEX)
si RAL.RAL > 4999 et RAL.RAL < 9000 alors TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k].
Couleur = Blanc
selon RAL.RAL
cas 9004 : TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k].Couleur = Blanc
cas 9005 : TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k].Couleur = Blanc
cas 9007 : TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k].Couleur = Blanc
cas 9011 : TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k].Couleur = Blanc
cas 9017 : TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k].Couleur = Blanc
fin
si RAL.RAL > 4999 et RAL.RAL < 9000 alors TABLE_vol1_Seletion_Affaires.COL_DOSSIER[k].
Couleur = Blanc
fin
fin
fin
Initialisation de BTN_RestBack
// Version 1
// Description
// Bouton simple
Clic sur BTN_RestBack
si OuiNon(0,"Etes-vous certain de vouloir restaurer le dernier backup ?") alors
TableurSupprimeTout(TBLR_Prod)
fin
Initialisation de BTN_Rouge
// Version 1
// Description
// Bouton simple
Clic sur BTN_Rouge
// Récupérer la ligne sélectionnée
numlign est un entier = TableSelect(TABLE_Prod_TL21)
si numlign = -1 alors
Info("Veuillez sélectionner une ligne.")
retour
fin
// ═══════════════════════════════════════════════════════════════
// MODIFIER LA VALEUR ET LE STYLE
// ═══════════════════════════════════════════════════════════════
si TABLE_Prod_TL21.COL_Param = "R" alors
// Déjà rouge → Repasser en normal
TABLE_Prod_TL21.COL_Param
= ""
TABLE_Prod_TL21[numlign].CouleurFond
= Transparent
TABLE_Prod_TL21[numlign].Couleur
= CouleurDéfaut
TABLE_Prod_TL21[numlign].PoliceGras
= Faux
sinon
// Pas rouge → Passer en rouge
TABLE_Prod_TL21.COL_Param
= "R"
TABLE_Prod_TL21[numlign].CouleurFond
= Transparent
TABLE_Prod_TL21[numlign].Couleur
= RougeClair
TABLE_Prod_TL21[numlign].PoliceGras
= Faux
fin
// ═══════════════════════════════════════════════════════════════
// ✅
ENREGISTRER (l'encapsulation est gérée dans la procédure)
// ═══════════════════════════════════════════════════════════════
EnregistrerLigneModifiee()
// ═══════════════════════════════════════════════════════════════
// METTRE À JOUR LE TABLEUR SI NÉCESSAIRE
// ═══════════════════════════════════════════════════════════════
TableurStyleSélection(TBLR_Previ, tblrCouleurTexte, RougeClair)
Clic sur BTN_SupLigne
// ═══════════════════════════════════════════════════════════════
// BOUTON BTN_SupLigne - AVEC SUPPRESSION MULTIPLE ET GESTION DU FOCUS
// ═══════════════════════════════════════════════════════════════

// ═══════════════════════════════════════════════════════════════
// 1. VÉRIFIER QU'AU MOINS UNE LIGNE EST SÉLECTIONNÉE
// ═══════════════════════════════════════════════════════════════
nNbLignesSelectionnees est un entier = TableSelectOccurrence(TABLE_Prod_TL21)

si nNbLignesSelectionnees = 0 alors
	Erreur("Veuillez sélectionner au moins une ligne à supprimer.")
	retour
fin

// ═══════════════════════════════════════════════════════════════
// 2. MÉMORISER LA POSITION DE LA PREMIÈRE LIGNE SÉLECTIONNÉE
// ═══════════════════════════════════════════════════════════════
nPremiereLigneSelectionnee est un entier = TableSelect(TABLE_Prod_TL21, 1)

// ═══════════════════════════════════════════════════════════════
// 3. DEMANDER CONFIRMATION
// ═══════════════════════════════════════════════════════════════
sMessage est une chaîne

si nNbLignesSelectionnees = 1 alors
	sMessage = "Voulez-vous vraiment supprimer la ligne sélectionnée ?"
sinon
	sMessage = "Voulez-vous vraiment supprimer les " + nNbLignesSelectionnees + " lignes sélectionnées ?"
fin

si OuiNon(Non, sMessage) = Non alors
	retour
fin

// ═══════════════════════════════════════════════════════════════
// 4. ENCAPSULATION POUR HSurveille
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Vrai

// ═══════════════════════════════════════════════════════════════
// 5. RÉCUPÉRER LES ID DES LIGNES À SUPPRIMER
// ═══════════════════════════════════════════════════════════════
tabIDsASupprimer est un tableau d'entiers sur 8 octets

pour i = 1 à nNbLignesSelectionnees
	nLigneSelectionnee est un entier = TableSelect(TABLE_Prod_TL21, i)
	nID est un entier sur 8 octets = TABLE_Prod_TL21.COL_ID[nLigneSelectionnee]
	TableauAjoute(tabIDsASupprimer, nID)
fin

// ═══════════════════════════════════════════════════════════════
// 6. SUPPRIMER CHAQUE LIGNE
// ═══════════════════════════════════════════════════════════════
nNbSuppressions est un entier = 0
nNbErreurs est un entier = 0

pour tout nID de tabIDsASupprimer
	// Lire l'enregistrement
	si HLitRecherchePremier(Prod_TL21, IDProd_TL21, nID) alors
		// Supprimer l'enregistrement
		si HSupprime(Prod_TL21) alors
			nNbSuppressions++
			
			// Notifier les autres utilisateurs
			Socket_Envoyer("delete", nID)
		sinon
			nNbErreurs++
			Erreur("Erreur lors de la suppression de la ligne ID " + nID + " : " + HErreurInfo())
		fin
	sinon
		nNbErreurs++
		Erreur("Impossible de lire la ligne ID " + nID)
	fin
fin

// ═══════════════════════════════════════════════════════════════
// 7. RAFRAÎCHIR LA TABLE
// ═══════════════════════════════════════════════════════════════
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
TableTrie(TABLE_Prod_TL21, "+COL_Ordre")

// ═══════════════════════════════════════════════════════════════
// 8. REPOSITIONNER LE FOCUS SUR LA LIGNE SUIVANTE
// ═══════════════════════════════════════════════════════════════
nNbLignesRestantes est un entier = TableOccurrence(TABLE_Prod_TL21)

si nNbLignesRestantes > 0 alors
	// Calculer la nouvelle position du focus
	nNouvelleLigne est un entier = nPremiereLigneSelectionnee
	
	// Si la ligne supprimée était la dernière (ou au-delà), sélectionner la nouvelle dernière
	si nNouvelleLigne > nNbLignesRestantes alors
		nNouvelleLigne = nNbLignesRestantes
	fin
	
	// Sélectionner la ligne
	TableSelectPlus(TABLE_Prod_TL21, nNouvelleLigne)
	DonneFocusEtRetourUtilisateur(TABLE_Prod_TL21)
fin

// ═══════════════════════════════════════════════════════════════
// 9. NOTIFICATION DE SUCCÈS
// ═══════════════════════════════════════════════════════════════
si nNbSuppressions > 0 alors
	si nNbSuppressions = 1 alors
		ToastAffiche("✅ Ligne supprimée avec succès", toastCourt, cvMilieu, chCentre)
	sinon
		ToastAffiche("✅ " + nNbSuppressions + " lignes supprimées avec succès", toastCourt, cvMilieu, chCentre)
	fin
fin

si nNbErreurs > 0 alors
	Erreur(nNbErreurs + " erreur(s) lors de la suppression.")
fin

// ═══════════════════════════════════════════════════════════════
// 10. DÉSENCAPSULATION
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Faux
Clic sur BTN_Up
// Clic sur BTN_UP
// Récupérer la ligne sélectionnée
ligneselect est un entier = TableSelect(TABLE_Prod_TL21)
// Vérifier qu'une ligne est sélectionnée
si ligneselect = -1 alors
Info("Veuillez sélectionner une ligne à déplacer.")
retour
fin
// Vérifier qu'on n'est pas déjà en première position
si ligneselect = 1 alors
Info("Cette ligne est déjà en première position.")
retour
fin
// ═══════════════════════════════════════════════════════════════
// RÉCUPÉRER LA DATE ET L'ID AVANT MODIFICATIONS
// ═══════════════════════════════════════════════════════════════
nIDActuel est un entier = TABLE_Prod_TL21[ligneselect].COL_ID
// ═══════════════════════════════════════════════════════════════
// ENCAPSULATION POUR HSurveille
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Vrai
// ═══════════════════════════════════════════════════════════════
// TRANSACTION POUR GARANTIR LA COHÉRENCE
// ═══════════════════════════════════════════════════════════════
HTransactionDébut()
// Récupérer les valeurs d'ordre des deux lignes
nOrdreActuel est un entier
= TABLE_Prod_TL21[ligneselect].COL_Ordre
nOrdrePrecedent est un entier
= TABLE_Prod_TL21[ligneselect - 1].COL_Ordre
// Récupérer les identifiants des deux enregistrements
nIDPrecedent est un entier
= TABLE_Prod_TL21[ligneselect - 1].COL_ID
// ───────────────────────────────────────────────────────────────
// MODIFIER LA LIGNE PRÉCÉDENTE
// ───────────────────────────────────────────────────────────────
HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDPrecedent)
si HTrouve() alors
Prod_TL21.Ordre
= nOrdreActuel
Prod_TL21.Modifie_par = gsUtilisateurActuel
si pas HModifie(Prod_TL21) alors
Erreur("Impossible de modifier l'enregistrement précédent : " + HErreurInfo())
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
sinon
Erreur("Impossible de trouver l'enregistrement précédent.")
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
// ───────────────────────────────────────────────────────────────
// MODIFIER LA LIGNE ACTUELLE
// ───────────────────────────────────────────────────────────────
HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDActuel)
si HTrouve() alors
Prod_TL21.Ordre
= nOrdrePrecedent
Prod_TL21.Modifie_par = gsUtilisateurActuel
si pas HModifie(Prod_TL21) alors
Erreur("Impossible de modifier l'enregistrement actuel : " + HErreurInfo())
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
sinon
Erreur("Impossible de trouver l'enregistrement actuel.")
HTransactionAnnule()
gbModificationParMoiMeme = Faux
retour
fin
// ═══════════════════════════════════════════════════════════════
// VALIDER LA TRANSACTION
// ═══════════════════════════════════════════════════════════════
HTransactionFin()
// ═══════════════════════════════════════════════════════════════
// RENUMÉROTATION AUTOMATIQUE POUR TOUTE LA DATE
// ═══════════════════════════════════════════════════════════════
RenumeroterOrdresPourDate(dDate)
// ═══════════════════════════════════════════════════════════════
// ✅
RAFRAÎCHIR LA TABLE (AJOUTÉ)
// ═══════════════════════════════════════════════════════════════
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
TableTrie(TABLE_Prod_TL21, "+COL_Ordre")
// ═══════════════════════════════════════════════════════════════
// RESTAURER LA SÉLECTION SUR LA LIGNE DÉPLACÉE
// ═══════════════════════════════════════════════════════════════
pour i = 1 à TableOccurrence(TABLE_Prod_TL21)
si TABLE_Prod_TL21.COL_ID[i] = nIDActuel alors
TableSelectPlus(TABLE_Prod_TL21, i)
sortir
fin
fin
// ═══════════════════════════════════════════════════════════════
// ═══════════════════════════════════════════════════════════════
gbModificationParMoiMeme = Faux
Clic sur BTN_Zoom
selon ONG_Recherche_et_selection
cas ONG_PDF : PDF_Lecteur.Zoom = PDF_Lecteur.Zoom +10
cas ONG_PDF2 : PDF_Lecteur2.Zoom = PDF_Lecteur2.Zoom +10
cas ONG_PDF3 : PDF_Lecteur3.Zoom = PDF_Lecteur3.Zoom +10
cas ONG_PDF4 : PDF_Lecteur4.Zoom = PDF_Lecteur4.Zoom +10
autre cas
fin
Clic sur BTN_Zoom1
selon ONG_Recherche_et_selection
cas ONG_PDF : PDF_Lecteur.Zoom = PDF_Lecteur.Zoom -10
cas ONG_PDF2 : PDF_Lecteur2.Zoom = PDF_Lecteur2.Zoom -10
cas ONG_PDF3 : PDF_Lecteur3.Zoom = PDF_Lecteur3.Zoom -10
cas ONG_PDF4 : PDF_Lecteur4.Zoom = PDF_Lecteur4.Zoom -10
autre cas
fin
Initialisation de LIB_Date
MoiMême = DateVersChaîne(DateSys,"Jjjj JJ Mmmm AAAA")
Initialisation de ONG_Recherche_et_selection
Clic sur BTN_Export_CT_Plaques
unfichierct est une chaîne = fRepExe + "\Qualite_socket.xlsx"
sFichierct est une chaîne = gsChemin_groupe+"PRODUCTION\PROD_PLANNING\2025-2026\" + DateVersChaîne(
DateSys(),"MMMM AAAA") + "\CT Qualite du " + DateVersChaîne(DateSys,"Jjjj JJ Mmmm AAAA") + "_APP.xlsx"
si TableurCharge(TBLR_Prod,unfichierct) = Vrai alors ToastAffiche("Chargement fichier Excel",toastCourt
,cvMilieu,chCentre)
TBLR_Prod.SelectFeuille("plaque quotidienne ")
TBLR_Prod.Zoom = 60
TableurAjouteDonnée(TBLR_Prod,2,2,SAI_Initiales)
TableurAjouteDonnée(TBLR_Prod,2,4,"RAL testé = "+SAI_RAL1)
TableurAjouteDonnée(TBLR_Prod,3,4,"RAL testé = "+SAI_RAL2)
TableurAjouteDonnée(TBLR_Prod,2,5,"Brillance du RAL = "+SAI_Brillance)
TableurAjouteDonnée(TBLR_Prod,3,5,"Brillance du RAL = "+SAI_Brillance2)
TableurAjouteDonnée(TBLR_Prod,2,6,"Valeur obtenue = "+SAI_Valeur1)
TableurAjouteDonnée(TBLR_Prod,3,6,"Valeur obtenue = "+SAI_Valeur2)
si INT_OK1 = 0 alors TableurAjouteDonnée(TBLR_Prod,2,7,"NOK") sinon TableurAjouteDonnée(TBLR_Prod,2,7,
"OK")
si INT_OK2 = 0 alors TableurAjouteDonnée(TBLR_Prod,3,7,"NOK") sinon TableurAjouteDonnée(TBLR_Prod,3,7,
"OK")
si INT_Quadrillage = 0 alors TableurAjouteDonnée(TBLR_Prod,2,8,"NOK") sinon TableurAjouteDonnée(TBLR_
Prod,2,8,"OK")
si INT_Quadrillage2 = 0 alors TableurAjouteDonnée(TBLR_Prod,3,8,"NOK") sinon TableurAjouteDonnée(TBLR_
Prod,3,8,"OK")
TableurAjouteDonnée(TBLR_Prod,2,9,SAI_Observations1)
TableurAjouteDonnée(TBLR_Prod,3,9,SAI_Observations2)
TableurSauve(TBLR_Prod,sFichierct,tblrEcrasementAutorisé)
ToastAffiche("Ouverture fichier Excel",toastCourt,cvMilieu,chCentre)
LanceAppliAssociée(sFichierct)
si ErreurDétectée = Vrai alors
Erreur("Impossible d'ouvrir le fichier dans Excel : " + RC + sFichierct)
fin
Clic sur BTN_Export_CT_Plaques1
unfichierct est une chaîne = fRepExe + "\Qualite_socket.xlsx"
sFichierct est une chaîne = gsChemin_groupe+"PRODUCTION\PROD_PLANNING\2024-2026\" + DateVersChaîne(
DateSys(),"MMMM AAAA") + "\CT Qualite du " + DateVersChaîne(DateSys,"Jjjj JJ Mmmm AAAA") + "_APP.xlsx"
si TableurCharge(TBLR_Prod,unfichierct) = Vrai alors ToastAffiche("Chargement fichier Excel",toastCourt
,cvMilieu,chCentre)
TBLR_Prod.SelectFeuille("OSMO ")
TBLR_Prod.Zoom = 60
TableurAjouteDonnée(TBLR_Prod,2,2,SAI_Initiales1)
TableurAjouteDonnée(TBLR_Prod,1,8,SAI_Visuel)
TableurAjouteDonnée(TBLR_Prod,2,8,CELL_Pressions.SAI_AlimEauBrute)
TableurAjouteDonnée(TBLR_Prod,3,8,CELL_Pressions.SAI_Entree_adoucisseur)
TableurAjouteDonnée(TBLR_Prod,4,8,CELL_Pressions.SAI_Entree_charbon_actif)
TableurAjouteDonnée(TBLR_Prod,5,8,CELL_Pressions.SAI_Sortie_charbon_actif)
TableurAjouteDonnée(TBLR_Prod,6,8,CELL_Pressions.SAI_Alimentation_Membrane)
TableurAjouteDonnée(TBLR_Prod,7,8,CELL_Pressions.SAI_Entree_eau_Osmose)
TableurAjouteDonnée(TBLR_Prod,8,8,CELL_Durete.SAI_DurEauBrute)
TableurAjouteDonnée(TBLR_Prod,9,8,CELL_Durete.SAI_Sortie_adoucisseur)
TableurAjouteDonnée(TBLR_Prod,10,8,CELL_Temperature.SAI_AlimEauBrute)
TableurAjouteDonnée(TBLR_Prod,11,8,CELL_Conduc.SAI_Conduc_Production)
TableurSauve(TBLR_Prod,sFichierct,tblrEcrasementAutorisé)
ToastAffiche("Ouverture fichier Excel",toastCourt,cvMilieu,chCentre)
LanceAppliAssociée(sFichierct)
si ErreurDétectée = Vrai alors
Erreur("Impossible d'ouvrir le fichier dans Excel : " + RC + sFichierct)
fin
Clic sur BTN_Liste_CT_Osmo
Ouvre(FEN_Controle_Osmoseur)
Clic sur BTN_Liste_CT_Plaques
Ouvre(FEN_CT_Plaques)
Clic sur BTN_Liste_CT_TTS
Ouvre(FEN_Controle_TTS)
Clic sur BTN_Sauve_CT_plaques
// Clic sur BTN_Sauve_CT_plaques
si SAI_Initiales <> "" et (CELL_Result1.SAI_RAL1 <> "" ou CELL_Result2.SAI_RAL2 <> "") alors
// 1. Initialiser un nouvel enregistrement vide
HRAZ(CONTROLE_PLAQUE)
// 2. Remplir avec les données de l'écran
ÉcranVersFichier()
// 3. Ajouter à la base de données
HAjoute(CONTROLE_PLAQUE)
// Vérification
si ErreurDétectée alors
Erreur("Impossible d'enregistrer le contrôle.", ErreurInfo())
sinon
Info("Contrôle enregistré avec succès !")
// Réinitialiser l'écran pour la prochaine saisie
HRAZ(CONTROLE_PLAQUE)
FichierVersEcran()
fin
sinon
Info("Veuillez saisir les initiales et au moins un RAL.")
fin
Clic sur BTN_Sauve_CT_plaques1
// Clic sur BTN_Sauve_CT_plaques1
si SAI_Initiales1 <> "" et SAI_Date1 <> "" alors
// 1. Initialiser un nouvel enregistrement
HRAZ(CONTROLE_OSMOSEUR)
// 2. Remplir avec les données de l'écran
ÉcranVersFichier()
// 3. Ajouter à la base
HAjoute(CONTROLE_OSMOSEUR)
si ErreurDétectée alors
Erreur("Impossible d'enregistrer le contrôle osmoseur.", ErreurInfo())
sinon
Info("Contrôle osmoseur enregistré avec succès !")
HRAZ(CONTROLE_OSMOSEUR)
FichierVersEcran()
fin
sinon
Info("Veuillez saisir les initiales et la date.")
fin
Clic sur BTN_Sauve_CT_TTS
// Clic sur BTN_Sauve_CT_TTS
si SAI_Initiales2 <> "" et SAI_Date2 <> "" alors
// 1. Initialiser un nouvel enregistrement
HRAZ(CONTROLE_TTS)
// 2. Remplir avec les données de l'écran
ÉcranVersFichier()
// 3. Ajouter à la base
HAjoute(CONTROLE_TTS)
si ErreurDétectée alors
Erreur("Impossible d'enregistrer le contrôle TTS.", ErreurInfo())
sinon
Info("Contrôle TTS enregistré avec succès !")
HRAZ(CONTROLE_TTS)
FichierVersEcran()
fin
sinon
Info("Veuillez saisir les initiales et la date.")
fin
Clic sur BTN_Vider
SAI_Aff = ""
SAI_Piece = ""
TableSupprimeTout(TABLE_Doc)
Initialisation de SAI_Conduc_Production ( CELL_Conduc )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de SAI_DurEauBrute ( CELL_Durete )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de SAI_Sortie_adoucisseur ( CELL_Durete )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de SAI_Defauts ( CELL_Niveau_sonde2 )
// Version 1
// Description
// Champ de saisie pour un texte multiligne simple, sans mise en forme
Initialisation de SAI_Observ ( CELL_Niveau_sonde2 )
// Version 1
// Description
// Champ de saisie pour un texte multiligne simple, sans mise en forme
Initialisation de SAI_AlimEauBrute ( CELL_Pressions )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de SAI_Alimentation_Membrane ( CELL_Pressions )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de SAI_Entree_adoucisseur ( CELL_Pressions )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de SAI_Entree_charbon_actif ( CELL_Pressions )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de SAI_Entree_eau_Osmose ( CELL_Pressions )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de SAI_Sortie_charbon_actif ( CELL_Pressions )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de INT_Quadrillage ( CELL_Result1 )
// Version 1
// Description
// Interrupteur simple 2 états
Initialisation de SAI_Observations1 ( CELL_Result1 )
// Version 1
// Description
// Champ de saisie pour un texte multiligne simple, sans mise en forme
Initialisation de INT_Quadrillage2 ( CELL_Result2 )
// Version 1
// Description
// Interrupteur simple 2 états
Initialisation de SAI_Observations2 ( CELL_Result2 )
// Version 1
// Description
// Champ de saisie pour un texte multiligne simple, sans mise en forme
Initialisation de SAI_AlimEauBrute ( CELL_Temperature )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Initialisation de SAI_Visuel ( CELL_Temperature2 )
// Version 1
// Description
// Champ de saisie pour un texte simple sur une ligne
Après analyse OCR de la sélection de PDF_Lecteur

