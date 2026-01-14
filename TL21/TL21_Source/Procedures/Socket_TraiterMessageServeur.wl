procédure Socket_TraiterMessageServeur(sMessage est une chaîne)
LogSocket("[CLIENT] 📨Message reçu du serveur : "
+ sMessage)
// Parser le message
tabParts est un tableau de chaînes = sMessage.Découpe("|")
si tabParts..Occurrence < 3 alors
LogSocket("[CLIENT] ⚠Message mal formaté, ignoré : "
+ sMessage)
retour
fin
sAction est une chaîne = tabParts[1]
Partie 7 › Collection de procédures › Socket_Gestion › Code
nIDEnreg est un entier = Val(tabParts[2])
sUtilisateur est une chaîne
= tabParts[3]
sValeur est une chaîne = ""
si tabParts..Occurrence >= 4 alors
sValeur = tabParts[4]
fin
// ✅
CORRECTION : Trace bien placée APRÈS le
LogSocket("[CLIENT] 🔍Action="
parsing
+ sAction + ", ID=" + nIDEnreg + ", User=" + sUtilisateur)
// sMessage est le message complet reçu du serveur, ex: "add|1234|ddexet|"
// Traiter le message en fonction de l'action
selon sAction
cas "welcome"
// Message de bienvenue du serveur
LogSocket("[CLIENT] 👋Bienvenue du serveur" )
cas "update"
// Un autre utilisateur a modifié un enregistrement
LogSocket("[CLIENT] 🔄Mise à jour ID="
+ nIDEnreg + " par " + sUtilisateur)
// Recharger cet enregistrement SAUF si on est en train de l'éditer
si gnEnregistrementEnCours <> nIDEnreg ou gbSaisieEnCours = Faux alors
ExécuteThreadPrincipal(Socket_RechargerEnregistrement, nIDEnreg)
sinon
LogSocket("[CLIENT] ⚠Édition en cours, rechargement différé" )
fin
cas "editing"
// Un autre utilisateur édite un enregistrement
LogSocket("[CLIENT] ✏"
+ sUtilisateur + " édite ID=" + nIDEnreg)
// ✅
APPELER Socket_AfficherAlerteLigne depuis le thread principal
ExécuteThreadPrincipal(Socket_AfficherAlerteLigne, nIDEnreg, sUtilisateur)
// Afficher un indicateur visuel (optionnel)
// Vous pouvez ajouter une colonne dans la table pour montrer qui édite
cas "stop_editing"
// Un autre utilisateur a arrêté d'éditer
LogSocket("[CLIENT] ✅
"
+ sUtilisateur + " a terminé l'édition de ID=" + nIDEnreg)
// ✅
MASQUER l'alerte
ExécuteThreadPrincipal(Socket_MasquerAlerteLigne, nIDEnreg)
cas "user_connected"
// Un nouvel utilisateur s'est connecté
LogSocket("[CLIENT] 👤Utilisateur connecté : " + sValeur)
ToastAffiche("👤" + sValeur + " s'est connecté", toastCourt, cvBas, chCentre)
cas "add"
// Un nouvel enregistrement a été ajouté
LogSocket("[CLIENT] ➕
Ajout enregistrement ID="
+ nIDEnreg)
// Recharger toute la table (ou ajouter la ligne)
ExécuteThreadPrincipal(Socket_RechargerTable)
Partie 7 › Collection de procédures › Socket_Gestion › Code
cas "delete"
// Un enregistrement a été supprimé
LogSocket("[CLIENT] ❌
Suppression enregistrement ID="
+ nIDEnreg)
// ✅
Appeler la suppression dans le thread principal
ExécuteThreadPrincipal(Socket_SupprimerLigneTable, nIDEnreg)
autre cas
LogSocket("[CLIENT] ⚠Action inconnue : "
+ sAction)
fin
// ✅
CORRECTION : Trace placée APRÈS le `fin` du `selon`
LogSocket("[CLIENT] ✅
Traitement terminé" )
Procédure globale Thread_LireMessagesServeur
// ============================================================================
// MODIFICATION DU THREAD CLIENT : Détection de la Perte du Serveur
// ============================================================================

