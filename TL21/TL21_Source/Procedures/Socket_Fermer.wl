procédure Socket_Fermer()
LogSocket("========================================")
LogSocket("[FERMETURE] 🛑Début de la fermeture des connexions socket" )
LogSocket("========================================")
si gbSocketActif = Faux alors
LogSocket("[FERMETURE] ⚠Aucune connexion socket active" )
Socket_MettreAJourStatutUI()
retour
fin
// ============================================================================
// ÉTAPE 1 : DEMANDER L'ARRÊT DES THREADS
// ============================================================================
gbThreadActif = Faux
LogSocket("[FERMETURE] 🛑Signal d'arrêt envoyé aux threads" )
si gbEstServeur = Vrai alors
// MODE SERVEUR
LogSocket("[FERMETURE] 🖥 Mode SERVEUR
" )
// Demander l'arrêt du thread serveur principal
LogSocket("[FERMETURE] 🛑Demande d'arrêt du thread serveur..." )
ThreadDemandeArrêt("Thread_Serveur")
// Demander l'arrêt de tous les threads clients
pour tout sSocketClient de gtabClientsConnectes
sNomThread est une chaîne = "Thread_Client_" + sSocketClient
LogSocket("[FERMETURE] 🛑Demande d'arrêt du thread : " + sNomThread)
ThreadDemandeArrêt(sNomThread)
fin
// Attendre que les threads se terminent
LogSocket("[FERMETURE] ⏳
Attente de l'arrêt des threads..."
)
Partie 7 › Collection de procédures › Socket_Gestion › Code
ThreadAttend("Thread_Serveur", 500)
sinon
// MODE CLIENT
LogSocket("[FERMETURE] 💻Mode CLIENT" )
// Envoyer un message de déconnexion au serveur
LogSocket("[FERMETURE] 📤Envoi du message de déconnexion au serveur" )
Socket_Envoyer("disconnect", 0, "")
Temporisation(100)
// Demander l'arrêt du thread client
LogSocket("[FERMETURE] 🛑Demande d'arrêt du thread client..." )
ThreadDemandeArrêt(gsNomThreadClient)
// Attendre que le thread se termine
LogSocket("[FERMETURE] ⏳
Attente de l'arrêt du thread..." )
si ThreadAttend(gsNomThreadClient, 500) = Faux alors
LogSocket("[FERMETURE] ⚠Le thread client n'a pas répondu dans les 0.5 secondes" )
// On continue quand même pour éviter de bloquer l'application
sinon
LogSocket("[FERMETURE] ✅
Thread client arrêté" )
fin
fin
// ============================================================================
// ÉTAPE 2 : FERMER LES SOCKETS
// ============================================================================
si gbEstServeur = Vrai alors
// MODE SERVEUR : Fermer tous les sockets clients puis le serveur
LogSocket("[FERMETURE] 🔌Fermeture des sockets clients..." )
pour tout sSocketClient de gtabClientsConnectes
LogSocket("[FERMETURE]
- Fermeture de : " + sSocketClient)
SémaphoreDébut(gsSemaphoreSocket, 5000)
si SocketExiste(sSocketClient) alors
SocketFerme(sSocketClient)
LogSocket("[FERMETURE]
✅
Socket fermée : "
+ sSocketClient)
sinon
LogSocket("[FERMETURE]
ℹSocket déjà fermée : " + sSocketClient)
fin
SémaphoreFin(gsSemaphoreSocket)
fin
// Vider le tableau des clients
TableauSupprimeTout(gtabClientsConnectes)
// Fermer le socket serveur
LogSocket("[FERMETURE] 🔌Fermeture du socket serveur : "
+ gsNomSocketServeur)
SémaphoreDébut(gsSemaphoreSocket, 5000)
si SocketExiste(gsNomSocketServeur) alors
SocketFerme(gsNomSocketServeur)
LogSocket("[FERMETURE] ✅
Socket serveur fermé" )
sinon
LogSocket("[FERMETURE] ℹSocket serveur déjà fermé" )
fin
SémaphoreFin(gsSemaphoreSocket)
// ============================================================================
// ÉTAPE 3 : LIBÉRER LE FICHIER DE VERROUILLAGE
// ============================================================================
si gnHandleVerrou > 0 alors
LogSocket("[FERMETURE] 🔓Libération du fichier de verrouillage..." )
Partie 7 › Collection de procédures › Socket_Gestion › Code
fFerme(gnHandleVerrou)
gnHandleVerrou = 0
// Supprimer le fichier de verrouillage
sCheminVerrou est une chaîne = "C:\Users\Public\Documents\Sources_SpeMH\TL21_SERVEUR.lock"
si fSupprime(sCheminVerrou) alors
LogSocket("[FERMETURE] ✅
Fichier de verrouillage supprimé" )
sinon
LogSocket("[FERMETURE] ⚠Impossible de supprimer le fichier de verrouillage" )
fin
fin
sinon
// MODE CLIENT : Fermer le socket client
LogSocket("[FERMETURE] 🔌Fermeture du socket client : "
+ gsNomSocketClient)
SémaphoreDébut(gsSemaphoreSocket, 5000)
si SocketExiste(gsNomSocketClient) alors
SocketFerme(gsNomSocketClient)
LogSocket("[FERMETURE] ✅
Socket client fermé" )
sinon
LogSocket("[FERMETURE] ℹSocket client déjà fermé" )
fin
SémaphoreFin(gsSemaphoreSocket)
fin
// Réinitialiser les variables
gbSocketActif = Faux
Socket_MettreAJourStatutUI()
LogSocket("[FERMETURE] ✅
gbSocketActif = Faux"
)
LogSocket("========================================")
LogSocket("[FERMETURE] ✅
Fermeture terminée avec succès"
LogSocket("========================================")
)
Procédure globale Socket_GererDeconnexionServeur

