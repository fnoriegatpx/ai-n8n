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

Edit `.env` and add your variables.
---

### 3️⃣ Set Up Permissions

```bash
mkdir -p {N8N_USER_FOLDER}
sudo chown -R 1000:1000 {N8N_USER_FOLDER}
sudo chmod -R 700 {N8N_USER_FOLDER}
```
---

## ▶️ Run

### Local
```bash
docker compose up
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
