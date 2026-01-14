procédure Socket_EnvoyerDepuisTrigger(sAction est une chaîne, nID est un entier)
// Cette procédure est appelée dans le thread principal par le trigger
LogSocket("[TRIGGER-TP] 📤Envoi message : " + sAction + " ID=" + nID)
// Envoyer le message
Socket_Envoyer(sAction, nID, "")
LogSocket("[TRIGGER-TP] ✅
Message envoyé"
)
Procédure globale Socket_EnvoyerVersClient
Partie 7 › Collection de procédures › Socket_Gestion › Code
// Envoyer un message à un client spécifique (SERVEUR uniquement)

