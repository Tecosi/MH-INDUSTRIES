# 📊 TL21 - Gestion de Production

Application de gestion de production avec **synchronisation multi-utilisateurs en temps réel**.

---

## 🎯 Description

TL21 est une application WinDev permettant à plusieurs utilisateurs de gérer simultanément le planning de production avec une synchronisation automatique des modifications en temps réel.

### Fonctionnalités Principales

✅ **Synchronisation temps réel** : Les modifications sont visibles instantanément par tous les utilisateurs  
✅ **Élection automatique du serveur** : Le premier utilisateur devient automatiquement le serveur  
✅ **Verrouillage optimiste** : Protection contre les conflits de modification  
✅ **Consultation de documents** : Accès aux plans et documents techniques (PDF)  
✅ **Recherche et filtres** : Filtres par date, affaire, pièce, client, etc.  
✅ **Gestion des incidents** : Suivi des incidents de production  

---

## 🏗️ Architecture

### Technologies

- **Langage** : WLangage (WinDev 28+)
- **Base de données** : HFSQL Classic (partagée)
- **Communication** : Sockets TCP/IP (port 5000)
- **Threads** : Gestion asynchrone des connexions
- **Triggers** : HFSQL pour détection automatique des modifications

### Architecture Client-Serveur

```
┌─────────────────────────────────────────────────────────────┐
│                    RÉSEAU LOCAL (LAN)                       │
│                                                             │
│  ┌──────────────┐         ┌──────────────┐                │
│  │   POSTE 1    │         │   POSTE 2    │                │
│  │  (SERVEUR)   │◄───────►│   (CLIENT)   │                │
│  │  Port 5000   │  Socket │              │                │
│  └──────┬───────┘  TCP/IP └──────┬───────┘                │
│         │                        │                         │
│         └────────────┬───────────┘                         │
│                      │                                     │
│              ┌───────▼────────┐                           │
│              │  Base HFSQL    │                           │
│              │  Prod_TL21     │                           │
│              └────────────────┘                           │
└─────────────────────────────────────────────────────────────┘
```

---

## 💾 Code Source

📁 **[Code Source WLangage](./TL21_Source/)**

- **59 fichiers sources** extraits et organisés
- **~16 000 lignes de code** WLangage
- **6 fenêtres** : FEN_Principale, FEN_Gestion_utilisateurs, etc.
- **52 procédures** : dont 27 procédures Socket_*
- **1 classe** : Classe1
- **Structure claire** : Fenetres/, Procedures/, Classes/, Etats/

📋 **[Rapport de Validation](./TL21_Source/RAPPORT_VALIDATION.md)**

- Validation complète du code extrait
- Vérification contre la documentation
- 129 lignes de code commenté obsolète supprimées
- Architecture conforme et prête pour WinDev 2025

---

## 📚 Documentation

### Pour les Utilisateurs

📗 **[Guide Utilisateur](./docs/GUIDE_UTILISATEUR_TL21.md)**

- Démarrage de l'application
- Interface principale
- Gestion de la production
- Travail collaboratif
- Consultation des documents
- Recherche et filtres
- Trucs et astuces
- Résolution de problèmes
- FAQ

### Pour les Développeurs

📘 **[Documentation Technique](./docs/DOCUMENTATION_TECHNIQUE_TL21.md)**

- Architecture complète
- Base de données (tables, triggers)
- Système de synchronisation
- Procédures principales (27 procédures)
- Variables globales
- Messages socket
- Gestion des erreurs
- Sécurité et verrouillage
- Déploiement
- Maintenance et dépannage

### Rapport de Nettoyage

🧹 **[Rapport Final de Nettoyage](./docs/RAPPORT_FINAL_NETTOYAGE_TL21.md)**

- 62 blocs de code commenté identifiés
- 81 lignes à supprimer
- Instructions de nettoyage
- Bilan global (~780 lignes supprimées)

---

## 🚀 Installation

### Prérequis

- ✅ WinDev 28+ installé
- ✅ Windows 10/11
- ✅ Réseau local (LAN)
- ✅ Accès au dossier partagé de la base HFSQL
- ✅ Droits d'écriture sur `C:\Users\Public\Documents\Sources_SpeMH\`
- ✅ Port 5000 ouvert dans le pare-feu

### Étapes d'Installation

1. **Copier l'exécutable** sur chaque poste
2. **Configurer l'accès à la base HFSQL** (chemin réseau)
3. **Créer le dossier de verrouillage** : `C:\Users\Public\Documents\Sources_SpeMH\`
4. **Créer le dossier de logs** : `C:\Users\Public\Documents\Sources_SpeMH\Logs\`
5. **Configurer le pare-feu** pour autoriser le port 5000

---

## 🔧 Configuration

### Serveur

- **IP fixe** : 192.168.100.34
- **Port** : 5000
- **Pare-feu** : Autoriser entrant sur port 5000

### Clients

- **Connexion** : Vers 192.168.100.34:5000
- **Pare-feu** : Autoriser sortant sur port 5000

---

## 📊 Statistiques du Projet

### Nettoyage et Optimisation

- ✅ **28 procédures** nettoyées et optimisées
- ❌ **15 procédures** obsolètes supprimées
- 🧹 **~780 lignes** de code mort supprimées
- 🎯 **Projet propre** et maintenable

### Procédures Principales

- **27 procédures** de synchronisation
- **Logs automatiques** avec historique 7 jours
- **Protection complète** avec sémaphores
- **Verrouillage optimiste** pour éviter les conflits

---

## 🐛 Dépannage

### Problèmes Courants

| Problème | Solution |
|----------|----------|
| "Port 5000 déjà utilisé" | Identifier et arrêter l'application qui utilise le port |
| "Impossible de se connecter" | Vérifier que le serveur est démarré et le pare-feu |
| "Conflit de modification" | Recharger l'enregistrement et refaire la modification |
| "Fichier de verrouillage bloqué" | Supprimer manuellement `TL21_SERVEUR.lock` |

Consulter la [Documentation Technique](./docs/DOCUMENTATION_TECHNIQUE_TL21.md) pour plus de détails.

---

## 📝 Licence

© 2026 MH-INDUSTRIES - Tous droits réservés

---

## 📞 Support

Pour toute question ou support :
- **Service Informatique** : support@mh-industries.fr
- **Service Production** : production@mh-industries.fr

---

**Version** : 2.0  
**Date** : Janvier 2026  
**Plateforme** : WinDev 28+
