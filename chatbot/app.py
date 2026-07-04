import os
import streamlit as st
from dotenv import load_dotenv

from langchain_groq import ChatGroq
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser

load_dotenv()

groq_api_key = os.getenv("GROQ_API_KEY")
## these are used for langsmith for tracking
os.environ["LANGCHAIN_API_KEY"]=os.getenv("LANGCHAIN_API_KEY")
os.environ["LANGCHAIN_TRACING_V2"]="true"
os.environ["LANGCHAIN_PROJECT"]=os.getenv("LANGCHAIN_PROJECT")

## PROMPT TEMPLATE
prompt=ChatPromptTemplate(
    [
        ("system","you are a helpful assistance Please resonse to the user queries"),
        ("user","Question:{question}")
    ]
)

## streamlit framework
st.title("Lanchain GROQ chatbot")
input_text=st.text_input("Search The Topic u want")


#GROQ MODEL LLM
llm=ChatGroq(model="llama-3.3-70b-versatile",
groq_api_key=groq_api_key)
output_parser=StrOutputParser()
chain=prompt|llm|output_parser

if input_text:
    st.write(chain.invoke({'question':input_text}))








