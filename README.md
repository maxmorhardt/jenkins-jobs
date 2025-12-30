# Jenkins Jobs

![Jenkins](https://img.shields.io/badge/jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=black)
![Docker](https://img.shields.io/badge/docker-257bd6?style=for-the-badge&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

## Overview
This repo contains various Jenkins jobs. Each folder within the repository contains a Jenkinsfile and any associated files required for that given job.

## Jobs

### buildpack/
Builds and validates the Jenkins buildpack Docker image used as the default build environment.

**Features:**
- Builds multi-platform (linux/arm64) Docker image
- Deploys test pod to Kubernetes
- Validates installed tools: Go, Node, NPM, Java, Maven, kubectl, Helm, Chromium, ChromeDriver, Git, Curl, Unzip
- Automatically tears down after validation
- Publishes image to Docker registry with version tag and latest

**Triggers:** Manual

---

### k8s-apply-manifest/
Applies Kubernetes manifests from a specified repository and path.

**Triggers:** Manual

---

### k8s-create-secret/
Creates or updates Kubernetes secrets.

**Triggers:** Manual

---

### k8s-delete-resource/
Deletes specified Kubernetes resources.

**Triggers:** Manual

---

### k8s-helm-uninstall/
Uninstalls Helm releases from Kubernetes clusters.

**Triggers:** Manual

---

### postgres-backup/
Automated periodic backup of PostgreSQL database.

**Features:**
- Runs every 12 hours via cron trigger
- Creates timestamped SQL dumps using `pg_dumpall`
- Archives backups with fingerprinting
- Keeps last 30 backups
- **Only runs on main branch**

**Triggers:** Cron (`0 */12 * * *`) - main branch only

---

### postgres-migration/
Performs PostgreSQL major version migrations with automatic backup and restore.

**Features:**
- **Dry run mode**: Non-main branches only create backups (no destructive operations)
- **Main branch**: Full migration with confirmation required
- Creates timestamped backup before migration
- Uninstalls legacy PostgreSQL instance
- Deletes old persistent volumes and data
- Deploys new PostgreSQL version via Helm
- Restores database from backup
- Archives backup artifacts

**Triggers:** Manual

**Parameters:**
- `HELM_VERSION`: PostgreSQL Helm chart version (default: 0.0.1)
- `CONFIRM_MIGRATION`: Must be checked to proceed with migration on main branch

---

## Types of Jobs
- One time scripts
- Cron jobs
- Data collection/cleanup
- Global jobs not specific to a single application

CI-CD jobs for a given app should have their Jenkinsfile be in their respective repo.