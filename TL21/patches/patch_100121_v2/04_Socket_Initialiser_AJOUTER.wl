// ============================================================================
// PATCH SOCKET 100121 - Version 2 (Corrigée)
// Fichier 4/5 : Socket_Initialiser - AJOUTER CE BLOC
// ============================================================================
// À ajouter dans Socket_Initialiser AVANT l'appel à Socket_MettreAJourStatutUI()
// (vers la ligne 138)
// ============================================================================

// ============================================================================
// ✅ PATCH SOCKET 100121
// --- Début Patch Socket 100121 ---
// Démarrer le thread d'émission des messages
gbThreadEmissionActif = Vrai
gsNomThreadEmission = "Thread_Emission_Socket"
ThreadExécute(gsNomThreadEmission, threadSécurisé, Socket_ThreadEmission)
LogSocket("[INIT] ✅ Thread d'émission des messages démarré.")
// --- Fin Patch Socket 100121 ---
// ============================================================================
