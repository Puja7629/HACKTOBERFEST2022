import streamlit as st
import pandas as pd
import numpy as np

title = '<h2 style="font-family:sans-serif; font-weight:bold">PUB\'s IN UNITED KINGDOM 🍺</h2>'
st.markdown(title, unsafe_allow_html=True)


st.subheader("Detailed description of the pub\'s")



df = pd.read_csv("/home/chaitanyadubal/Downloads/FLASK/my_streamlit_pub/data/pub.csv")



# Using object notation
information = st.sidebar.selectbox(
    "Statistical Data",
    ('Number of Pub\'s','Data_shape','Display Head', 'Display Tail', 'Unique Area\'s', 'Null-values', 'Description'))

if information=='Number of Pub\'s':
    st.markdown(f'Do you know there are : **{df.shape[0]}**  Pubs  in  **UK**')

elif information == 'Data_shape':
    st.text('Number of rows: {}'.format(df.shape[0]))
    st.text('Number of columns: {}'.format(df.shape[1]))

elif information == 'Head':
    st.dataframe(df.head())

elif information == 'Tail':
    st.dataframe(df.tail())

elif information=='Unique Area\'s':
    st.markdown(f'Total no of unique locations where pubs are present in UK is **{len(df.local_authority.unique())}** ')

elif information == 'Null values':
    st.markdown('**We can see that there are no null values in the data**')
    st.table(df.isna().sum())

elif information == 'Describe':
    st.table(df.describe())