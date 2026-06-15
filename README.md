# Plateforme d analyse Airbnb

## Presentation du projet
Plateforme analytique Airbnb permettant d analyser les logements, les hotes, les avis clients et l impact des nuits de pleine lune. Les donnees sont transformees via une pipeline dbt Bronze/Silver/Or et restituees via Streamlit.

## Technologies utilisees
- dbt : transformations des donnees
- DuckDB : moteur analytique
- Streamlit : tableau de bord interactif
- GitHub : versioning et collaboration

## Installation
1. Cloner le depot : git clone https://github.com/bobicmingue-arch/airbnb-analytics-platform.git
2. Installer les dependances : py -3.11 -m pip install dbt-duckdb streamlit pandas
3. Telecharger les donnees dans le dossier data/
4. Lancer dbt : cd airbnb_project puis py -3.11 -c from dbt.cli.main import cli cli() run
5. Lancer Streamlit : streamlit run app.py

## Fonctionnalites
- Analyse des logements par type et prix
- Analyse des hotes et superhosts
- Analyse des avis par sentiment
- Impact des nuits de pleine lune

## Repartition des taches
- Membre 1 : Bronze, Silver, Tests
- Membre 2 : Or, Streamlit, Documentation
