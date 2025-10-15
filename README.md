# 🧠 n8n Instance (Dockerized)

A ready-to-use **n8n Community Edition** setup using **Docker** and **Docker Compose**, designed for both local development and production environments.

---

## 🚀 Overview

This repository contains everything needed to run **n8n**, the workflow automation tool, inside Docker.

It includes:
- A production `docker-compose.yml` (persistent data stored on the host)
- A local development `docker-compose.dev.yml`
- A `.env` configuration file
- A clean Dockerfile using the official n8n image
- Data persistence and separation between environments

---

## 🧱 Project Structure

```
ai-n8n/
├── Dockerfile
├── docker-compose.yml
├── docker-compose.dev.yml
├── .env
├── .gitignore
├── README.md
└── data/                # Local data folder (ignored by Git)
```

---

## ⚙️ Setup

### 1️⃣ Install Docker & Docker Compose

```bash
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Verify installation:
```bash
docker --version
docker compose version
```

---

### 2️⃣ Clone this repository

```bash
git clone git@github.com:<username>/ai-n8n.git
cd ai-n8n
```

---

### 3️⃣ Configure environment variables

Copy `.env` and edit as needed:

```bash
cp .env.example .env
```

Example `.env`:

```env
# --- Authentication ---
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=supersecure123

# --- Host & Port ---
N8N_HOST=localhost
N8N_PORT=5678
WEBHOOK_URL=http://localhost:5678/

# --- Data Folder ---
N8N_USER_FOLDER=/home/node/data

# --- Environment ---
NODE_ENV=production
```

> Note: `N8N_USER_FOLDER` is where n8n stores all workflows, credentials, and configuration inside the container.

---

## 🧩 Data Folders & Permissions

Before running the containers, make sure the host folders exist and have the correct permissions:

### ✅ Production

```bash
sudo mkdir -p /var/opt/n8n
sudo chown -R 1000:1000 /var/opt/n8n
sudo chmod -R 700 /var/opt/n8n
```

Mount in `docker-compose.yml`:

```yaml
volumes:
  - /var/opt/n8n:/home/node/data
```

### ✅ Development Local

```bash
mkdir -p ./data
sudo chown -R 1000:1000 ./data
sudo chmod -R 700 ./data
```

Mount in `docker-compose.dev.yml`:

```yaml
volumes:
  - ./data:/home/node/data
```

---

## 🧩 Usage

### ▶️ Development (local)

```bash
docker compose -f docker-compose.dev.yml up -d --build
```

Access the UI at:
```
http://localhost:5678
```

### 🏭 Production

```bash
docker compose up -d --build
```

Access the instance through your configured host (e.g., `https://n8n.yourdomain.com`).

---

## 🧰 Useful Commands

| Command | Description |
|----------|-------------|
| `docker compose ps` | List running containers |
| `docker compose logs -f` | Stream logs |
| `docker compose down` | Stop and remove containers |
| `docker exec -it n8n bash` | Open a shell inside the container |


## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

**Author:** Your Name  
**Based on:** [n8n.io](https://n8n.io)
