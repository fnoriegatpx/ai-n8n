# 🧠 n8n Instance (Dockerized)

A lightweight **n8n Community Edition** setup using **Docker** and **Docker Compose**, built for both local development and production.

---

## 🚀 Overview

Single setup for all environments — controlled entirely through `.env`.

**Includes:**
- `docker-compose.yml` (unified)
- `.env.example` configuration
- Data persistence via volume
- Permission setup for host folders

---

## ⚙️ Setup

### 1️⃣ Install Docker & Compose

```bash
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

---

### 2️⃣ Clone and Configure

```bash
git clone git@github.com:<username>/ai-n8n.git
cd ai-n8n
cp .env.example .env
```

Edit `.env` as needed:

```bash
# Environment
NODE_ENV=development
N8N_PORT=5678

# Data storage (local or prod)
N8N_USER_FOLDER=./data

# Auth (enable for production)
N8N_BASIC_AUTH_ACTIVE=false
N8N_BASIC_AUTH_USER=
N8N_BASIC_AUTH_PASSWORD=
```

---

### 3️⃣ Set Up Permissions

Local:
```bash
mkdir -p ./data
sudo chown -R 1000:1000 ./data
sudo chmod -R 700 ./data
```

Production:
```bash
sudo mkdir -p /var/opt/n8n
sudo chown -R 1000:1000 /var/opt/n8n
sudo chmod -R 700 /var/opt/n8n
```

---

## ▶️ Run

### Local
```bash
docker compose up -d
```
Visit → [http://localhost:5678](http://localhost:5678)

### Production
```bash
NODE_ENV=production docker compose up -d
```

---

## 🧰 Common Commands

| Command | Description |
|----------|-------------|
| `docker compose ps` | Show running containers |
| `docker compose logs -f` | Tail logs |
| `docker compose down` | Stop & remove |
| `docker exec -it n8n bash` | Open a shell in the container |

---

**Author:** Your Name  
Based on [n8n.io](https://n8n.io)
