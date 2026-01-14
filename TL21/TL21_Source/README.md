# 📁 Code Source TL21

Code source extrait de l'application **TL21 - Gestion de Production** (WinDev 2025).

## 📂 Structure

```
TL21_Source/
├── Fenetres/          # Fenêtres de l'application (6 fichiers)
│   ├── FEN_Principale.wl
│   ├── FEN_ADD_COLOR.wl
│   ├── FEN_CT_Plaques.wl
│   ├── FEN_Controle_Osmoseur.wl
│   ├── FEN_Controle_TTS.wl
│   └── FEN_Gestion_utilisateurs.wl
│
├── Procedures/        # Procédures globales (52 fichiers)
│   ├── Socket_*.wl           # 23 procédures de gestion des sockets
│   ├── Convertir*.wl         # Conversion de documents
│   ├── Enregistrer*.wl       # Gestion des enregistrements
│   └── ...
│
├── Classes/           # Classes (1 fichier)
│   └── Classe1.wl
│
└── Etats/             # États (vide pour l'instant)
```

## 🔧 Fenêtres

### FEN_Principale
Fenêtre principale de l'application avec :
- Gestion de la table de production (TABLE_Prod_TL21)
- Synchronisation multi-utilisateurs en temps réel
- Consultation de documents techniques
- Recherche et filtres avancés

### FEN_Gestion_utilisateurs
Gestion des utilisateurs et des droits d'accès.

### FEN_CT_Plaques, FEN_Controle_Osmoseur, FEN_Controle_TTS
Fenêtres de contrôle qualité pour différents processus de production.

### FEN_ADD_COLOR
Fenêtre de sélection de couleurs personnalisées.

## 🔌 Procédures Socket

Les procédures `Socket_*.wl` gèrent la synchronisation en temps réel :

### Architecture Client-Serveur
- **Socket_Initialiser** : Initialisation du système de sockets
- **Socket_ThreadServeur** : Thread serveur pour gérer les connexions
- **Socket_ThreadGestionClient** : Thread de gestion des clients connectés
- **Socket_ConnecterAuServeur** : Connexion au serveur
- **Socket_Fermer** : Fermeture propre des connexions

### Communication
- **Socket_Envoyer** : Envoi de messages au serveur
- **Socket_EnvoyerVersClient** : Envoi de messages à un client spécifique
- **Socket_DiffuserMessage** : Diffusion de messages à tous les clients
- **Socket_TraiterMessageClient** : Traitement des messages reçus côté client
- **Socket_TraiterMessageServeur** : Traitement des messages reçus côté serveur

### Synchronisation des Données
- **Socket_RechargerEnregistrement** : Recharge un enregistrement modifié
- **Socket_SauvegarderEnregistrement** : Sauvegarde un enregistrement
- **Socket_SupprimerLigneTable** : Suppression d'une ligne
- **Socket_RechargerTable** : Rechargement complet de la table
- **Socket_TriggerModification** : Trigger HFSQL pour détecter les modifications

### Gestion de la Saisie
- **Socket_OnEntreeColonne** : Événement d'entrée en saisie
- **Socket_OnSortieColonne** : Événement de sortie de saisie
- **Socket_AfficherAlerteLigne** : Affiche une alerte sur une ligne verrouillée
- **Socket_MasquerAlerteLigne** : Masque l'alerte

### Interface Utilisateur
- **Socket_MettreAJourStatutUI** : Met à jour le statut de connexion
- **Socket_AfficherPromotionServeur** : Affiche la promotion en serveur
- **Socket_AfficherErreurConnexion** : Affiche une erreur de connexion

### Gestion des Erreurs
- **Socket_GererDeconnexionServeur** : Gère la déconnexion du serveur
- **Socket_ReconnecterAuServeur** : Reconnexion automatique

### Logging
- **LogSocket** : Enregistre les événements socket
- **Socket_NettoyerVieuxLogs** : Nettoie les anciens logs

## 📄 Procédures de Gestion des Documents

- **ConvertirDocumentEnPDF** : Conversion de documents en PDF
- **ConvertirDocumentsDeListe** : Conversion en masse
- **MettreAJourDocuments** : Mise à jour des documents liés
- **OuvrePDF** : Ouverture de PDF dans l'interface
- **AfficheIconesDoc** : Affichage des icônes de documents

## 💾 Procédures de Gestion des Données

- **EnregistrerLigneModifiee** : Enregistrement d'une ligne modifiée
- **VerrouillerLignePourSaisie** : Verrouillage optimiste
- **LibererVerrousPourDate** : Libération des verrous
- **RenumeroterOrdresPourDate** : Renumérotation des ordres
- **BackupProd** : Sauvegarde de la production

## 🔧 Technologies

- **WinDev 2025** : Environnement de développement
- **WLangage** : Langage de programmation
- **HFSQL Classic** : Base de données
- **Sockets TCP/IP** : Communication (port 5000)
- **Threads** : Gestion asynchrone
- **Triggers HFSQL** : Détection des modifications

## 📊 Statistiques

- **Total de fichiers** : 59
- **Lignes de code** : ~16 000
- **Fenêtres** : 6
- **Procédures** : 52
- **Classes** : 1

## 🔗 Documentation

Pour plus d'informations, consultez :
- [Documentation Technique](../docs/DOCUMENTATION_TECHNIQUE_TL21.md)
- [Guide Utilisateur](../docs/GUIDE_UTILISATEUR_TL21.md)
- [Rapport de Nettoyage](../docs/RAPPORT_FINAL_NETTOYAGE_TL21.md)

## 📝 Notes

- Code extrait automatiquement depuis la documentation technique PDF
- Nettoyé et organisé pour faciliter la maintenance
- Compatible avec WinDev 2025
- Prêt pour l'importation dans un projet WinDev

---

**Date d'extraction** : 14 janvier 2026  
**Version** : TL21 v3 Socket  
**Auteur** : MH-INDUSTRIES
