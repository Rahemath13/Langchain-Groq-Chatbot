# Use lightweight Python image
FROM python:3.11-slim

# Prevent Python from creating .pyc files
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install curl
RUN apt-get update && apt-get install -y curl

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Add uv to PATH
ENV PATH="/root/.local/bin:$PATH"

# Working directory
WORKDIR /app

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies
RUN uv sync --frozen

# Copy project
COPY . .

# Railway provides PORT dynamically
ENV PORT=8501

EXPOSE 8501

CMD ["uv", "run", "streamlit", "run", "chatbot/app.py", "--server.address=0.0.0.0", "--server.port=8501"]