procédure Socket_Envoyer(sAction est une chaîne, nIDEnreg est un entier, sValeur est une chaîne = "")
si gbSocketActif = Faux alors
LogSocket("[ENVOI] ⚠Socket inactif, envoi annulé" )
retour
Partie 7 › Collection de procédures › Socket_Gestion › Code
fin
LogSocket("[ENVOI] 📡Type="
+ sAction + ", ID=" + nIDEnreg + ", User=" + gsUtilisateurActuel)
// Format du message : ACTION|IDEnreg|Utilisateur|Valeur
sMessage est une chaîne = sAction + "|" + nIDEnreg + "|" + gsUtilisateurActuel + "|" + sValeur
si gbEstServeur alors
LogSocket("[ENVOI] 🖥 Mode SERVEUR : diffusion à"
+ gtabClientsConnectes..Occurrence + " clients")
// Mode serveur : envoyer à tous les clients
pour tout sClient de gtabClientsConnectes
// ✅
Protéger CHAQUE envoi
SémaphoreDébut(gsSemaphoreSocket, 5000)
si SocketEcrit(sClient, sMessage) alors
LogSocket("[ENVOI] ✅
Envoi réussi vers "
+ sClient)
sinon
LogSocket("[ENVOI] ❌
Échec envoi vers "
+ sClient + " : " + ErreurInfo())
fin
// ✅
Libérer IMMÉDIATEMENT après chaque envoi
SémaphoreFin(gsSemaphoreSocket)
fin
sinon
LogSocket("[ENVOI] 🚀Envoi message : envoi au serveur"
+ sMessage)
// Protéger l'envoi
SémaphoreDébut(gsSemaphoreSocket, 5000)
si SocketEcrit(gsNomSocketClient, sMessage) alors
LogSocket("[CLIENT] ✉Message envoyé au serveur : " + sMessage)
sinon
LogSocket("[ENVOI] ❌
Échec envoi au serveur : "
+ ErreurInfo())
fin
// Libérer le sémaphore
SémaphoreFin(gsSemaphoreSocket)
LogSocket("[ENVOI] ✅
Procédure terminée"
)
fin
Procédure globale Socket_EnvoyerDepuisTrigger

