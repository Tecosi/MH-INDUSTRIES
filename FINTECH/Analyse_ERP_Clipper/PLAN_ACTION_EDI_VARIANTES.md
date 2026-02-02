# Plan d'Action : Résolution Problème EDI Variantes

**Client** : MH INDUSTRIES - FINTECH  
**Date** : 2 février 2026  
**Consultant** : Manus AI  
**Priorité** : 🔴 CRITIQUE  
**Durée** : 3 semaines  
**ROI** : 2 semaines

---

## 🎯 Objectif

**Éliminer 95% des duplications manuelles de variantes** par l'ADV lors de l'intégration EDI, en configurant le configurateur Clipper pour créer automatiquement les variantes couleur inexistantes.

---

## 📊 Situation Actuelle vs Cible

### Situation Actuelle
- **EDI par jour** : 3-4
- **Lignes par jour** : 600-2000
- **Variantes inexistantes** : 10-15% (90-300 lignes/jour)
- **Temps duplication** : 5 min/variante
- **Temps perdu/jour** : 7-25 heures
- **Coût annuel** : 46 000-165 000 €

### Situation Cible
- **Création automatique** : 95% des variantes
- **Interventions manuelles** : 5-10/jour (couleurs vraiment nouvelles)
- **Temps perdu/jour** : 0,5-1 heure
- **Coût annuel** : 3 300-6 600 €
- **Économie annuelle** : 42 900-158 400 €

---

## 📅 Planning Détaillé (3 Semaines)

### SEMAINE 1 : Audit et Modélisation

#### JOUR 1 (Lundi) : Audit Articles
**Responsable** : ADV + Support Clipper  
**Durée** : 1 jour

**Actions** :
- [ ] Extraire liste complète articles avec variantes couleur
- [ ] Analyser nomenclature actuelle (format références)
- [ ] Lister toutes les couleurs utilisées (historique)
- [ ] Identifier articles les plus fréquents dans EDI
- [ ] Estimer nombre total d'articles concernés

**Livrables** :
- ✅ Liste articles à migrer (Excel) avec :
  - Code article de base
  - Variantes existantes
  - Fréquence dans EDI
  - Priorité migration

**Outils** :
```sql
-- Requête SQL pour extraire articles avec variantes couleur
SELECT 
    SUBSTRING(reference, 1, LOCATE('-', reference)-1) AS code_base,
    SUBSTRING(reference, LOCATE('-', reference)+1) AS code_couleur,
    COUNT(*) AS nb_variantes
FROM articles
WHERE reference LIKE '%-%'
GROUP BY code_base
ORDER BY nb_variantes DESC;
```

---

#### JOUR 2 (Mardi) : Analyse Format EDI
**Responsable** : ADV + IT  
**Durée** : 1 jour

**Actions** :
- [ ] Récupérer exemples EDI des 3-4 clients principaux
- [ ] Analyser structure EDI (format XML, CSV, EDIFACT ?)
- [ ] Identifier champ référence article
- [ ] Identifier format code couleur dans EDI
- [ ] Créer table mapping codes couleur EDI → Clipper

**Livrables** :
- ✅ Tableau mapping EDI → Clipper (Excel)

**Exemple Mapping** :
| Code EDI | Code Clipper | Libellé | Commentaire |
|----------|--------------|---------|-------------|
| R | ROUGE | Rouge | Standard |
| B | BLANC | Blanc | Standard |
| N | NOIR | Noir | Standard |
| BL | BLEU | Bleu | Standard |
| V | VERT | Vert | Standard |
| J | JAUNE | Jaune | Standard |
| G | GRIS | Gris | Standard |
| OR | ORANGE | Orange | Rare |
| VI | VIOLET | Violet | Rare |

---

#### JOUR 3 (Mercredi) : Modélisation Structure
**Responsable** : Support Clipper + Direction FINTECH  
**Durée** : 1 jour

**Actions** :
- [ ] Définir structure article de base + variantes
- [ ] Définir règles nomenclature automatique
- [ ] Définir règles tarification (prix identique ou variable)
- [ ] Définir règles gamme (héritage ou spécifique)
- [ ] Valider modélisation avec Direction

