// ============================================================================
// PATCH SOCKET 100121 - Version 2 (Corrigée)
// Fichier 1/5 : Variables Globales à ajouter
// ============================================================================
// À ajouter dans la collection de procédures Socket_Gestion
// ou dans les déclarations globales du projet
// ============================================================================

// --- Début Patch Socket 100121 ---
// File d'attente thread-safe pour les messages à envoyer
gfileMessagesEnvoi est une File de chaînes

// Variables pour le thread d'émission
gsNomThreadEmission est une chaîne = ""
gbThreadEmissionActif est un booléen = Faux
// --- Fin Patch Socket 100121 ---
