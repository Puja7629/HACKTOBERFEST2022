import streamlit as st
import pandas as pd
import numpy as np


df = pd.read_csv("/home/chaitanyadubal/Downloads/FLASK/my_streamlit_pub/data/pub.csv")


st.markdown('<h1>Pub\'s 🍺 in given area</h1>', unsafe_allow_html=True)


local = df.local_authority.unique()
st.sidebar.markdown("Choose the Area")
option = st.sidebar.selectbox('',local)


'You have Selected : ' ,option



btn_clk = st.button('Search')
if btn_clk==True:
    res = df[df['local_authority']==option]
    res=res[['latitude','longitude']]
    st.success('Following is the list of some best Pubs ')
    st.map(res)