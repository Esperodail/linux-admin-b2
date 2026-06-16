# Devoir – Administration Linux B2

> **Promotion 2025/2026 · Journée d'évaluation en distanciel**

---

## 📋 Consignes générales

| | |
|---|---|
| **Durée** | Journée complète — 8h00 → 17h15 |
| **Format** | Travail **individuel**, en distanciel |
| **Rendu** | Dépôt GitHub **public**, lien soumis avant **17h00** |
| **Barème** | 100 points + 10 bonus |
| **Documentation** | Autorisée (`man`, docs officielles en ligne) |

> ⚠️ Toute communication entre étudiants entraîne la note **0**.  
> ⚠️ Les commits doivent être créés **aujourd'hui** — tout commit antérieur invalide le rendu.

---

## 🗂️ Structure de votre dépôt

Nommez votre dépôt exactement ainsi : `linux-admin-b2-<prenom>-<nom>`  
*(exemple : `linux-admin-b2-alice-dupont`)*

Votre dépôt doit respecter cette arborescence :

```
linux-admin-b2-prenom-nom/
├── README.md                   ← Ce fichier, adapté avec vos infos
├── scripts/
│   ├── create_users.sh         ← Mission 2
│   ├── setup_project.sh        ← Mission 3
│   ├── logwatcher.sh           ← Mission 4
│   └── harden_ssh.sh           ← Mission 5
├── configs/
│   └── logwatcher.service      ← Mission 4
└── reports/
    ├── mission2_report.md
    ├── mission3_report.md
    ├── mission4_report.md
    └── mission5_report.md
```

---

## 📝 Votre README.md (à compléter)

Remplacez ce fichier README par le vôtre, contenant :

- Votre nom, prénom, niveau, date
- Un résumé d'une phrase par mission
- Les prérequis pour exécuter vos scripts (distribution Linux, version…)
- Un tableau de statut :

| Mission | Description | Statut | Points estimés |
|---|---|---|---|
| M1 | Mise en place du dépôt GitHub | ✅ / ⚠️ / ❌ | /10 |
| M2 | Gestion des utilisateurs & groupes | ✅ / ⚠️ / ❌ | /20 |
| M3 | Système de fichiers & permissions | ✅ / ⚠️ / ❌ | /20 |
| M4 | Service systemd custom | ✅ / ⚠️ / ❌ | /20 |
| M5 | Sécurisation SSH & pare-feu | ✅ / ⚠️ / ❌ | /20 |
| Bonus | (optionnel) | ✅ / ⚠️ / ❌ | /10 |

---

## 🚀 Démarrage rapide

```bash
# 1. Créer votre dépôt sur github.com (public, sans template)
# 2. Cloner et initialiser localement
git clone https://github.com/<votre-login>/linux-admin-b2-prenom-nom.git
cd linux-admin-b2-prenom-nom

# 3. Créer la structure de dossiers
mkdir -p scripts configs reports

# 4. Premier commit
git add .
git commit -m "chore: structure initiale du dépôt"
git push origin main
```

---

## 📦 Missions

