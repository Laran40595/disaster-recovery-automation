# Disaster Recovery Automation Platform 🚀

A complete DevOps Disaster Recovery Automation project built with Docker, PostgreSQL, Spring Boot, Health Checks, Backup & Restore Automation, and CI/CD practices.

This project demonstrates how to design a resilient application environment with automated database backup, disaster recovery testing, container orchestration, and service monitoring.

---

# 📌 Project Overview

This platform contains:

- Employee REST API (Spring Boot)
- PostgreSQL Database
- Disaster Recovery Dashboard
- Automated Database Backup
- Database Restore Automation
- Docker Health Checks
- Docker Compose Deployment
- Git Version Control

The goal is to simulate a real production disaster recovery workflow.

---

# 🏗️ Architecture

```
                    Users
                      |
                      |
        Disaster Recovery Dashboard
                 Port: 8081
                      |
        +-------------+-------------+
        |                           |
        |                           |
 Employee API              PostgreSQL Database
 Spring Boot               PostgreSQL 16
 Port: 8080                Port: 5432
        |
        |
 Employee Data
```

---

# 🛠️ Technologies Used

## Backend

- Java 21
- Spring Boot
- Spring Data JPA
- Hibernate
- REST API

## Database

- PostgreSQL 16

## Containerization

- Docker
- Docker Compose

## DevOps Tools

- Git
- GitHub
- Linux
- Bash Automation

---

# 📂 Project Structure

```
disaster-recovery-automation/

├── backup/
│   ├── backup.sh
│   ├── restore.sh
│   └── database-backups/
│
├── employee-api/
│
├── dashboard/
│
├── docker-compose.yml
│
└── README.md
```

---

# 🚀 Running the Application

## Clone Repository

```bash
git clone https://github.com/Laran40595/disaster-recovery-automation.git
```

## Enter Project Directory

```bash
cd disaster-recovery-automation
```

## Start Services

```bash
docker compose up -d
```

## Check Running Containers

```bash
docker ps
```

---

# 🔍 Application Testing

## Employee API

Test API:

```bash
curl http://localhost:8080/api/employees
```

Example Response:

```json
[
 {
  "firstName":"Great",
  "lastName":"Mike",
  "email":"great2@example.com",
  "department":"DevOps",
  "id":2
 }
]
```

---

# ❤️ Container Health Monitoring

Services include Docker health checks.

Check service health:

```bash
docker ps
```

Expected result:

```
employee-api          healthy
employee-postgres     healthy
disaster-dashboard    healthy
```

---

# 💾 Database Backup

Create PostgreSQL backup:

```bash
./backup/backup.sh
```

Example output:

```
Starting PostgreSQL backup...

Backup completed successfully

employee_backup_2026-07-24.sql
```

---

# 🔄 Disaster Recovery Restore Test

Restore database from backup:

```bash
./backup/restore.sh backup/database-backups/employee_backup.sql
```

Restart application:

```bash
docker restart employee-api
```

Verify recovery:

```bash
curl http://localhost:8080/api/employees
```

---

# 🧪 Disaster Recovery Simulation

The recovery process was tested by:

1. Creating a database backup
2. Simulating database failure
3. Restoring database from backup
4. Restarting application services
5. Confirming employee records were recovered

Recovery successfully restored application functionality.

---

# 📊 Services & Ports

| Service | Port |
|---------|------|
| Disaster Dashboard | 8081 |
| Employee API | 8080 |
| PostgreSQL Database | 5432 |

---

# 🔐 DevOps Best Practices Implemented

✅ Infrastructure automation  
✅ Containerized deployment  
✅ Database backup automation  
✅ Disaster recovery testing  
✅ Service health monitoring  
✅ Version control with Git  
✅ Production-style Docker Compose architecture  

---

# 👨‍💻 Author

**Great Mike Osagie**

Cloud Engineer | DevOps Engineer

GitHub:

https://github.com/Laran40595

---

# ⭐ Project Status

✅ Completed  
✅ Tested  
✅ Backup & Restore Verified  
✅ Docker Health Checks Working  
✅ GitHub Repository Updated