**Livrables** :
- ✅ Document modélisation (PDF) avec :
  - Schéma structure articles
  - Règles nomenclature
  - Règles tarification
  - Règles gamme
  - Exemples concrets

**Exemple Structure** :
```
ARTICLE DE BASE : A12345
├── Dimensions : 100x50x20 mm
├── Poids : 0,5 kg
├── Matière : Acier
├── Gamme : Traitement surface standard
└── Prix de base : 15,00 €

VARIANTES :
├── A12345-NOIR (référence automatique)
├── A12345-BLANC (référence automatique)
├── A12345-ROUGE (référence automatique)
└── ... (créées automatiquement si besoin)
```

---

#### JOUR 4-5 (Jeudi-Vendredi) : Réunion Support Clipper
**Responsable** : Direction FINTECH + Support Clipper  
**Durée** : 0,5 jour (réunion) + 1,5 jour (préparation support)

**Actions** :
- [ ] Présenter problématique à support Clipper
- [ ] Valider faisabilité configurateur + EDI automatique
- [ ] Obtenir retour d'expérience clients similaires
- [ ] Définir approche technique avec support
- [ ] Planifier accompagnement support (CSA)

**Questions Critiques** :
1. Le configurateur peut-il être appelé automatiquement depuis EDI ?
2. Peut-on paramétrer création automatique variante si inexistante ?
3. Le configurateur supporte-t-il l'héritage de données ?
4. Existe-t-il des clients qui ont résolu ce problème ?
5. Quelle est la meilleure structure pour variantes couleur ?

**Livrables** :
- ✅ Compte-rendu réunion support Clipper
- ✅ Validation faisabilité technique
- ✅ Planning accompagnement support

---

### SEMAINE 2 : Configuration et Tests

#### JOUR 6-7 (Lundi-Mardi) : Configuration Configurateur
**Responsable** : Support Clipper + ADV  
**Durée** : 2 jours

**Actions** :
- [ ] Créer 5 articles pilotes (structure base + variantes)
  - [ ] Article 1 : Pièce fréquente (ex: A12345)
  - [ ] Article 2 : Pièce moyenne fréquence
  - [ ] Article 3 : Pièce rare
  - [ ] Article 4 : Pièce complexe (gamme spécifique)
  - [ ] Article 5 : Pièce simple
- [ ] Configurer option COULEUR dans configurateur
- [ ] Définir valeurs possibles (liste 10-15 couleurs)
- [ ] Paramétrer règles nomenclature automatique
- [ ] Paramétrer règles tarification
- [ ] Paramétrer règles gamme
- [ ] Tester création manuelle variantes (10 tests)

**Livrables** :
- ✅ 5 articles pilotes configurés dans Clipper
- ✅ 10 variantes créées manuellement (test)
- ✅ Rapport tests création manuelle

**Tests à Réaliser** :
1. Créer variante NOIR depuis article de base
2. Créer variante BLANC depuis article de base
3. Vérifier héritage dimensions, poids, matière
4. Vérifier héritage gamme de traitement
5. Vérifier nomenclature automatique (format correct)
6. Vérifier tarification (prix identique ou variable)
7. Créer variante couleur inexistante dans liste
8. Vérifier traçabilité (lien entre variantes)
9. Vérifier affichage dans base articles
10. Vérifier utilisation dans commande manuelle

---

#### JOUR 8-9 (Mercredi-Jeudi) : Configuration Scénario Automatique
**Responsable** : Support Clipper + IT  
**Durée** : 2 jours

**Actions** :
- [ ] Créer scénario "Création Automatique Variante Couleur"
- [ ] Paramétrer déclencheur (commande + référence inexistante)
- [ ] Configurer logique :
  - [ ] Extraction code article de base
  - [ ] Extraction code couleur
  - [ ] Recherche article de base
  - [ ] Appel configurateur automatique
  - [ ] Création variante
- [ ] Configurer gestion erreurs :
  - [ ] Article de base inexistant → Alerte ADV
  - [ ] Couleur inconnue → Alerte ADV
  - [ ] Erreur technique → Log + Alerte
