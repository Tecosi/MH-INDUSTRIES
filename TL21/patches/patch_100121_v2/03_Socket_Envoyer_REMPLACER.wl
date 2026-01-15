// ============================================================================
// PATCH SOCKET 100121 - Version 2 (Corrigée)
// Fichier 3/5 : Socket_Envoyer - REMPLACER ENTIÈREMENT
// ============================================================================
// REMPLACER tout le code de la procédure Socket_Envoyer par celui-ci
// ============================================================================

// ============================================================================
// PROCÉDURE : Socket_Envoyer (PATCHÉE)
// RÔLE      : Formate un message et l'ajoute à la file d'attente d'envoi
//             au lieu de l'envoyer directement.
// ============================================================================
procédure Socket_Envoyer(sAction est une chaîne, nIDEnreg est un entier, sValeur est une chaîne = "")
    // Si le socket n'est pas actif, on ne fait rien
    si gbSocketActif = Faux alors
        LogSocket("[ENVOI] ⚠ Socket inactif, envoi annulé")
        retour
    fin
    
    LogSocket("[ENVOI] 📡 Préparation message : Type=" + sAction + ", ID=" + nIDEnreg)
    
    // Formatage du message standardisé
    sMessage est une chaîne = sAction + "|" + nIDEnreg + "|" + gsUtilisateurActuel + "|" + sValeur
    
    // ✅ CORRECTION : Utiliser Enfile() qui est thread-safe
    Enfile(gfileMessagesEnvoi, sMessage)
    
    LogSocket("[ENVOI] ✅ Message ajouté à la file d'attente pour envoi différé")
fin
