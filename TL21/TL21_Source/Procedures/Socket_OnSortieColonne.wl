procédure Socket_OnSortieColonne()
LogSocket("[SORTIE] 🚪Sortie de colonne, ligne="
+ gnIDLigneEnCoursDeModification)
si pas gbSaisieEnCours alors
LogSocket("[SORTIE] ⚠Pas en mode saisie, sortie immédiate" )
retour
fin
LogSocket("[SORTIE] 💾Appel Socket_SauvegarderEnregistrement ID=" + gnEnregistrementEnCours)
// On tente de sauvegarder en utilisant l'ID et la version stockés à l'entrée
// La procédure de sauvegarde renvoie Vrai si succès, Faux si échec (conflit ou autre)
bSauvegardeReussie est un booléen = Socket_SauvegarderEnregistrement(gnEnregistrementEnCours, gdh
VersionEnCours)
// la procédure de sauvegarde a déjà notifié l'utilisateur et rechargé la ligne.
// On arrête tout ici pour ne pas signaler la fin de l'édition.
si pas bSauvegardeReussie alors
LogSocket("[SORTIE] ❌
Sauvegarde échouée" )
retour
fin
LogSocket("[SORTIE] ✅
Sauvegarde réussie, envoi notification" )
// --- La sauvegarde a réussi, on peut maintenant terminer le cycle d'édition ---
Partie 7 › Collection de procédures › Entrées_Sorties › Code
// Notifier les autres utilisateurs qu'on a fini d'éditer cette ligne
si gbSocketActif alors
LogSocket("[SORTIE] 📤Appel Socket_Envoyer('stop_editing', "
+ gnEnregistrementEnCours + ")")
Socket_Envoyer("stop_editing", gnEnregistrementEnCours)
sinon
LogSocket("[SORTIE] ⚠Socket inactif, pas d'envoi" )
fin
// Réinitialiser les variables d'état de la saisie
gbSaisieEnCours
= Faux
gnEnregistrementEnCours
= 0
gdhVersionEnCours
= ""
LogSocket("[SORTIE] 📤Envoi message
update au serveur")
Partie 7 › Collection de procédures › Socket_Gestion › Code
Socket_Gestion
Code
Déclaration de Socket_Gestion
// ============================================================================
// THREAD SERVEUR : ATTENTE DES CONNEXIONS
// ============================================================================
Procédure globale Socket_AfficherAlerteLigne

