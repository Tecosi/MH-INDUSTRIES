procédure Socket_SauvegarderEnregistrement(local nIDEnregistrement est un entier, local dhVersionClient
est une DateHeure)
LogSocket("[SAUVE] 💾Début sauvegarde ID=" + nIDEnregistrement)
LogSocket("[SAUVE]
Version client=" + DateHeureVersChaîne(dhVersionClient))
// Lecture SANS blocage - le verrouillage optimiste gérera les conflits
LogSocket("[SAUVE] 📖Appel HLitRecherche ID=" + nIDEnregistrement)
si pas HLitRecherche(Prod_TL21, IDProd_TL21, nIDEnregistrement) alors
LogSocket("[SAUVE] ❌
HLitRecherche a échoué : "
+ HErreurInfo())
ToastAffiche("L'enregistrement a été supprimé.")
retour Faux
fin
LogSocket("[SAUVE] ✅
Enregistrement trouvé en base" )
LogSocket("[SAUVE]
Version en base=" + DateHeureVersChaîne(FEN_Principale.TABLE_Prod_TL21.COL_
Version))
// ⭐VÉRIFICATION DU VERROUILLAGE OPTIMISTE
si FEN_Principale.TABLE_Prod_TL21.COL_Version > dhVersionClient alors
LogSocket("[SAUVE] ⚠CONFLIT DE VERSION détecté !" )
LogSocket("[SAUVE]
Version client : " + DateHeureVersChaîne(dhVersionClient))
LogSocket("[SAUVE]
Version base
: " + DateHeureVersChaîne(FEN_Principale.TABLE_Prod_TL21.COL_
Version))
// CONFLIT DÉTECTÉ ! La version en base est plus récente.
HAnnuleDéclaration(Prod_TL21) // Libérer le verrou sans sauvegarder
// Notifier l'utilisateur du conflit
ToastAffiche(
"Conflit de modification ! La ligne a été modifiée par un autre utilisateur. Vos modifications
n'ont pas été enregistrées."
, toastLong, 5000)
// Forcer le rechargement de la ligne chez le client pour qu'il voie les données à jour
Socket_RechargerEnregistrement(nIDEnregistrement)
LogSocket("[SAUVE] ❌
Sauvegarde annulée à cause du conflit"
retour Faux // La sauvegarde a échoué
)
fin
LogSocket("[SAUVE] ✅
Pas de conflit, mise à jour des champs"
)
// PAS DE CONFLIT : On peut sauvegarder
Partie 7 › Collection de procédures › Socket_Gestion › Code
// ⭐Mettre à jour la version avec un nouvel horodatage
Prod_TL21.Version
= DateHeureSys()
// Mettre à jour le champ Modifie_par avec le nom de l'utilisateur actuel
Prod_TL21.Modifie_par = gsUtilisateurActuel
LogSocket("[SAUVE] 💿Appel HModifie" )
// Sauvegarder les modifications
si pas HModifie(Prod_TL21) alors
LogSocket("[SAUVE] ❌
HModifie a échoué : "
+ HErreurInfo())
HAnnuleDéclaration(Prod_TL21)
ToastAffiche("Erreur système lors de la sauvegarde de l'enregistrement.", toastCourt)
retour Faux
fin
LogSocket("[SAUVE] ✅
HModifie réussi"
)
// Libérer le verrou
HAnnuleDéclaration(Prod_TL21)
LogSocket("[SAUVE] 📤Appel Socket_Envoyer( 'update', " + nIDEnregistrement + ")")
// Notifier les autres clients que la mise à jour a réussi, en envoyant la NOUVELLE version
Socket_Envoyer("update", nIDEnregistrement + TAB + Prod_TL21.Version)
LogSocket("[SAUVE] ✅
Sauvegarde terminée avec succès"
)
retour Vrai // La sauvegarde a réussi
Procédure globale Socket_SupprimerLigneTable

