# Plateforme d analyse Airbnb

## Presentation du projet
Plateforme analytique Airbnb permettant d analyser les logements, les hotes, les avis clients et l impact des nuits de pleine lune. Les donnees sont transformees via une pipeline dbt Bronze/Silver/Or et restituees via Streamlit.

## Architecture
GitHub -> dbt -> Bronze -> Silver -> Or -> DuckDB -> Streamlit -> Business Users

## Technologies utilisees
- dbt : transformations des donnees
- DuckDB : moteur analytique
- Streamlit : tableau de bord interactif
- GitHub : versioning et collaboration

## Installation
1. Cloner le depot : git clone https://github.com/bobicmingue-arch/airbnb-analytics-platform.git
2. Installer les dependances : py -3.11 -m pip install dbt-duckdb streamlit pandas
3. Telecharger les donnees dans le dossier data/
4. Lancer dbt : cd airbnb_project puis py -3.11 -c "from dbt.cli.main import cli; cli()" run
5. Lancer Streamlit : streamlit run app.py

## Fonctionnalites
- Analyse des logements par type de chambre et prix moyen
- Analyse des hotes et superhosts
- Analyse des avis clients par sentiment
- Impact des nuits de pleine lune sur les avis clients

## Repartition des taches

### MINGUE KEPSI Bobic
- Mise en place du depot Git et GitHub
- Creation de la couche Bronze (ingestion des donnees brutes)
- Creation de la couche Silver (nettoyage et transformation des donnees)
- Push et gestion des branches GitHub

### ADONI Allika Mireille
- Creation de la couche Or (modeles analytiques avances)
- Jointures SQL complexes pour l impact des nuits de pleine lune
- Tests de qualite des donnees dbt
- Redaction de la documentation README

### TAGNE KAMGHEM Leonel
- Developpement de l application Streamlit
- Creation des visualisations interactives
- Integration de DuckDB avec Streamlit
- Filtres dynamiques et mise en forme du tableau de bord
