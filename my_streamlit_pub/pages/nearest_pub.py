import streamlit as st
import pandas as pd
import numpy as np

st.set_page_config(
    page_title="Nearest Pub"
)

df = pd.read_csv("/home/chaitanyadubal/Downloads/FLASK/my_streamlit_pub/data/pub.csv")

st.markdown('<h1>Find the top Pub\'s 🍺 near you </h1>', unsafe_allow_html=True)

lat = st.sidebar.number_input('Your location : latitude')
lon = st.sidebar.number_input('Your location : longitude')
button = st.button("Search")
df_new = df[['latitude', 'longitude']]
new_points = np.array([lat, lon])

 
distances = np.sqrt(np.sum((new_points - df_new)**2, axis = 1))


n = 5
min_indices = np.argpartition(distances,n-1)[:n]
if button:
    st.map(df.iloc[min_indices])
    st.text("The location corresponding to below nearest distances : ")
    st.dataframe(df.iloc[min_indices])