procédure Socket_TraiterMessageClient(sNomClient est une chaîne, sMessage est une chaîne)
LogSocket("[SERVEUR] 📨
Message reçu du client "
+ sNomClient + " : " + sMessage)
// ========================================================================
// PARSER LE MESSAGE : ACTION|IDEnreg|Utilisateur|Valeur
// ========================================================================
tabParts est un tableau de chaînes = sMessage.Découpe("|")
si tabParts..Occurrence < 3 alors
LogSocket("[SERVEUR] ⚠Message mal formaté, ignoré : "
+ sMessage)
retour
fin
Partie 7 › Collection de procédures › Socket_Gestion › Code
sAction est une chaîne = tabParts[1]
nIDEnreg est un entier = Val(tabParts[2])
sUtilisateur est une chaîne
= tabParts[3]
sValeur est une chaîne = ""
si tabParts..Occurrence >= 4 alors
sValeur = tabParts[4]
fin
LogSocket("[SERVEUR] 🔍
Action="
+ sAction + ", ID=" + nIDEnreg + ", User=" + sUtilisateur)
// ========================================================================
// TRAITER L'ACTION ET DIFFUSER AUX AUTRES CLIENTS
// ========================================================================
selon sAction
// -------------------------------------------------------------------// CAS 1 : CONNEXION D'UN CLIENT
// -------------------------------------------------------------------cas "connect"
LogSocket("[SERVEUR] Client connecté : " + sUtilisateur)
// Diffuser à tous les autres clients
pour tout sAutreClient de gtabClientsConnectes
si sAutreClient <> sNomClient alors
Socket_EnvoyerVersClient(sAutreClient, "user_connected", 0, sUtilisateur)
fin
fin
// -------------------------------------------------------------------// CAS 2 : MODIFICATION D'UN ENREGISTREMENT
// -------------------------------------------------------------------cas "update"
LogSocket("[SERVEUR] Mise à jour ID=" + nIDEnreg + " par " + sUtilisateur)
// Diffuser à tous les autres clients
pour tout sAutreClient de gtabClientsConnectes
si sAutreClient <> sNomClient alors
Socket_EnvoyerVersClient(sAutreClient, "update", nIDEnreg, sUtilisateur)
fin
fin
// -------------------------------------------------------------------// ✅
CAS 3 : AJOUT D'UN ENREGISTREMENT (NOUVEAU)
// -------------------------------------------------------------------cas "add"
LogSocket("[SERVEUR] Ajout ID=" + nIDEnreg + " par " + sUtilisateur)
// Diffuser à tous les autres clients
pour tout sAutreClient de gtabClientsConnectes
si sAutreClient <> sNomClient alors
Socket_EnvoyerVersClient(sAutreClient, "add", nIDEnreg, sUtilisateur)
fin
fin
// -------------------------------------------------------------------// ✅
CAS 4 : SUPPRESSION D'UN ENREGISTREMENT (NOUVEAU)
// -------------------------------------------------------------------cas "delete"
LogSocket("[SERVEUR] Suppression ID=" + nIDEnreg + " par " + sUtilisateur)
// Diffuser à tous les autres clients
Partie 7 › Collection de procédures › Socket_Gestion › Code
pour tout sAutreClient de gtabClientsConnectes
si sAutreClient <> sNomClient alors
Socket_EnvoyerVersClient(sAutreClient, "delete", nIDEnreg, sUtilisateur)
fin
fin
// -------------------------------------------------------------------// CAS 5 : ÉDITION EN COURS
// -------------------------------------------------------------------cas "editing"
LogSocket("[SERVEUR] Édition en cours ID=" + nIDEnreg + " par " + sUtilisateur)
// Diffuser à tous les autres clients
pour tout sAutreClient de gtabClientsConnectes
si sAutreClient <> sNomClient alors
Socket_EnvoyerVersClient(sAutreClient, "editing", nIDEnreg, sUtilisateur)
fin
fin
// -------------------------------------------------------------------// CAS 6 : FIN D'ÉDITION
// -------------------------------------------------------------------cas "stop_editing"
LogSocket("[SERVEUR] Fin édition ID=" + nIDEnreg + " par " + sUtilisateur)
// Diffuser à tous les autres clients
pour tout sAutreClient de gtabClientsConnectes
si sAutreClient <> sNomClient alors
Socket_EnvoyerVersClient(sAutreClient, "stop_editing", nIDEnreg, sUtilisateur)
fin
fin
// -------------------------------------------------------------------// CAS INCONNU
// -------------------------------------------------------------------autre cas
LogSocket("[SERVEUR] ⚠
Action inconnue : "
+ sAction)
fin
LogSocket("[SERVEUR] ✅
Traitement terminé"
)
Procédure globale Socket_TraiterMessageServeur

