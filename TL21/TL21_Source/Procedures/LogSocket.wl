procédure LogSocket(sMessage est une chaîne)
// Fichier de log partagé entre tous les utilisateurs (un fichier par jour)
sDateJour est une chaîne = DateVersChaîne(DateSys(), "YYYYMMDD")
sCheminLog est une chaîne = "C:\Users\Public\Documents\Sources_SpeMH\TL21_Socket_" + sDateJour +
".log"
sSemLog est une chaîne = "SEM_LOG_TL21"
// Créer le sémaphore s'il n'existe pas
quand exception dans
SémaphoreCrée(sSemLog, 1)
faire
// Ignorer l'erreur si le sémaphore existe déjà
fin
// Nettoyage des logs de plus de 7 jours (1% de chance à chaque appel pour éviter la surcharge)
si Hasard(1, 100) = 1 alors
Socket_NettoyerVieuxLogs(7)
fin
// Formater la ligne de log avec date, heure et utilisateur
sLigneLog est une chaîne = DateSys() + " " + HeureSys() + " [" + gsUtilisateurActuel + "] | " +
sMessage
// Protéger l'écriture dans le fichier
SémaphoreDébut(sSemLog, 5000)
nFichier est un entier = fOuvre(sCheminLog, foCréationSiInexistant + foAjout + foEcriture)
si nFichier > 0 alors
fEcritLigne(nFichier, sLigneLog)
fFerme(nFichier)
fin
SémaphoreFin(sSemLog)
Procédure globale Socket_NettoyerVieuxLogs

