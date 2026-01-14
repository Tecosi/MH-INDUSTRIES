# 🔍 ANALYSE - Erreur "L'an zéro n'est pas une année valide"

**Date** : 14 janvier 2026  
**Erreur** : Code 80123 - L'an zéro n'est pas une année valide  
**Procédures concernées** : `Socket_SauvegarderEnregistrement`, `Socket_OnSortieColonne`  
**Contexte** : Ajout d'une nouvelle ligne dans la table de production

---

## 📋 Erreur Rapportée

```
Le mécanisme de sécurité du WLangage a détecté une erreur dans l'application Julien_TL21.
Vous avez appelé la fonction 'DateHeureVersChaîne'.
L'an zéro n'est pas une année valide. La datation passe de 1 avant J.C. à 1 après J.C.

Pile des appels :
Procédure globale Socket_SauvegarderEnregistrement (Socket_Gestion.Socket_SauvegarderEnregistrement), ligne 4
Procédure globale Socket_OnSortieColonne (Entrées_Sorties.Socket_OnSortieColonne), ligne 13
Sortie de COL_Affaire ( TABLE_Prod_TL21 ) (FEN_Principale.TABLE_Prod_TL21.COL_Affaire), ligne 2

Date : 14/01/2026 15:45:53
Code erreur : 80123
```

---

## 🔎 Cause Identifiée

### Problème : Champ Version Vide lors de l'Ajout de Ligne

Quand l'utilisateur **ajoute une nouvelle ligne** avec le bouton d'ajout :

1. **Une nouvelle ligne est créée** dans la table avec `TableAjoutLigne` ou similaire
2. **Le champ `Version` (DateHeure) est vide** (valeur par défaut = année zéro)
3. **L'utilisateur commence à remplir les colonnes** (Client, Affaire, etc.)
4. **À la sortie de la colonne**, `Socket_OnSortieColonne` est appelé
5. **Ligne 11-12** : Appel de `Socket_SauvegarderEnregistrement` avec `gdhVersionEnCours`
6. **`gdhVersionEnCours` est vide** (année zéro) car la ligne vient d'être ajoutée
7. **Ligne 4-5 de Socket_SauvegarderEnregistrement** :
   ```wl
   LogSocket("[SAUVE] Version client=" + DateHeureVersChaîne(dhVersionClient))
   ```
8. **`DateHeureVersChaîne` est appelé avec une DateHeure vide (année zéro)**
9. **WinDev génère l'erreur 80123** : "L'an zéro n'est pas une année valide"

---

## 🛠️ Analyse du Code

### Fichier : `Socket_SauvegarderEnregistrement.wl`

**Lignes problématiques (4-5)** :
```wl
LogSocket("[SAUVE] Version client=" + DateHeureVersChaîne(dhVersionClient))
```

**Problème** :
- Cette ligne tente de convertir `dhVersionClient` en chaîne **sans vérifier s'il est valide**
- Pour une **nouvelle ligne**, `dhVersionClient` est vide (année zéro)
- `DateHeureVersChaîne` ne peut pas convertir une date invalide

**Autres occurrences du même problème** :

**Ligne 18-19** :
```wl
LogSocket("[SAUVE] Version en base=" + DateHeureVersChaîne(FEN_Principale.TABLE_Prod_TL21.COL_Version))
```

**Lignes 24-28** :
```wl
LogSocket("[SAUVE] Version client : " + DateHeureVersChaîne(dhVersionClient))
LogSocket("[SAUVE] Version base : " + DateHeureVersChaîne(FEN_Principale.TABLE_Prod_TL21.COL_Version))
```

---

## 🎯 Solutions Proposées

### Solution 1 : Vérifier si la DateHeure est Valide (Recommandé)

Créer une fonction utilitaire pour convertir une DateHeure en chaîne de manière sécurisée.

**Code** :
```wl
procédure DateHeureVersChaîneSafe(dhDate est une DateHeure) : chaîne
// Convertit une DateHeure en chaîne, retourne "Non définie" si vide
si dhDate = "" OU Année(dhDate) = 0 alors
	retour "Non définie"
sinon
	retour DateHeureVersChaîne(dhDate)
fin
```

**Utilisation** :
```wl
LogSocket("[SAUVE] Version client=" + DateHeureVersChaîneSafe(dhVersionClient))
```