- [ ] Tester scénario avec commandes manuelles (20 tests)

**Livrables** :
- ✅ Scénario automatique configuré
- ✅ 20 tests réussis (création automatique variantes)
- ✅ Rapport tests scénario automatique

**Tests à Réaliser** :
1. Commande variante existante → Intégration directe
2. Commande variante inexistante → Création automatique
3. Commande article de base inexistant → Alerte ADV
4. Commande couleur inconnue → Alerte ADV
5. Commande format référence incorrect → Gestion erreur
6. Commande multiple variantes inexistantes → Création multiple
7. Vérifier nomenclature créée (format correct)
8. Vérifier gamme créée (héritage correct)
9. Vérifier prix créé (tarification correcte)
10. Vérifier traçabilité (lien avec article de base)

---

#### JOUR 10 (Vendredi) : Intégration EDI
**Responsable** : Support Clipper + IT + ADV  
**Durée** : 1 jour

**Actions** :
- [ ] Configurer mapping EDI → Clipper (codes couleur)
- [ ] Activer appel scénario depuis intégration EDI
- [ ] Configurer environnement test EDI
- [ ] Récupérer 1 EDI réel (historique)
- [ ] Tester intégration EDI en environnement test
- [ ] Vérifier création automatique variantes
- [ ] Vérifier flux complet (EDI → Commande → OF)
- [ ] Ajuster configuration si nécessaire

**Livrables** :
- ✅ Mapping EDI → Clipper configuré
- ✅ 1 EDI réel testé avec succès
- ✅ Rapport test intégration EDI

**Tests à Réaliser** :
1. Intégrer EDI avec 100% variantes existantes → OK
2. Intégrer EDI avec 50% variantes inexistantes → Création auto
3. Intégrer EDI avec 1 article base inexistant → Alerte ADV
4. Intégrer EDI avec 1 couleur inconnue → Alerte ADV
5. Vérifier temps traitement EDI (< 20 minutes)
6. Vérifier taux de création automatique (> 90%)
7. Vérifier alertes ADV (format, contenu)
8. Vérifier commandes créées (cohérence)
9. Vérifier OF créés (gammes correctes)
10. Vérifier satisfaction ADV (feedback)

---

### SEMAINE 3 : Déploiement et Formation

#### JOUR 11-12 (Lundi-Mardi) : Migration Articles
**Responsable** : IT + Support Clipper  
**Durée** : 2 jours

**Actions** :
- [ ] Préparer script migration (automatisation)
- [ ] Migrer 10 articles pilotes (validation)
- [ ] Migrer 50 articles fréquents (priorité haute)
- [ ] Migrer 100 articles moyens (priorité moyenne)
- [ ] Migrer articles restants (priorité basse)
- [ ] Vérifier cohérence données migrées
- [ ] Tester quelques articles migrés (commandes)

**Livrables** :
- ✅ Base articles migrée (100-500 articles)
- ✅ Rapport migration (nb articles, variantes créées, erreurs)

**Script Migration** :
```sql
-- Exemple script migration (à adapter)
-- 1. Créer articles de base
INSERT INTO articles (reference, libelle, ...)
SELECT DISTINCT 
    SUBSTRING(reference, 1, LOCATE('-', reference)-1) AS reference,
    CONCAT('Article de base ', SUBSTRING(reference, 1, LOCATE('-', reference)-1)) AS libelle,
    ...
FROM articles_old
WHERE reference LIKE '%-%';

-- 2. Créer variantes depuis configurateur
-- (Via API Clipper ou interface)
```

---

#### JOUR 13 (Mercredi) : Formation ADV
**Responsable** : Support Clipper + Direction FINTECH  
**Durée** : 0,5 jour (2 heures formation)

**Programme Formation** :

**09h00-09h30 : Présentation Nouveau Workflow**
- Problème actuel (duplications manuelles)
- Solution configurateur (création automatique)
- Bénéfices attendus (gain temps, réduction erreurs)

**09h30-10h00 : Démonstration Création Automatique**
- Intégration EDI en temps réel
- Création automatique variantes
- Alertes cas particuliers