| Mission | Fichiers à produire | Points |
|---|---|---|
| [M1 – GitHub](#mission-1--mise-en-place-du-dépôt-github) | `README.md`, structure dossiers, commits | 10 |
| [M2 – Utilisateurs](#mission-2--gestion-des-utilisateurs--groupes) | `scripts/create_users.sh`, `reports/mission2_report.md` | 20 |
| [M3 – Permissions](#mission-3--système-de-fichiers--permissions) | `scripts/setup_project.sh`, `reports/mission3_report.md` | 20 |
| [M4 – Systemd](#mission-4--service-systemd-custom) | `scripts/logwatcher.sh`, `configs/logwatcher.service`, `reports/mission4_report.md` | 20 |
| [M5 – Sécurité](#mission-5--sécurisation-ssh--pare-feu) | `scripts/harden_ssh.sh`, `reports/mission5_report.md` | 20 |
| [Bonus](#bonus) | `reports/bonus_report.md` | +10 |

---

## Mission 1 – Mise en place du dépôt GitHub

**[10 pts · ~45 min]**

- Créer le dépôt public nommé `linux-admin-b2-<prenom>-<nom>`
- Créer la structure de dossiers conforme (voir ci-dessus)
- Rédiger le `README.md` avec tableau de statut
- Effectuer **au moins 5 commits** distincts sur la journée, avec des messages clairs

**Convention de messages de commit recommandée :**

```
feat(m2): script create_users avec useradd et gestion idempotence
docs(m2): rapport mission 2 avec captures de vérification
feat(m4): fichier unit logwatcher.service
fix(m5): correction sed pour PermitRootLogin dans harden_ssh
```

---

## Mission 2 – Gestion des utilisateurs & groupes

**[20 pts · ~1h30]**

### Script `scripts/create_users.sh`

Ce script doit, **sans intervention manuelle** :

1. Créer les groupes `devteam` (GID 3001) et `ops` (GID 3002)
2. Créer trois utilisateurs avec home et shell bash :
   - `alice` — UID 2001, groupe primaire `devteam`
   - `bob` — UID 2002, groupe primaire `devteam`
   - `charlie` — UID 2003, groupe primaire `ops`
3. Ajouter `alice` au groupe `ops` (secondaire)
4. Définir un mot de passe temporaire pour chacun
5. Forcer le changement de mot de passe à la première connexion
6. Créer `/opt/devproject/` — propriétaire `root:devteam`, permissions `770`
7. Afficher un récapitulatif final

**Exigences du script :**

- En-tête commenté (auteur, date, description, usage)
- Vérification que le script est lancé en `root`
- Variables pour noms, UIDs, GIDs (pas de valeurs hardcodées partout)
- Gestion des erreurs : si un utilisateur existe déjà, le script ne plante pas
- Chaque section commentée

### Rapport `reports/mission2_report.md`

Doit contenir les sorties réelles de :

- Exécution du script
- `id alice`, `id bob`, `id charlie`
- `cat /etc/group | grep -E 'devteam|ops'`
- `ls -ld /opt/devproject/`
- Explication : que se passe-t-il si le script est lancé deux fois ?

---

## Mission 3 – Système de fichiers & permissions

**[20 pts · ~1h30]**

*Cette mission s'appuie sur les comptes créés en Mission 2.*

### Script `scripts/setup_project.sh`

Ce script doit :

1. Créer `/srv/devproject/` avec sous-dossiers `src/`, `docs/`, `releases/`, `logs/`
2. Permissions :
   - `src/` et `docs/` → `770`, propriétaire `root:devteam`
   - `releases/` → `750`, propriétaire `root:devteam`
   - `logs/` → `700`, propriétaire `root`
3. Bit **sticky** sur `src/` et `docs/`
4. Bit **SGID** sur `src/` et `docs/`
5. ACL : donner à `charlie` un accès en lecture (`r-x`) sur `docs/` via `setfacl`
6. Créer des fichiers de test dans chaque dossier
7. Afficher un récapitulatif (`ls -laR` + `getfacl`)

### Rapport `reports/mission3_report.md`

Doit contenir :

- Sortie de `ls -laR /srv/devproject/`
- Sortie de `getfacl /srv/devproject/docs/`
- Test en tant qu'`alice` : créer un fichier dans `src/` (sortie incluse)
- Test en tant que `charlie` : lire un fichier dans `docs/` (sortie incluse)
- Explication du SGID dans un contexte collaboratif (5 à 10 lignes)

---

## Mission 4 – Service systemd custom

**[20 pts · ~1h30]**

### Script `scripts/logwatcher.sh`

Boucle infinie (toutes les 30 secondes) qui :

1. Détecte les tentatives SSH échouées dans `/var/log/auth.log`
2. Compte les nouvelles tentatives depuis le dernier cycle
3. Écrit dans journald : `[LOGWATCHER] XX tentative(s) — HH:MM:SS`
4. Si > 5 tentatives : message d'alerte `[LOGWATCHER][ALERTE] Pic suspect : XX`
5. Écrit dans `/var/log/logwatcher/activity.log` (créer le dossier si absent)

### Fichier `configs/logwatcher.service`

Fichier unit systemd respectant les bonnes pratiques :

- `[Unit]` : description, `After=network.target syslog.target`
- `[Service]` : `Type=simple`, `Restart=on-failure`, `RestartSec=10s`, `StandardOutput=journal`, `SyslogIdentifier=logwatcher`
- `[Install]` : `WantedBy=multi-user.target`

### Déploiement

```bash
sudo cp configs/logwatcher.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now logwatcher
sudo systemctl status logwatcher
```

### Rapport `reports/mission4_report.md`

Doit contenir :

- Fichier unit complet (bloc de code)
- Sortie de `systemctl status logwatcher`
- Sortie de `journalctl -u logwatcher --no-pager -n 20`
- Sortie de `cat /var/log/logwatcher/activity.log`
- Explication : différence `Type=simple` vs `Type=forking`
- Explication : que fait `Restart=on-failure` ?

---

## Mission 5 – Sécurisation SSH & pare-feu

**[20 pts · ~1h30]**

> 🔴 **À faire EN DERNIER.** Ayez toujours deux sessions SSH ouvertes simultanément.

### Script `scripts/harden_ssh.sh`

Ce script doit :

1. Vérifier qu'il est lancé en `root`
2. Sauvegarder `/etc/ssh/sshd_config` → `/etc/ssh/sshd_config.bak.YYYYMMDD`
3. Appliquer dans `sshd_config` :
   - `PermitRootLogin no`
   - `PasswordAuthentication no`
   - `PubkeyAuthentication yes`
   - `MaxAuthTries 3`
   - `LoginGraceTime 20`
   - `ClientAliveInterval 300`
   - `ClientAliveCountMax 2`
   - `X11Forwarding no`
4. Valider avec `sshd -t` — si erreur : **restaurer automatiquement** la sauvegarde
5. Afficher un `diff` entre ancienne et nouvelle config
6. **Ne pas redémarrer sshd automatiquement** — afficher un message demandant à l'opérateur de le faire

### Configuration UFW

À réaliser manuellement (documenter chaque commande dans le rapport) :

1. Politique : `deny incoming`, `allow outgoing`
2. Autoriser SSH (port 22 ou celui configuré)
3. Autoriser HTTP (80) et HTTPS (443)
4. Bloquer la plage `192.0.2.0/24`

### Rapport `reports/mission5_report.md`

Doit contenir :

- Diff entre `sshd_config.bak` et `sshd_config`
- Sortie de `sshd -t` (validation syntaxe)
- Sortie de `sudo ufw status verbose`
- Test de connexion SSH (commande + résultat)
- Explication : pourquoi `PasswordAuthentication no` est-il critique ? (5 lignes min.)
- Réflexion : quelles autres mesures de durcissement en production ?

---

## Bonus

**[+10 pts — choisir UNE option]**

### Option A – Timer systemd

Transformer `logwatcher.sh` en timer systemd (`logwatcher.timer` + service oneshot). Déclenché toutes les 5 minutes. Documenter dans `reports/bonus_report.md`.

### Option B – ACL avancées

Mettre en place des ACL par défaut (`setfacl -d`) sur `src/` et `docs/` pour héritage automatique. Démontrer avec création de fichiers. Documenter dans `reports/bonus_report.md`.

### Option C – Durcissement SSH étendu

Ajouter : `AllowUsers`, banner de connexion, configuration Fail2Ban pour SSH. Documenter dans `reports/bonus_report.md`.

---

## ✅ Checklist avant soumission

Avant de soumettre votre lien, vérifiez :

- [ ] Dépôt GitHub **public** (vérifier en navigation privée)
- [ ] `README.md` adapté avec vos informations et tableau de statut
- [ ] `scripts/create_users.sh` — commenté, root-check, idempotent
- [ ] `scripts/setup_project.sh` — SGID, sticky bit, ACL présents
- [ ] `scripts/logwatcher.sh` — boucle infinie, journald, fichier log
- [ ] `configs/logwatcher.service` — fichier unit valide
- [ ] `scripts/harden_ssh.sh` — sauvegarde auto, `sshd -t`, pas de restart auto
- [ ] 4 rapports Markdown avec **sorties réelles** (pas de placeholders)
- [ ] Au moins **5 commits** avec messages clairs
- [ ] Lien soumis **avant 17h00**

```bash
# Vérifications finales
git log --oneline
git status
git push origin main
```

---

*Devoir Administration Linux B2 · Promotion 2025/2026*
