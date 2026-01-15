// ============================================================================
// PATCH SOCKET 100121 - Version 2 (Corrigée)
// Fichier 5/5 : Socket_Fermer - AJOUTER CE BLOC
// ============================================================================
// À ajouter dans Socket_Fermer AU DÉBUT de la procédure
// (après les premières lignes de log, avant le test "si gbSocketActif = Faux")
// ============================================================================

// ============================================================================
// ✅ PATCH SOCKET 100121 - VERSION CORRIGÉE
// --- Début Patch Socket 100121 ---
// Arrêter le thread d'émission des messages
si gsNomThreadEmission <> "" alors
    gbThreadEmissionActif = Faux
    LogSocket("[FERMER] 🛑 Demande d'arrêt du thread d'émission...")
    
    // Attendre que le thread se termine (2 secondes max)
    si ThreadAttend(gsNomThreadEmission, 2000) = Faux alors
        LogSocket("[FERMER] ⚠ Le thread d'émission n'a pas répondu dans les 2 secondes.")
    sinon
        LogSocket("[FERMER] ✅ Thread d'émission des messages arrêté.")
    fin
    
    gsNomThreadEmission = ""
fin
// --- Fin Patch Socket 100121 ---
// ============================================================================