**Avantages** :
- ✅ Gère tous les cas (date vide, année zéro, date valide)
- ✅ Réutilisable partout dans le code
- ✅ Logs clairs ("Non définie" au lieu d'une erreur)

---

### Solution 2 : Vérifier Avant Chaque Conversion

Vérifier manuellement avant chaque appel à `DateHeureVersChaîne`.

**Code** :
```wl
si dhVersionClient <> "" ET Année(dhVersionClient) > 0 alors
	LogSocket("[SAUVE] Version client=" + DateHeureVersChaîne(dhVersionClient))
sinon
	LogSocket("[SAUVE] Version client=Non définie (nouvelle ligne)")
fin
```

**Avantages** :
- ✅ Contrôle précis sur chaque log
- ✅ Messages personnalisés

**Inconvénients** :
- ❌ Code répétitif
- ❌ Risque d'oubli dans d'autres endroits

---

### Solution 3 : Initialiser la Version à la Création de Ligne

Initialiser le champ `Version` avec `DateHeureSys()` dès la création de la ligne.

**Code** (à ajouter dans le code d'ajout de ligne) :
```wl
// Après TableAjoutLigne ou équivalent
FEN_Principale.TABLE_Prod_TL21.COL_Version = DateHeureSys()
```

**Avantages** :
- ✅ Évite le problème à la source
- ✅ Cohérent avec la logique métier (chaque ligne a une version)

**Inconvénients** :
- ❌ Ne résout pas le problème si la ligne existe déjà sans version
- ❌ Nécessite de modifier le code d'ajout de ligne

---

## 🎯 Recommandation Finale

**Appliquer les Solutions 1 + 3** :

1. **Solution 1** : Créer la fonction `DateHeureVersChaîneSafe` et l'utiliser partout
2. **Solution 3** : Initialiser `Version` à `DateHeureSys()` lors de l'ajout de ligne

**Pourquoi ?**
- Solution 1 rend le code robuste contre toutes les dates invalides
- Solution 3 évite le problème à la source pour les nouvelles lignes
- Combinées, elles garantissent qu'aucune erreur ne se produira

---

## 📊 Impact de la Correction

### Avant

| Situation | Comportement |
|-----------|--------------|
| Ajout de ligne | ❌ Erreur 80123 à la sortie de colonne |
| Log de version vide | ❌ Plantage de l'application |
| Robustesse | ❌ Faible |

### Après

| Situation | Comportement |
|-----------|--------------|
| Ajout de ligne | ✅ Fonctionne sans erreur |
| Log de version vide | ✅ Affiche "Non définie" |
| Robustesse | ✅ Élevée |

---

## 🔍 Autres Endroits à Vérifier

Rechercher tous les appels à `DateHeureVersChaîne` dans le code pour s'assurer qu'ils sont sécurisés :

1. **Socket_SauvegarderEnregistrement** : Lignes 5, 19, 24, 27
2. **Autres procédures** : À vérifier avec une recherche globale

**Commande de recherche dans WinDev** :
```
Rechercher : DateHeureVersChaîne
Portée : Projet entier
```

---

## 🧪 Tests Recommandés

### Test 1 : Ajout de Ligne Normale

**Scénario** : Ajouter une nouvelle ligne et la remplir

**Procédure** :
1. Cliquer sur le bouton "Ajouter une ligne"
2. Remplir les colonnes (Client, Affaire, etc.)
3. Sortir de la dernière colonne (Tab ou clic ailleurs)

**Résultat attendu** :
- ✅ Pas d'erreur 80123
- ✅ La ligne est sauvegardée
- ✅ Les logs affichent "Version client=Non définie" ou la date initiale

---

### Test 2 : Modification de Ligne Existante

**Scénario** : Modifier une ligne existante avec une version valide

**Procédure** :
1. Double-cliquer sur une ligne existante
2. Modifier une colonne
3. Sortir de la colonne

**Résultat attendu** :
- ✅ Pas d'erreur
- ✅ Les logs affichent la version correcte
- ✅ La sauvegarde fonctionne normalement

---

### Test 3 : Conflit de Version

**Scénario** : Deux utilisateurs modifient la même ligne

**Procédure** :
1. Utilisateur A commence à éditer la ligne 1
2. Utilisateur B modifie et sauvegarde la ligne 1
3. Utilisateur A termine sa modification

**Résultat attendu** :
- ✅ Conflit détecté
- ✅ Message d'avertissement affiché
- ✅ Pas d'erreur 80123 même si les versions sont comparées

---

## 📝 Fichiers à Modifier

1. **Socket_SauvegarderEnregistrement.wl** : Ajouter la fonction `DateHeureVersChaîneSafe` et l'utiliser
2. **Code d'ajout de ligne** (à identifier) : Initialiser `Version` à `DateHeureSys()`
3. **Autres fichiers** : Remplacer tous les `DateHeureVersChaîne` non sécurisés

---

**Cette analyse identifie clairement la cause et propose des solutions robustes pour résoudre l'erreur 80123.**
