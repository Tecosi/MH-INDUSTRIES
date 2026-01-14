procédure Socket_MettreAJourStatutUI()
// État 1 : Réélection en cours
si gbReelectionEnCours = Vrai alors
FEN_Principale.LIB_StatutSocket
FEN_Principale.LIB_StatutSocket..Couleur
retour
fin
= "🔄Réélection..."
= OrangeClair
// État 2 : Déconnecté
si gbSocketActif = Faux alors
FEN_Principale.LIB_StatutSocket
FEN_Principale.LIB_StatutSocket..Couleur
retour
fin
= "🔴Déconnecté"
= RougeClair
// État 3 : Serveur
si gbEstServeur = Vrai alors
FEN_Principale.LIB_StatutSocket
FEN_Principale.LIB_StatutSocket..Couleur
sinon
// État 4 : Client
FEN_Principale.LIB_StatutSocket
FEN_Principale.LIB_StatutSocket..Couleur
fin
= "👑SERVEUR"
= VertClair
= "💻CLIENT"
= BleuClair
Procédure globale Socket_RechargerEnregistrement
Partie 7 › Collection de procédures › Socket_Gestion › Code

