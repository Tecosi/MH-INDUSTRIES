procédure Thread_LireMessagesServeur()
sMessage est une chaîne
LogSocket("[THREAD CLIENT] Démarrage de la lecture des messages serveur")
tantque gbThreadActif = Vrai
// On lit avec un timeout de 1 seconde pour ne pas bloquer indéfiniment
sMessage = SocketLit(gsNomSocketClient, 1000)
si ErreurDétectée alors
LogSocket("[THREAD CLIENT] ❌
Connexion au serveur perdue (Erreur: "
+ ")")
// On délègue la gestion de la réélection au thread principal
ExécuteThreadPrincipal(Socket_GererDeconnexionServeur)
sortir // On arrête ce thread
fin
si sMessage <> "" alors
LogSocket("[THREAD CLIENT] 📨Message du serveur : "
Socket_TraiterMessageServeur(sMessage)
fin
+ ErreurInfo(errMessage)
+ sMessage)
fin
LogSocket("[THREAD CLIENT] 🛑Arrêt du thread de réception" )
Partie 7 › Collection de procédures › Utilitaires › Code
Utilitaires
Code
Procédure globale LogSocket