**10h00-10h30 : Gestion Cas Particuliers**
- Couleur inconnue → Procédure validation
- Article de base inexistant → Procédure création
- Erreur technique → Procédure escalade

**10h30-11h00 : Questions/Réponses**
- Réponses aux questions ADV
- Démonstrations complémentaires
- Distribution documentation

**Livrables** :
- ✅ ADV formée (3-5 personnes)
- ✅ Support formation (PDF)
- ✅ Procédures cas particuliers (PDF)

---

#### JOUR 14 (Jeudi) : Mise en Production
**Responsable** : IT + Support Clipper + ADV  
**Durée** : 1 jour

**Actions** :
- [ ] **08h00** : Activer scénario automatique en production
- [ ] **09h00** : Monitorer premier EDI de la journée
- [ ] **10h00** : Vérifier création automatique variantes
- [ ] **11h00** : Assistance ADV (questions, ajustements)
- [ ] **14h00** : Monitorer deuxième EDI
- [ ] **15h00** : Vérifier taux de création automatique
- [ ] **16h00** : Ajustements mineurs si nécessaire
- [ ] **17h00** : Bilan journée (réunion équipe)

**Livrables** :
- ✅ Solution en production
- ✅ Rapport première journée (taux succès, incidents)

**KPI à Monitorer** :
- Nombre EDI traités
- Nombre lignes totales
- Nombre variantes créées automatiquement
- Nombre alertes ADV
- Temps traitement EDI
- Satisfaction ADV

---

#### JOUR 15 (Vendredi) : Suivi et Optimisation
**Responsable** : Direction FINTECH + Support Clipper  
**Durée** : 1 jour

**Actions** :
- [ ] Analyser EDI de la semaine (J14 + J15)
- [ ] Mesurer taux de création automatique (objectif > 90%)
- [ ] Identifier cas particuliers récurrents
- [ ] Optimiser règles si nécessaire
- [ ] Documenter procédures finales
- [ ] Planifier suivi long terme (1 mois)

**Livrables** :
- ✅ Rapport de déploiement complet
- ✅ KPI semaine 1 (baseline)
- ✅ Procédures finales documentées
- ✅ Planning suivi long terme

**Rapport Déploiement** :
- Situation avant/après
- KPI atteints
- Gains mesurés (temps, erreurs)
- Satisfaction ADV
- Cas particuliers identifiés
- Recommandations optimisation
- Planning suivi

---

## 💰 Budget Détaillé

### Coûts Internes

| Poste | Détail | Coût |
|-------|--------|------|
| **Temps ADV** | 5 jours × 8h × 25 €/h | 1 000 € |
| **Temps IT** | 3 jours × 8h × 40 €/h | 960 € |
| **Temps Direction** | 1 jour × 8h × 60 €/h | 480 € |
| **TOTAL INTERNE** | | **2 440 €** |

### Coûts Externes

| Poste | Détail | Coût |
|-------|--------|------|
| **Support Clipper** | 5 jours × 650 €/jour (CSA) | 3 250 € |
| **TOTAL EXTERNE** | | **3 250 €** |

### Coût Total Projet
**TOTAL** : **5 690 €**

---

## 📊 ROI Détaillé

### Gains Annuels

| Poste | Calcul | Gain Annuel |
|-------|--------|-------------|
| **Temps ADV gagné** | 20 h/jour × 220 jours × 25 €/h | 110 000 € |
| **Réduction erreurs** | 5% × 2000 lignes/jour × 50 € × 220 jours | 22 000 € |
| **TOTAL GAINS** | | **132 000 €/an** |

### Calcul ROI

**Investissement** : 5 690 €  
**Gains annuels** : 132 000 €  
**Retour sur investissement** : 5 690 / 132 000 × 365 jours = **15,7 jours**

**ROI : 2 semaines**

---

## ⚠️ Risques et Mitigation

### Risques Techniques

