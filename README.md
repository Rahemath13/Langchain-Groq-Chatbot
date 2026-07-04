# 🤖 LangChain + Groq AI Chatbot

![Python](https://img.shields.io/badge/Python-3.11-blue)
![LangChain](https://img.shields.io/badge/LangChain-AI-green)
![Groq](https://img.shields.io/badge/Groq-LLM-orange)
![Streamlit](https://img.shields.io/badge/Streamlit-UI-red)
![Docker](https://img.shields.io/badge/Docker-Container-blue) ![GitHub
Actions](https://img.shields.io/badge/GitHub_Actions-CI/CD-black)
![Railway](https://img.shields.io/badge/Railway-Deployment-purple)

## 📌 Overview

A production-ready AI chatbot built with **LangChain**, **Groq LLM**,
and **Streamlit**. The application is containerized using Docker,
validated with GitHub Actions, and deployed to Railway through a CI/CD
pipeline.

------------------------------------------------------------------------

## ✨ Features

-   Conversational AI using Groq Llama models
-   LangChain Prompt Templates
-   Streamlit Web Interface
-   Environment Variable Management
-   Docker Containerization
-   GitHub Actions CI
-   Railway Deployment
-   Easy to extend for RAG, memory, tools and agents

------------------------------------------------------------------------

## 🛠 Tech Stack

-   Python 3.11
-   LangChain
-   langchain-groq
-   Streamlit
-   python-dotenv
-   Docker
-   GitHub Actions
-   Railway
-   uv

------------------------------------------------------------------------

## 📁 Project Structure

``` text
Langchain chatbot/
│
├── .github/
│   └── workflows/
│       └── main.yml
├── chatbot/
│   └── app.py
├── .env
├── .gitignore
├── Dockerfile
├── pyproject.toml
├── uv.lock
├── README.md
```

------------------------------------------------------------------------

## ⚙️ Installation

``` bash
git clone <repository-url>
cd "Langchain chatbot"
uv sync
```

------------------------------------------------------------------------

## 🔑 Environment Variables

Create a `.env` file:

``` env
GROQ_API_KEY=your_groq_api_key

# Optional
LANGCHAIN_API_KEY=your_langsmith_key
LANGCHAIN_PROJECT=LangChain-Chatbot
LANGCHAIN_TRACING_V2=true
```

------------------------------------------------------------------------

## ▶️ Run Locally

``` bash
cd chatbot
streamlit run app.py
```

Open:

    http://localhost:8501

------------------------------------------------------------------------

## 🐳 Docker

### Build

``` bash
docker build -t chatbot .
```

### Run

``` bash
docker run -p 8501:8501 chatbot
```

### Stop

``` bash
docker ps
docker stop <container_id>
```

------------------------------------------------------------------------

## ☁️ GitHub

``` bash
git init
git add .
git commit -m "Initial Commit"
git branch -M main
git remote add origin <repository-url>
git push -u origin main
```

------------------------------------------------------------------------

## 🔄 GitHub Actions (CI)

Create:

``` text
.github/workflows/main.yml
```

Example workflow:

``` yaml
name: CI

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - uses: docker/setup-buildx-action@v3

      - name: Build Docker Image
        run: docker build -t chatbot .
```

------------------------------------------------------------------------

## 🚀 Railway Deployment

1.  Create a Railway project.
2.  Connect the GitHub repository.
3.  Add `GROQ_API_KEY` under Variables.
4.  Railway automatically builds and deploys after every push to `main`.

------------------------------------------------------------------------

## 🔁 CI/CD Workflow

``` text
Developer
    │
git push
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
Docker Build
    │
    ▼
Railway Deployment
    │
    ▼
Live Streamlit Application
```

------------------------------------------------------------------------

## 🧪 Troubleshooting

-   Ensure `.env` exists.
-   Verify `GROQ_API_KEY` is valid.
-   Rebuild Docker after code changes:

``` bash
docker build --no-cache -t chatbot .
```

------------------------------------------------------------------------

## 🔮 Future Improvements

-   Chat history
-   Conversation memory
-   RAG
-   Vector database
-   Multi-agent workflow
-   Authentication
-   Logging and monitoring

------------------------------------------------------------------------

## 📄 License

MIT License

------------------------------------------------------------------------

## 👤 Author

**Mohammad Rahemath** - AIML / Generative AI Engineer
