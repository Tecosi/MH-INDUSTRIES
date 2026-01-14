procédure Socket_DiffuserMessage(sMessage est une chaîne, sSocketEmetteur est une chaîne)
// sMessage : Le message à diffuser à tous les clients
// sSocketEmetteur : Le socket du client qui a envoyé le message
//
On ne lui renvoie pas son propre message
si gbEstServeur = Faux alors
LogSocket("[DIFFUSION] ⚠Tentative de diffusion alors qu'on n'est pas serveur" )
retour
fin
nNombreClients est un entier = gtabClientsConnectes..Occurrence
LogSocket("[DIFFUSION] 📡Diffusion du message : " + sMessage)
LogSocket("[DIFFUSION] 📤Émetteur : " + sSocketEmetteur + " | 👥Clients : "
+ nNombreClients)
nEnvoisReussis est un entier = 0
// ✅
IMPORTANT : Boucler de la FIN vers le DÉBUT
// Cela permet de supprimer des éléments du tableau sans décaler les indices
Partie 7 › Collection de procédures › Socket_Gestion › Code
pour i = gtabClientsConnectes..Occurrence à 1 pas -1
sSocketClientCible est une chaîne = gtabClientsConnectes[i]
// Ne pas renvoyer le message à celui qui l'a envoyé
si sSocketClientCible = sSocketEmetteur alors
LogSocket("[DIFFUSION]
⏭Émetteur ignoré : " + sSocketClientCible)
continuer
fin
LogSocket("[DIFFUSION]
→ Envoi à : " + sSocketClientCible)
// ✅
PROTÉGER AVEC LE SÉMAPHORE
SémaphoreDébut(gsSemaphoreSocket,5000)
bResultat est un booléen = SocketEcrit(sSocketClientCible, sMessage)
SémaphoreFin(gsSemaphoreSocket)
// Tenter d'envoyer le message
si bResultat= Vrai alors
// ✅
Envoi réussi
nEnvoisReussis++
LogSocket("[DIFFUSION]
✅
Envoi réussi à : "
+ sSocketClientCible)
sinon
// ❌
Envoi échoué : le client est probablement déconnecté
LogSocket("[DIFFUSION]
❌
Échec d'envoi à : "
+ sSocketClientCible)
LogSocket("[NETTOYAGE] 🗑 Client déconnecté détecté, suppression de la liste
" )
// 1. Arrêter le thread de gestion de ce client
sNomThread est une chaîne = "Thread_Client_" + sSocketClientCible
LogSocket("[NETTOYAGE] 🛑Arrêt du thread : " + sNomThread)
ThreadDemandeArrêt(sNomThread)
ThreadAttend(sNomThread, 500)
// 2. Fermer le socket de notre côté
SémaphoreDébut(gsSemaphoreSocket, 5000)
quand exception dans
si SocketExiste(sSocketClientCible) alors
SocketFerme(sSocketClientCible)
LogSocket("[NETTOYAGE] ✅
Socket fermée : "
+ sSocketClientCible)
sinon
LogSocket("[NETTOYAGE] ℹSocket déjà fermée : " + sSocketClientCible)
fin
faire
LogSocket("[NETTOYAGE] ⚠Erreur lors de la fermeture : " + ExceptionInfo())
fin
SémaphoreFin(gsSemaphoreSocket)
// 3. Supprimer le client du tableau
TableauSupprime(gtabClientsConnectes, i)
LogSocket("[NETTOYAGE] ✅
Client supprimé. Clients restants : "
Occurrence)
+ gtabClientsConnectes..
fin
fin
LogSocket("[DIFFUSION] ✅
Message diffusé à "
+ nEnvoisReussis + " client(s)")
Procédure globale Socket_Envoyer

