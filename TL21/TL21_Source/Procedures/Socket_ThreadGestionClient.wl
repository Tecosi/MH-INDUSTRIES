procédure Socket_ThreadGestionClient(sSocketClient est une chaîne)
sMessage est une chaîne
sUser est une chaîne tabParts est un tableau de chaînes Partie 7 › Collection de procédures › Socket_Gestion › Code LogSocket("[THREAD CLIENT " + sSocketClient + "] Démarrage") boucle // Vérifier si l'arrêt est demandé si ThreadArrêtDemandé() alors LogSocket("[THREAD CLIENT " + sSocketClient + "] 🛑Arrêt demandé, sortie" ) sortir fin // Lire un message du client (avec timeout) sMessage = SocketLit(sSocketClient, Faux, 1000) // Timeout 1 seconde
si sMessage <> "" alors
LogSocket("[THREAD CLIENT " + sSocketClient + "] 📨Message : "
+ sMessage)
// ============================================================================
// ÉTAPE 1 : PARSER LE MESSAGE
// ============================================================================
// Format : action|id|user|
tabParts = sMessage.Découpe("|")
si Dimension(tabParts) >= 3 alors
sAction = tabParts[1]
nID
= Val(tabParts[2])
sUser
= tabParts[3]
LogSocket("[THREAD CLIENT " + sSocketClient + "] 🔍Action="
", User=" + sUser)
+ sAction + ", ID=" + nID +
// ============================================================================
// ÉTAPE 2 : TRAITER LE MESSAGE LOCALEMENT (CÔTÉ SERVEUR)
// ============================================================================
selon sAction
cas "connect"
// Client se connecte
LogSocket("[THREAD CLIENT " + sSocketClient + "] 👋Client connecté : "
+ sUser)
cas "disconnect"
// Client se déconnecte
LogSocket("[THREAD CLIENT " + sSocketClient + "] 👋Client déconnecté : "
)
cas "editing"
// Client commence à éditer une cellule
LogSocket("[THREAD CLIENT " + sSocketClient + "] ✏Client édite la ligne "
)
+ sUser
+ nID
// ✅
TRAITER LOCALEMENT : Afficher l'alerte de verrouillage
ExécuteThreadPrincipal(Socket_AfficherAlerteLigne, nID, sUser)
cas "stop_editing"
// Client arrête d'éditer une cellule
LogSocket("[THREAD CLIENT " + sSocketClient +
"] 🛑Client arrête d'éditer la ligne " + nID)
// ✅
TRAITER LOCALEMENT : Masquer l'alerte
ExécuteThreadPrincipal(Socket_MasquerAlerteLigne, nID)
cas "update"
// Client a modifié un enregistrement
LogSocket("[THREAD CLIENT " + sSocketClient + "] 💾Client a modifié la ligne "
nID)
+
// ✅
TRAITER LOCALEMENT : Recharger l'enregistrement depuis la base
Partie 7 › Collection de procédures › Socket_Gestion › Code
ExécuteThreadPrincipal(Socket_RechargerEnregistrement, nID)
cas "unlock"
// Client a déverrouillé une ligne
LogSocket("[THREAD CLIENT " + sSocketClient +
"] 🔓Client a déverrouillé la ligne " + nID)
cas "add"
// Un nouvel enregistrement a été ajouté
LogSocket("[CLIENT] ➕
Ajout enregistrement ID="
+ nID)
// Recharger toute la table (ou ajouter la ligne)
ExécuteThreadPrincipal(Socket_RechargerTable)
cas "delete"
// Un enregistrement a été supprimé
LogSocket("[THREAD CLIENT " + sSocketClient +
"] ❌
Suppression enregistrement ID="
+ nID)
// ✅
CORRECTION : Appeler depuis le thread principal
ExécuteThreadPrincipal(Socket_SupprimerLigneTable, nID)
autre cas
LogSocket("[THREAD CLIENT " + sSocketClient + "] ⚠Action inconnue : "
)
+ sAction
fin
sinon
LogSocket("[THREAD CLIENT " + sSocketClient + "] ⚠Message mal formé : "
fin
+ sMessage)
// ============================================================================
// ÉTAPE 3 : DIFFUSER LE MESSAGE AUX AUTRES CLIENTS
// ============================================================================
Socket_DiffuserMessage(sMessage, sSocketClient)
sinon
// Vérifier si le client est toujours connecté
si SocketExiste(sSocketClient) = Faux alors
LogSocket("[THREAD CLIENT " + sSocketClient + "] ❌
Client déconnecté"
)
// Retirer du tableau des clients
nIndice est un entier = TableauCherche(gtabClientsConnectes, tcLinéaire, sSocketClient)
si nIndice > 0 alors
TableauSupprime(gtabClientsConnectes, nIndice)
LogSocket("[THREAD CLIENT " + sSocketClient + "] ✅
Retiré du tableau des clients" )
fin
sortir
fin
fin
fin
LogSocket("[THREAD CLIENT " + sSocketClient + "] 🛑Arrêt du thread" )
Procédure globale Socket_ThreadServeur

