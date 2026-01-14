procédure Socket_ThreadServeur()
sSocketClient
sNomThread est une chaîne est une chaîne Partie 7 › Collection de procédures › Socket_Gestion › Code LogSocket("[THREAD SERVEUR] Démarrage du thread serveur") LogSocket("[THREAD SERVEUR] 🧵Thread : " + ThreadCourant()) LogSocket("[THREAD SERVEUR] 📡Socket : " + gsNomSocketServeur) boucle // ✅ VÉRIFIER SI L'ARRÊT EST DEMANDÉ si ThreadArrêtDemandé() alors LogSocket("[THREAD SERVEUR] 🛑Arrêt demandé, sortie de la boucle" ) sortir fin // Attendre une connexion (avec timeout pour vérifier ThreadArrêtDemandé régulièrement) si SocketAttendConnexion(gsNomSocketServeur, 1000) = Vrai alors
// Accepter la connexion
sSocketClient = SocketAccepte(gsNomSocketServeur)
si sSocketClient <> "" alors
LogSocket("[THREAD SERVEUR] ✅
Nouveau client connecté : "
+ sSocketClient)
// Ajouter au tableau des clients
TableauAjoute(gtabClientsConnectes, sSocketClient)
LogSocket("[THREAD SERVEUR] 📊Nombre de clients connectés : "
Occurrence)
+ gtabClientsConnectes..
// Créer un thread pour gérer ce client
sNomThread = "Thread_Client_" + sSocketClient
ThreadExécute(sNomThread, threadSécurisé, Socket_ThreadGestionClient, sSocketClient)
// Envoyer un message de bienvenue
SémaphoreDébut(gsSemaphoreSocket, 5000)
SocketEcrit(sSocketClient, "welcome|0|SERVEUR|")
SémaphoreFin(gsSemaphoreSocket)
fin
fin
fin
LogSocket("[THREAD SERVEUR] 🛑Arrêt du thread serveur" )
Procédure globale Socket_TraiterMessageClient
// ============================================================================
// PROCÉDURE : Socket_TraiterMessageClient (CORRIGÉE)
// ============================================================================
// Cette procédure est appelée par le SERVEUR quand un CLIENT envoie un message
// Elle parse le message et DIFFUSE l'action aux autres clients connectés
// ============================================================================

