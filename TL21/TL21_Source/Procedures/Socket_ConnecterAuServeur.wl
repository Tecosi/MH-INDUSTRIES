procédure Socket_ConnecterAuServeur()
LogSocket("[CLIENT] 🔌Tentative de connexion au serveur..." )
LogSocket("[CLIENT] 📡Adresse : " + gsAdresseServeur + ":" + gnPortSocket)
// Attendre un peu que le serveur soit prêt
Temporisation(500)
// Tentative de connexion
si SocketConnecte(gsNomSocketClient, gnPortSocket, gsAdresseServeur) = Vrai alors
gbSocketActif = Vrai
LogSocket("[CLIENT] ✅
Connexion au serveur réussie"
LogSocket("[CLIENT] ✅
Ce poste est le CLIENT" )
)
// ✅
CORRECTION : Générer un nom de thread unique
gsNomThreadClient = "Thread_Client_" + NumériqueVersChaîne(DateHeureSys())
// Démarrer le thread de lecture des messages
ThreadExécute(gsNomThreadClient, threadSécurisé, Thread_LireMessagesServeur)
LogSocket("[CLIENT] ✅
Thread client démarré : "
+ gsNomThreadClient)
// Envoyer un message de connexion
Socket_Envoyer("connect", 0, "")
sinon
LogSocket("[CLIENT] ❌
Échec de connexion au serveur" )
LogSocket("[CLIENT] ❌
Code erreur : "
+ ErreurInfo())
gbSocketActif = Faux
// Afficher un message à l'utilisateur
ExécuteThreadPrincipal(Socket_AfficherErreurConnexion)
fin
Procédure globale Socket_DiffuserMessage

