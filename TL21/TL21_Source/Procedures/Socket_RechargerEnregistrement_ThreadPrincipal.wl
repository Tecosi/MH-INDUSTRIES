procédure Socket_RechargerEnregistrement_ThreadPrincipal()
// Récupérer l'ID depuis la variable globale
nIDEnreg est un entier = gnIDEnregARecharger
LogSocket("[RECHARGE-TP] 🔄Début rechargement ID=" + nIDEnreg + " dans thread principal")
LogSocket("[RECHARGE-TP] 🧵Thread actuel : " + ThreadCourant())
// Éviter les conflits de mise à jour
si gbVerrouMajTable alors
LogSocket("[RECHARGE-TP] ⚠Verrouillage actif, rechargement annulé" )
retour
fin
gbVerrouMajTable = Vrai
// Trouver la ligne dans la table
nLigne est un entier = TableCherche(FEN_Principale.TABLE_Prod_TL21.COL_ID, nIDEnreg)
si nLigne <= 0 alors
LogSocket("[RECHARGE-TP] ❌
Ligne non trouvée dans la table"
gbVerrouMajTable = Faux
retour
fin
LogSocket("[RECHARGE-TP] 📍Ligne trouvée : "
)
+ nLigne)
// Relire depuis la base de données
HLitRecherchePremier(Prod_TL21, IDProd_TL21, nIDEnreg)
si HTrouve(Prod_TL21) = Faux alors
LogSocket("[RECHARGE-TP] ❌
Enregistrement non trouvé en base"
gbVerrouMajTable = Faux
retour
fin
)
LogSocket("[RECHARGE-TP] 💾Enregistrement lu depuis la base" )
// Mettre à jour TOUTES les 23 colonnes
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Date
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Ordre
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Client
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Affaire
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Commande
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_PIECE
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_DESA
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_QTEREST
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Couleur
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_R
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Balancelle
= Prod_TL21.Date
= Prod_TL21.Ordre
= Prod_TL21.Client
= Prod_TL21.Affaire
= Prod_TL21.Commande
= Prod_TL21.PIECE
= Prod_TL21.DESA
= Prod_TL21.QTEREST
= Prod_TL21.Couleur
= Prod_TL21.R
= Prod_TL21.Balancelle
Partie 7 › Collection de procédures › Socket_Gestion › Code
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Reprise
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Observations
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Epaisseuravant
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Epaisseurapres
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_HSF1Ereb
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_HSFDerb
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Vconvoyeur
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_HeureVC
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_CT
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_DetailCT
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Doc
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Param
FEN_Principale.TABLE_Prod_TL21[nLigne].COL_Modifié_par
= Prod_TL21.Reprise
= Prod_TL21.Observations
= Prod_TL21.Epaisseuravant
= Prod_TL21.Epaisseurapres
= Prod_TL21.HSF1Ereb
= Prod_TL21.HSFDerb
= Prod_TL21.Vconvoyeur
= Prod_TL21.HeureVC
= Prod_TL21.CT
= Prod_TL21.DetailCT
= Prod_TL21.Doc
= Prod_TL21.FLAG
= Prod_TL21.Modifie_par
LogSocket("[RECHARGE-TP] ✅
Ligne "
+ nLigne + " mise à jour avec succès")
LogSocket("[RECHARGE]
QTEREST=" + Prod_TL21.QTEREST + " | Modifié_par=" + Prod_TL21.Modifie_par)
// Mettre à jour SAI_Incidents si la date correspond
si Prod_TL21.Date = FEN_Principale.SAI_DatePrevi alors
HLitRecherchePremier(Incidents, Date_incident, FEN_Principale.SAI_DatePrevi)
si HTrouve() alors
FEN_Principale.SAI_incident = Incidents.Info_Incident
LogSocket("[RECHARGE] ✅
SAI_Incidents mis à jour" )
sinon
FEN_Principale.SAI_incident = ""
LogSocket("[RECHARGE] ℹAucun incident pour cette date" )
fin
fin
gbVerrouMajTable = Faux
LogSocket("[RECHARGE-TP] ✅
Rechargement terminé" )
// ✅
Pour une table FICHIER, on
réexécute la requête
TableAffiche(FEN_Principale.TABLE_Prod_TL21, taRéExécuteRequete)
LogSocket("[RECHARGE-TP] ✨
Table
réaffichée avec taRéExécuteRequête")
Procédure globale Socket_RechargerTable

