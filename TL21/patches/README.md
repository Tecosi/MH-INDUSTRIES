# 🔧 Patches TL21

Ce dossier contient les correctifs (patches) pour l'application TL21.

---

## 📦 Patches Disponibles

### Patch 1.0.1.50 - Correction Erreur Version Vide (14/01/2026)

**Problème corrigé** : Erreur 80123 - L'an zéro n'est pas une année valide

**Fichiers** :
- `PATCH_VERSION_VIDE_TL21.md` : Documentation complète du patch
- `ANALYSE_ERREUR_VERSION_VIDE.md` : Analyse détaillée de l'erreur
- `Socket_SauvegarderEnregistrement_CORRECTED.wl` : Code corrigé à appliquer

**Symptômes** :
- Erreur WinDev 80123 lors de l'ajout d'une nouvelle ligne
- Message : "L'an zéro n'est pas une année valide"
- Plantage lors de la sortie de colonne sur une nouvelle ligne

**Solution** :
- Vérification de la validité de la DateHeure avant conversion
- Gestion sécurisée des dates vides
- Pas de vérification de conflit pour les nouvelles lignes

**Installation** :
1. Consulter `PATCH_VERSION_VIDE_TL21.md`
2. Remplacer le contenu de `Socket_SauvegarderEnregistrement` par `Socket_SauvegarderEnregistrement_CORRECTED.wl`
3. Recompiler le projet

**Statut** : ✅ Prêt pour Production

---

### Patch 1.0.1.49 - Correction Erreur Socket Concurrence (14/01/2026)

**Problème corrigé** : Erreur 100121 - Socket utilisée dans un autre thread

**Fichiers** :
- `PATCH_SOCKET_CONCURRENCE_TL21.md` : Documentation complète du patch
- `ANALYSE_ERREUR_SOCKET_CONCURRENCE.md` : Analyse détaillée de l'erreur
- `Socket_DiffuserMessage_CORRECTED.wl` : Code corrigé à appliquer

**Symptômes** :
- Erreur WinDev 100121 lors de la diffusion de messages
- Message : "La socket est actuellement utilisée dans un autre thread et n'a pas été débloquée au bout d'une seconde"
- Plantage de l'application lors de modifications simultanées

**Solution** :
- Ajout d'un bloc `QUAND EXCEPTION` pour gérer l'erreur 100121
- Nettoyage des artefacts du PDF
- Amélioration des logs

**Installation** :
1. Consulter `PATCH_SOCKET_CONCURRENCE_TL21.md`
2. Remplacer le contenu de `Socket_DiffuserMessage` par `Socket_DiffuserMessage_CORRECTED.wl`
3. Recompiler le projet

**Statut** : ✅ Prêt pour Production

---

## 🚀 Comment Appliquer un Patch

### Méthode 1 : Remplacement Manuel

1. Ouvrir le projet TL21 dans WinDev
2. Localiser la procédure concernée
3. Remplacer le code par la version corrigée
4. Enregistrer et recompiler

### Méthode 2 : Import depuis GitHub

1. Télécharger le fichier `.wl` corrigé
2. Ouvrir WinDev
3. Importer le fichier dans la collection appropriée
4. Recompiler

---

## 📋 Historique des Patches

| Version | Date | Description | Fichiers |
|---------|------|-------------|----------|
| 1.0.1.50 | 14/01/2026 | Correction erreur version vide (80123) | Socket_SauvegarderEnregistrement.wl |
| 1.0.1.49 | 14/01/2026 | Correction erreur socket 100121 | Socket_DiffuserMessage.wl |

---

## 📞 Support

Pour toute question sur les patches :
- Consulter la documentation du patch concerné
- Vérifier les logs après application
- Contacter le service informatique si problème persistant

---

**Dernière mise à jour** : 14 janvier 2026
