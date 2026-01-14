procédure Socket_Initialiser()
// Vérifier si le sémaphore existe déjà
si gsSemaphoreSocket = "" alors
SémaphoreCrée("SEM_SOCKET_TL21", 1)
si gsSemaphoreSocket = "" alors
LogSocket("❌
Erreur création sémaphore : "
+ ErreurInfo())
retour
fin
LogSocket("✅
Sémaphore créé : "
+ gsSemaphoreSocket)
sinon
LogSocket("ℹSémaphore déjà existant, réutilisation : " + gsSemaphoreSocket)
fin
// Récupérer le nom de l'utilisateur
gsUtilisateurActuel = SysEnvironnement("USERNAME")
si gsUtilisateurActuel = "" alors
gsUtilisateurActuel = "USER_" + NumériqueVersChaîne(Hasard(1000, 9999))
fin
LogSocket("========================================")
LogSocket("Initialisation Socket pour : " + gsUtilisateurActuel)
LogSocket("========================================")
// Paramètres de connexion
gsAdresseServeur = "192.168.100.34"
gnPortSocket
= 5000
gsNomSocketServeur
= "TL21_SERVEUR"
gsNomSocketClient = "CLIENT_" + gsUtilisateurActuel
// ============================================================================
// ✅
ÉTAPE 0 : INSTALLER LE TRIGGER SUR TOUS LES POSTES (SERVEUR ET CLIENT)
// ============================================================================
// IMPORTANT : Le trigger doit être installé AVANT le test serveur/client
// ============================================================================
LogSocket("[INIT] 📌Installation du trigger sur Prod_TL21..." )
// 1. Détruire les anciens triggers
HDétruitTrigger("Prod_TL21")
LogSocket("[INIT] ✅
Anciens
triggers sur Prod_TL21 détruits.")
// 2. Créer le trigger qui se déclenchera APRÈS chaque modification, ajout ou suppression
si HDécritTrigger("Prod_TL21", "HMODIFIE,HAJOUTE,HSUPPRIME", "Socket_TriggerModification",
hTriggerAprès) = Vrai alors
LogSocket("[INIT] ✅
Nouveau trigger HFSQL installé avec succès." )
sinon
Erreur("IMPOSSIBLE D'INSTALLER LE TRIGGER HFSQL", HErreurInfo())
LogSocket("[INIT] ❌
Échec critique de l'installation du
trigger. Erreur: " + HErreurInfo())
fin
// ============================================================================
// ÉTAPE 1 : TENTER DE DEVENIR SERVEUR
Partie 7 › Collection de procédures › Socket_Gestion › Code
// ============================================================================
// Chemin du fichier de verrouillage dans le dossier partagé
sCheminVerrou est une chaîne = "C:\Users\Public\Documents\Sources_SpeMH\TL21_SERVEUR.lock"
LogSocket("📁Fichier de verrouillage : " + sCheminVerrou)
LogSocket("🔒Tentative de création du fichier de verrouillage..." )
// Tenter de créer le fichier avec verrouillage exclusif
gnHandleVerrou = fOuvre(sCheminVerrou, foCréation + foLectureEcriture + foBloqueEcriture+
foBloqueLecture)
si gnHandleVerrou > 0 alors
// ✅
FICHIER CRÉÉ ET VERROUILLÉ = JE DEVIENS SERVEUR
LogSocket("✅
Fichier de verrouillage créé et verrouillé"
LogSocket("✅
Je deviens le SERVEUR" )
)
// Écrire des informations dans le fichier
sInfoServeur est une chaîne = gsUtilisateurActuel + "|" + DateSys() + "|" + HeureSys()
fEcritLigne(gnHandleVerrou, sInfoServeur)
// Tentative de création du serveur socket
LogSocket("🔌Tentative de création du socket serveur..." )
si SocketCrée(gsNomSocketServeur, gnPortSocket, gsAdresseServeur) = Vrai alors
// ✅
SOCKET SERVEUR CRÉÉ
gbEstServeur = Vrai
gbSocketActif
= Vrai
LogSocket("✅
Socket serveur créé sur port "
LogSocket("✅
Ce poste est le SERVEUR" )
+ gnPortSocket)
// ✅
NOUVEAU : Afficher un message si on devient serveur après une déconnexion
si gbEtaitClient alors
ExécuteThreadPrincipal(Socket_AfficherPromotionServeur)
gbEtaitClient = Faux
fin
// Démarrer le thread serveur
ThreadExécute("Thread_Serveur", threadSécurisé, Socket_ThreadServeur)
LogSocket("✅
Thread serveur démarré" )
sinon
// ❌
ÉCHEC DE CRÉATION DU SOCKET SERVEUR
LogSocket("❌
Échec de création du socket serveur"
LogSocket("❌
Code erreur : "
+ ErreurInfo())
)
// Libérer le fichier de verrouillage
fFerme(gnHandleVerrou)
gnHandleVerrou = 0
fSupprime(sCheminVerrou)
// Basculer en mode client
gbEstServeur = Faux
Socket_ConnecterAuServeur()
fin
sinon
// ❌
FICHIER DÉJÀ VERROUILLÉ = UN AUTRE UTILISATEUR EST SERVEUR
LogSocket("⚠Fichier de verrouillage déjà utilisé" )
LogSocket("⚠Un autre utilisateur est déjà SERVEUR" )
LogSocket("✅
Je deviens CLIENT" )
// Lire les informations du serveur actuel
si fFichierExiste(sCheminVerrou) alors
Partie 7 › Collection de procédures › Socket_Gestion › Code
nHandleLecture est un entier = fOuvre(sCheminVerrou, foLecture)
si nHandleLecture > 0 alors
sInfoServeur est une chaîne = fLitLigne(nHandleLecture)
LogSocket("📋Serveur actuel : " + sInfoServeur)
fFerme(nHandleLecture)
fin
fin
// Se connecter en tant que client
gbEstServeur = Faux
Socket_ConnecterAuServeur()
fin
Socket_MettreAJourStatutUI()
LogSocket("========================================")
Procédure globale Socket_MasquerAlerteLigne

