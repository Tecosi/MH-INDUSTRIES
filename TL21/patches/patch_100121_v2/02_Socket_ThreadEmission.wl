// ============================================================================
// PATCH SOCKET 100121 - Version 2 (Corrigée)
// Fichier 2/5 : Nouvelle procédure Socket_ThreadEmission
// ============================================================================
// NOUVELLE PROCÉDURE GLOBALE à créer dans Socket_Gestion
// ============================================================================

// ============================================================================
// PROCÉDURE : Socket_ThreadEmission
// RÔLE      : Gérer l'envoi des messages socket en arrière-plan
//             pour éviter les conflits de thread.
// ============================================================================
procédure Socket_ThreadEmission()
    sMessage est une chaîne
    
    LogSocket("[THREAD ÉMISSION] Démarrage du thread d'émission")
    
    // Boucle principale du thread
    tantque gbThreadEmissionActif = Vrai
        // Défile() renvoie Vrai si un élément a été récupéré, Faux sinon
        si Défile(gfileMessagesEnvoi, sMessage) alors
            LogSocket("[THREAD ÉMISSION] 📤 Message à envoyer : " + sMessage)
            
            // Utiliser le sémaphore pour garantir un accès exclusif au socket
            SémaphoreDébut(gsSemaphoreSocket, 5000)
            
            si gbEstServeur alors
                // Mode SERVEUR : diffuser à tous les clients connectés
                pour tout sClient de gtabClientsConnectes
                    si SocketEcrit(sClient, sMessage) alors
                        LogSocket("[THREAD ÉMISSION] ✅ Envoyé avec succès à " + sClient)
                    sinon
                        LogSocket("[THREAD ÉMISSION] ❌ Échec d'envoi vers " + sClient + " : " + ErreurInfo())
                    fin
                fin
            sinon
                // Mode CLIENT : envoyer au serveur unique
                si SocketEcrit(gsNomSocketClient, sMessage) alors
                    LogSocket("[THREAD ÉMISSION] ✅ Message envoyé avec succès au serveur")
                sinon
                    LogSocket("[THREAD ÉMISSION] ❌ Échec d'envoi au serveur : " + ErreurInfo())
                fin
            fin
            
            // Libérer le sémaphore après l'opération
            SémaphoreFin(gsSemaphoreSocket)
        sinon
            // Si la file est vide, faire une pause pour ne pas surcharger le CPU
            Temporisation(50) // 50ms
        fin
    fin
    
    LogSocket("[THREAD ÉMISSION] 🛑 Arrêt du thread d'émission")
fin
