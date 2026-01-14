procédure Socket_NettoyerVieuxLogs(nNbJours est un entier)
// Supprimer les fichiers de log de plus de nNbJours jours
dDatelimite est une Date = DateDuJour() dDatelimite..Jour-=nNbJours
sRepertoire est une chaîne = "C:\Users\Public\Documents\Sources_SpeMH\"
sDateLimite est une chaîne = DateVersChaîne(dDatelimite, "YYYYMMDD")
// Lister tous les fichiers de log
sListeFichiers est une chaîne = fListeFichier(sRepertoire + "TL21_Socket_*.log")
sNomFichier est une chaîne = fExtraitChemin(sFichier, fFichier + fExtension)
sDateFichier est une chaîne
= Milieu(sNomFichier, 13, 8) // Position de YYYYMMDD
// Comparer avec la date limite
si sDateFichier < sDateLimite alors
// Supprimer le fichier
si fSupprime(sFichier) alors
LogSocket("[NETTOYAGE] 🗑 Log supprimé :" + sNomFichier)
sinon
LogSocket("[NETTOYAGE] ⚠Impossible de supprimer : " + sNomFichier)
fin
fin
fin
Procédure globale TraceH
// Fonction utilitaire pour tracer avec horodatage

