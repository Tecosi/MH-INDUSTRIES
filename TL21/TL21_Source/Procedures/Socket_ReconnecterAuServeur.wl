procédure Socket_ReconnecterAuServeur() : booléen
LogSocket("[RECONNEXION] 🔄Tentative de reconnexion au nouveau serveur..." )
gsAdresseServeur = "192.168.100.34"
gnPortSocket
= 5000
Partie 7 › Collection de procédures › Socket_Gestion › Code
gsNomSocketClient = "CLIENT_" + gsUtilisateurActuel
si SocketConnecte(gsNomSocketClient, gnPortSocket, gsAdresseServeur) = Vrai alors
gbSocketActif
= Vrai
gbEstServeur = Faux
LogSocket("[RECONNEXION] ✅
Connexion au nouveau serveur réussie"
)
sinon
LogSocket("[RECONNEXION] ❌
Échec de connexion au nouveau serveur"
)
renvoyer Faux
// ✅
ÉCHEC DE CONNEXION
fin
Procédure globale Socket_SauvegarderEnregistrement

