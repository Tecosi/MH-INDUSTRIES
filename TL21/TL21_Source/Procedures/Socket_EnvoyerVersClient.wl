procédure Socket_EnvoyerVersClient(sNomClient est une chaîne, sAction est une chaîne, nIDEnreg est un
entier, sValeur est une chaîne = "")
si gbEstServeur = Faux alors
retour
fin
// Format du message
sMessage est une chaîne = sAction + "|" + nIDEnreg + "|SERVEUR|" + sValeur
// Protéger l'envoi avec le sémaphore
SémaphoreDébut(gsSemaphoreSocket, 5000)
si SocketEcrit(sNomClient, sMessage) alors
LogSocket("[SERVEUR] ✉Message envoyé à "
sinon
LogSocket("[SERVEUR] ❌
Erreur envoi vers "
fin
SémaphoreFin(gsSemaphoreSocket)
+ sNomClient + " : " + sMessage)
+ sNomClient)
// ============================================================================
// TRAITEMENT DES MESSAGES REÇUS
// ============================================================================
// Traiter un message reçu d'un client (SERVEUR)
Procédure globale Socket_Fermer

