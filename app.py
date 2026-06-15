import streamlit as st
import duckdb
import pandas as pd

st.set_page_config(page_title="Airbnb Analytics", page_icon="🏠", layout="wide")
st.title("🏠 Plateforme d'analyse Airbnb")

DB_PATH = "data/airbnb.duckdb"

@st.cache_data
def load_data(query):
    con = duckdb.connect(DB_PATH, read_only=True)
    df = con.execute(query).df()
    con.close()
    return df

tab1, tab2, tab3, tab4 = st.tabs(["📊 Logements", "👤 Hôtes", "⭐ Avis", "🌕 Pleine Lune"])

with tab1:
    st.header("Analyse des logements")
    df = load_data("SELECT * FROM gold_listings_analysis")
    st.dataframe(df)
    st.bar_chart(df.set_index("room_type")["avg_price"])

with tab2:
    st.header("Analyse des hôtes")
    df = load_data("SELECT * FROM gold_hosts_analysis LIMIT 100")
    st.dataframe(df)
    superhosts = df[df["is_superhost"] == True].shape[0]
    st.metric("Superhosts", superhosts)

with tab3:
    st.header("Analyse des avis")
    df = load_data("SELECT * FROM gold_reviews_analysis")
    st.dataframe(df)
    st.bar_chart(df.set_index("sentiment")["total_reviews"])

with tab4:
    st.header("Impact des nuits de pleine lune")
    df = load_data("SELECT * FROM gold_full_moon_impact")
    st.dataframe(df)
    st.bar_chart(df.set_index("night_type")["positive_rate"])
