# 🏭 MH-INDUSTRIES - Applications et Outils

Dépôt centralisé des applications et outils développés pour **MH-INDUSTRIES**.

---

## 📦 Applications

### [TL21](./TL21/) - Gestion de Production

Application de gestion de production avec synchronisation multi-utilisateurs en temps réel.

**Fonctionnalités** :
- ✅ Synchronisation temps réel entre plusieurs postes
- ✅ Élection automatique du serveur
- ✅ Verrouillage optimiste pour éviter les conflits
- ✅ Consultation de documents techniques
- ✅ Recherche et filtres avancés

**Technologies** : WinDev, HFSQL, Sockets TCP/IP, Threads

**Documentation** :
- [📘 Documentation Technique](./TL21/docs/DOCUMENTATION_TECHNIQUE_TL21.md)
- [📗 Guide Utilisateur](./TL21/docs/GUIDE_UTILISATEUR_TL21.md)
- [🧹 Rapport de Nettoyage](./TL21/docs/RAPPORT_FINAL_NETTOYAGE_TL21.md)

---

### [TL21_Web](./TL21_Web/) - Version Web Moderne 🆕

Migration de l'application TL21 vers une application web moderne avec interface React.

**Fonctionnalités** :
- ✅ Interface web moderne et responsive
- ✅ Synchronisation temps réel via WebSockets
- ✅ Connexion à la base HFSQL existante (via ODBC)
- ✅ Notifications non intrusives
- ✅ Dashboard avec statistiques et graphiques
- ✅ Visionneuse de documents intégrée

**Technologies** : React, TypeScript, Node.js, Socket.io, HFSQL (ODBC)

**Documentation** :
- [🌐 README du Projet](./TL21_Web/README.md)
- [🔌 Stratégie de Connexion HFSQL](./TL21_Web/docs/STRATEGIE_CONNEXION_HFSQL.md)
- [🏗️ Architecture Technique](./TL21_Web/docs/ARCHITECTURE_TECHNIQUE_TL21_WEB.md)
- [🎨 Maquettes d'Interface](./TL21_Web/docs/MAQUETTES_INTERFACE_TL21.md)

**Statut** : 📋 Phase de Conception Terminée - Prêt pour le Développement

---

## 🚀 Démarrage Rapide

### TL21 (Application WinDev)

1. Consulter le [Guide Utilisateur](./TL21/docs/GUIDE_UTILISATEUR_TL21.md)
2. Pour les développeurs : [Documentation Technique](./TL21/docs/DOCUMENTATION_TECHNIQUE_TL21.md)

### TL21_Web (Application Web)

1. Consulter le [README du Projet](./TL21_Web/README.md)
2. Pour démarrer le développement : Utiliser un des [prompts de démarrage](./TL21_Web/prompts/)
3. Voir les [maquettes d'interface](./TL21_Web/maquettes/) pour visualiser le design

---

## 📝 Licence

© 2026 MH-INDUSTRIES - Tous droits réservés

---

## 📞 Contact

Pour toute question ou support :
- **Service Informatique** : support@mh-industries.fr
- **Service Production** : production@mh-industries.fr
