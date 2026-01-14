procédure ConserverFichiersRecents(local sCheminDossier est une chaîne, local sMotifFichier est une
chaîne, local nNombreAConserver est un entier)
// Variables locales
sListeFichiers est une chaîne
tabFichiers est un tableau associatif de DateHeure // ✅ RÉCUPÉRER LA LISTE COMPLÈTE DES FICHIERS sListeFichiers = fListeFichier(sCheminDossier + "\" + sMotifFichier, frNonRécursif)
// ✅
PARCOURIR AVEC POUR TOUTE CHAÎNE (syntaxe officielle PCsoft)
pour toute chaîne sNomFichier de sListeFichiers séparée par RC
// ⭐CORRECTION : S'assurer que l'on a uniquement le nom du fichier
sNomFichier = fExtraitChemin(sNomFichier, fFichier + fExtension)
// Construire le chemin complet
sCheminComplet
= sCheminDossier + "\" + sNomFichier
// Récupérer la date de modification
dhDateModif
= fDateHeure(sCheminComplet, "", fModification)
// Ajouter au tableau
tabFichiers[sCheminComplet]
= dhDateModif
fin
// Vérifier s'il y a des fichiers à supprimer
nNombreFichiers = tabFichiers..Occurrence
si nNombreFichiers <= nNombreAConserver alors retour
// Trier par date (du plus récent au plus ancien)
TableauTrie(tabFichiers, ttDécroissant)
// Supprimer les fichiers au-delà de la limite
i = 0
pour toute dhDateModif, sCheminComplet de tabFichiers
i++
Partie 7 › Collection de procédures › COL_PROCÉDURES_DE_GESTION_DES_ERREURS › Code
si i > nNombreAConserver alors
fSupprime(sCheminComplet)
fin
fin
Procédure globale ConvertirDocumentEnPDF
// ═══════════════════════════════════════════════════════════════
// Procédure : ConvertirDocumentEnPDF
// Description : Convertit un document (DOCX, XLS, XLSX) en PDF
//
Gère les fichiers verrouillés et les dates de modification
// Paramètres :
// sCheminSource (chaîne Unicode) : Chemin complet du fichier source
// Retour :