| Risque | Probabilité | Impact | Mitigation |
|--------|-------------|--------|------------|
| **Configurateur incompatible avec EDI** | FAIBLE | HAUTE | Validation support Clipper semaine 1 |
| **Format EDI non standard** | MOYENNE | HAUTE | Analyse format EDI jour 2 |
| **Volume migration trop important** | MOYENNE | MOYENNE | Priorisation articles + Script automatisation |
| **Bugs Clipper** | FAIBLE | HAUTE | Support Clipper (CSA) + Tests exhaustifs |

### Risques Organisationnels

| Risque | Probabilité | Impact | Mitigation |
|--------|-------------|--------|------------|
| **Résistance ADV** | FAIBLE | MOYENNE | Démonstration gains + Formation |
| **Manque de temps équipe** | MOYENNE | MOYENNE | Planification claire + Priorisation |
| **Perte de connaissance** | FAIBLE | HAUTE | Documentation complète |

---

## 📋 Checklist Validation

### Avant Démarrage (Jour 0)

- [ ] Direction FINTECH valide le projet
- [ ] Budget validé (5 690 €)
- [ ] Planning validé (3 semaines)
- [ ] Équipe projet identifiée (ADV, IT, Direction)
- [ ] Support Clipper contacté et disponible
- [ ] CSA Clipper activé (si nécessaire)

### Fin Semaine 1

- [ ] Liste articles à migrer validée
- [ ] Mapping EDI → Clipper validé
- [ ] Modélisation structure validée
- [ ] Faisabilité technique confirmée par support Clipper
- [ ] Planning accompagnement support défini

### Fin Semaine 2

- [ ] 5 articles pilotes configurés
- [ ] Scénario automatique fonctionnel
- [ ] 1 EDI testé avec succès en environnement test
- [ ] Taux de création automatique > 90% (test)
- [ ] Validation passage en production

### Fin Semaine 3

- [ ] Base articles migrée (100%)
- [ ] ADV formée
- [ ] Solution en production
- [ ] Taux de création automatique > 90% (production)
- [ ] Rapport de déploiement finalisé

---

## 🎯 Critères de Succès

### Critères Quantitatifs

| Critère | Objectif | Mesure |
|---------|----------|--------|
| **Taux création automatique** | > 90% | Nb variantes créées auto / Nb total variantes |
| **Temps traitement EDI** | < 20 min | Temps moyen traitement EDI |
| **Interventions manuelles ADV** | < 10/jour | Nb alertes ADV par jour |
| **Erreurs de duplication** | < 1% | Nb erreurs / Nb variantes créées |
| **Satisfaction ADV** | > 8/10 | Enquête satisfaction |

### Critères Qualitatifs

✅ Flux EDI fluide (pas de blocage)  
✅ ADV satisfaite (fin des tâches répétitives)  
✅ Traçabilité complète (lien entre variantes)  
✅ Évolutivité (ajout nouvelles couleurs facile)  
✅ Documentation complète (procédures claires)

---

## 📞 Contacts Projet

### Équipe FINTECH

| Rôle | Nom | Contact | Responsabilité |
|------|-----|---------|----------------|
| **Chef de projet** | À définir | - | Coordination projet |
| **Responsable ADV** | À définir | - | Validation workflow |
| **Responsable IT** | À définir | - | Configuration technique |
| **Direction** | À définir | - | Validation stratégique |

### Support Clipper

| Rôle | Contact | Disponibilité |
|------|---------|---------------|
| **Support technique** | https://support-clipper.refined.site/ | CSA |
| **Téléphone** | 05 63 53 78 34 | 9h-18h |

---

## 📎 Annexes

### Annexe A : Analyse Problème
Voir fichier : `PROBLEME_CRITIQUE_EDI_VARIANTES.md`

### Annexe B : Solutions Clipper
Voir fichier : `SOLUTIONS_CLIPPER_EDI_VARIANTES.md`

### Annexe C : Cartographie Processus
Voir fichier : `FINTECH/Cartographie_Processus/`

### Annexe D : Plan Intégration ERP Global
Voir fichier : `PLAN_INTEGRATION_ERP_FINTECH_V2.md`

---

**FIN DU PLAN D'ACTION EDI VARIANTES**
