procédure Socket_SauvegarderEnregistrement(local nIDEnregistrement est un entier, local dhVersionClient est une DateHeure)

LogSocket("[SAUVE] 💾 Début sauvegarde ID=" + nIDEnregistrement)

// ✅ CORRECTION : Vérifier si la version client est valide avant de la convertir
si dhVersionClient <> "" ET Année(dhVersionClient) > 0 alors
	LogSocket("[SAUVE] 📅 Version client=" + DateHeureVersChaîne(dhVersionClient))
sinon
	LogSocket("[SAUVE] 📅 Version client=Non définie (nouvelle ligne)")
fin

// Lecture SANS blocage - le verrouillage optimiste gérera les conflits
LogSocket("[SAUVE] 📖 Appel HLitRecherche ID=" + nIDEnregistrement)

si pas HLitRecherche(Prod_TL21, IDProd_TL21, nIDEnregistrement) alors
	LogSocket("[SAUVE] ❌ HLitRecherche a échoué : " + HErreurInfo())
	ToastAffiche("L'enregistrement a été supprimé.")
	retour Faux
fin

LogSocket("[SAUVE] ✅ Enregistrement trouvé en base")

// ✅ CORRECTION : Vérifier si la version en base est valide avant de la convertir
si FEN_Principale.TABLE_Prod_TL21.COL_Version <> "" ET Année(FEN_Principale.TABLE_Prod_TL21.COL_Version) > 0 alors
	LogSocket("[SAUVE] 📅 Version en base=" + DateHeureVersChaîne(FEN_Principale.TABLE_Prod_TL21.COL_Version))
sinon
	LogSocket("[SAUVE] 📅 Version en base=Non définie")
fin

// ⭐ VÉRIFICATION DU VERROUILLAGE OPTIMISTE
// ✅ CORRECTION : Ne vérifier le conflit que si les deux versions sont valides
si dhVersionClient <> "" ET Année(dhVersionClient) > 0 ET FEN_Principale.TABLE_Prod_TL21.COL_Version <> "" ET Année(FEN_Principale.TABLE_Prod_TL21.COL_Version) > 0 alors
	si FEN_Principale.TABLE_Prod_TL21.COL_Version > dhVersionClient alors
		LogSocket("[SAUVE] ⚠️ CONFLIT DE VERSION détecté !")
		LogSocket("[SAUVE] 📅 Version client : " + DateHeureVersChaîne(dhVersionClient))
		LogSocket("[SAUVE] 📅 Version base : " + DateHeureVersChaîne(FEN_Principale.TABLE_Prod_TL21.COL_Version))
		
		// CONFLIT DÉTECTÉ ! La version en base est plus récente.
		HAnnuleDéclaration(Prod_TL21) // Libérer le verrou sans sauvegarder
		
		// Notifier l'utilisateur du conflit
		ToastAffiche("Conflit de modification ! La ligne a été modifiée par un autre utilisateur. Vos modifications n'ont pas été enregistrées.", toastLong, 5000)
		
		// Forcer le rechargement de la ligne chez le client pour qu'il voie les données à jour
		Socket_RechargerEnregistrement(nIDEnregistrement)
		
		LogSocket("[SAUVE] ❌ Sauvegarde annulée à cause du conflit")
		retour Faux // La sauvegarde a échoué
	fin
sinon
	// ✅ Si la version client est vide (nouvelle ligne), on accepte la sauvegarde
	LogSocket("[SAUVE] ℹ️ Nouvelle ligne ou version non définie, pas de vérification de conflit")
fin

LogSocket("[SAUVE] ✅ Pas de conflit, mise à jour des champs")

// PAS DE CONFLIT : On peut sauvegarder
// ⭐ Mettre à jour la version avec un nouvel horodatage
Prod_TL21.Version = DateHeureSys()

// Mettre à jour le champ Modifie_par avec le nom de l'utilisateur actuel
Prod_TL21.Modifie_par = gsUtilisateurActuel

LogSocket("[SAUVE] 💿 Appel HModifie")

// Sauvegarder les modifications
si pas HModifie(Prod_TL21) alors
	LogSocket("[SAUVE] ❌ HModifie a échoué : " + HErreurInfo())
	HAnnuleDéclaration(Prod_TL21)
	ToastAffiche("Erreur système lors de la sauvegarde de l'enregistrement.", toastCourt)
	retour Faux
fin

LogSocket("[SAUVE] ✅ HModifie réussi")

// Libérer le verrou
HAnnuleDéclaration(Prod_TL21)

LogSocket("[SAUVE] 📤 Appel Socket_Envoyer('update', " + nIDEnregistrement + ")")

// Notifier les autres clients que la mise à jour a réussi, en envoyant la NOUVELLE version
Socket_Envoyer("update", nIDEnregistrement + TAB + Prod_TL21.Version)

LogSocket("[SAUVE] ✅ Sauvegarde terminée avec succès")

retour Vrai // La sauvegarde a réussi
