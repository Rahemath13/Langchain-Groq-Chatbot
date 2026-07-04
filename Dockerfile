# Use lightweight Python image
FROM python:3.11-slim

# Prevent Python from creating .pyc files
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install curl
RUN apt-get update && apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*        

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Add uv to PATH
ENV PATH="/root/.local/bin:$PATH"

# Working directory
WORKDIR /app

# Copy dependency files first (better Docker layer caching)
COPY pyproject.toml uv.lock ./

# Install dependencies (no dev dependencies in production)
RUN uv sync --frozen --no-dev

# Copy project
COPY . .

# ✅ Don't hardcode PORT — Heroku injects it dynamically
# Keep 8501 only as local fallback
ENV PORT=8501

EXPOSE 8501

# ✅ FIXED: Shell form (not exec/array form) so $PORT expands correctly
CMD uv run streamlit run chatbot/app.py \
    --server.address=0.0.0.0 \
    --server.port=$PORT \
    --server.headless=true