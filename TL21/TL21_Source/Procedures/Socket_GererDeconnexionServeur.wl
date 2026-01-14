procédure Socket_GererDeconnexionServeur()
si gbSocketActif = Faux alors retour
LogSocket("[RE-ELECTION] ⚠Le serveur ne répond plus. Lancement du processus de réélection..." )
// 1. Fermer proprement l'ancien socket client
SocketFerme(gsNomSocketClient)
// 2. Mettre à jour le statut global et l'interface
gbReelectionEnCours = Vrai
gbEstServeur = Faux
Socket_MettreAJourStatutUI() // Affiche "🔄Réélection..."
// 3. Attendre un peu pour éviter que tous les clients se lancent en même temps
LogSocket("[RE-ELECTION] ⏳
Attente aléatoire avant de tenter de devenir serveur..."
Temporisation(Hasard(500, 2500)) // Attente aléatoire entre 0.5s et 2.5s
)
// Marquer qu'on était client (pour afficher le message de promotion si on devient serveur)
gbEtaitClient = Vrai
gbReelectionEnCours
= Faux
Partie 7 › Collection de procédures › Socket_Gestion › Code
// 4. Relancer la procédure d'initialisation complète.
// C'est elle qui va tenter de créer le fichier .lock et de devenir le nouveau serveur
// ou de se connecter au nouveau serveur si un autre a été plus rapide.
LogSocket("[RE-ELECTION] 🚀Relance de l'initialisation complète..." )
Socket_Initialiser()
Procédure globale Socket_Initialiser

