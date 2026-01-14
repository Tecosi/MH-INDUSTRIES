procédure ClicLien(sUrl est chaîne, bDansNouvelleFenetre est un booléen, sDestination est une chaîne)
renvoyer Vrai
Initialisation de SAI_Au
// Version 1
// Description
// Saisie d'une date avec calendrier
Initialisation de SAI_DatePrevi
// Version 1
// Description
// Saisie d'une date avec calendrier
MoiMême=DateSys()
HLitRecherchePremier(Incidents,Date_incident,SAI_DatePrevi)
si HTrouve() alors
SAI_incident = Incidents.Info_Incident
sinon
SAI_incident = ""
fin
si TABLE_Prod_TL21="" alors
Info("Créer votre planning ou selectionnez une autre date")
fin
// Réappliquer le filtre sur la nouvelle date
TableActiveFiltre(TABLE_Prod_TL21.COL_Date, filtreEgal, SAI_DatePrevi)
// Forcer le rafraîchissement depuis la base de données
TableAffiche(TABLE_Prod_TL21, taRéExécuteRequete)
// Retrier par ordre
TableTrie(TABLE_Prod_TL21, "+COL_Ordre")
A chaque modification de SAI_DatePrevi
// --- DÉBUT DE L'ENCAPSULATION --gbModificationParMoiMeme = Vrai
// Mettre à jour la colonne "ModifiéPar" pour la ligne en cours
TABLE_Prod_TL21.COL_Modifié_par = gsUtilisateurActuel
// Votre code d'enregistrement
// Appeler la procédure centralisée
EnregistrerLigneModifiee()
// Libérer le verrou d'auto-notification
gbModificationParMoiMeme = Faux
// --- FIN DE L'ENCAPSULATION --// ========== RÉINITIALISER L'INDICATEUR DE MODIFICATION ==========
gbDonnéesModifiées = Faux
TableActiveFiltre(TABLE_Prod_TL21.COL_Date,filtreEgal,SAI_DatePrevi)
ONG_Recherche_et_selection=4
ToastAffiche(TableOccurrence(TABLE_Prod_TL21) + " lignes")
HLitRecherchePremier(Incidents,Date_incident,SAI_DatePrevi)
si HTrouve() alors
SAI_incident = Incidents.Info_Incident
sinon
SAI_incident = ""
fin
Initialisation de SAI_Du
// Version 1
// Description
// Saisie d'une date avec calendrier
MoiMême=DateDuJour()
FEN_Principale
Procédures
Procédure locale AfficheIconesDoc

