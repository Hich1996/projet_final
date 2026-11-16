# Portfolio Analytics Engineer - Food Delivery Data Stack

## Contexte du Projet
Ce projet simule le backend analytique d'une application de livraison de repas. L'objectif est de transformer des données brutes en modèles robustes et documentés pour répondre aux enjeux de l'équipe financière et marketing, en appliquant les standards de l'Analytics Engineering.

## Stack Technique
- **Data Warehouse :** Google BigQuery
- **Transformation :** dbt Core
- **Version Control & CI/CD :** Git & GitHub Actions

## Architecture des Données
Le projet respecte une architecture modulaire stricte :
- **Sources (`raw_resto`) :** Déclaration des données brutes.
- **Staging (`stg_`) :** Nettoyage, standardisation et typage des données (ex: `stg_transactions`, `stg_commandes`).
- **Marts (`marts_`) :** Modèles métiers complexes prêts pour l'analyse finale.

## Cas d'Usage Métier Résolus

### 1. Rentabilité des Livreurs
- **Objectif :** Calculer la marge générée par chaque livreur pour piloter les coûts logistiques.
- **Technique :** Agrégations (`GROUP BY ALL`), jointures multiples, et création du modèle `marts_rentabilites_livreurs`.

### 2. Analyse de Rétention (Returning Active Users)
- **Objectif :** Identifier les clients effectuant un achat répété dans une fenêtre de 1 à 7 jours.
- **Technique :** Fonctions de fenêtrage temporelles (`LAG() OVER(PARTITION BY user_id)`) et calculs d'écarts de dates (`DATE_DIFF()`) dans le modèle `marts_returning_users`.

## 🛡 Qualité des Données & DataOps
- **Tests automatisés :** Sécurisation des clés primaires avec les tests natifs dbt (`unique`, `not_null`) via les fichiers `_models.yml`.
- **Intégration Continue (CI/CD) :** Pipeline configuré pour valider automatiquement la compilation du code et l'intégrité des données à chaque nouveau push.