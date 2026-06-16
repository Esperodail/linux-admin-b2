# Rapport Mission 4 – Service systemd custom

**Auteur :** Prénom NOM  
**Date :** YYYY-MM-DD  
**Distribution :** (ex: Ubuntu 22.04 LTS)

---

## 1. Fichier unit logwatcher.service

```ini
[ Coller ici le contenu complet de configs/logwatcher.service ]
```

---

## 2. Déploiement et activation

```bash
sudo cp configs/logwatcher.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now logwatcher
```

---

## 3. État du service

```bash
sudo systemctl status logwatcher
```

```
[ sortie réelle ]
```

---

## 4. Logs journald (20 dernières lignes)

```bash
sudo journalctl -u logwatcher --no-pager -n 20
```

```
[ sortie réelle ]
```

---

## 5. Fichier de log activity.log

```bash
cat /var/log/logwatcher/activity.log
```

```
[ sortie réelle – après au moins 2 cycles de 30 secondes ]
```

---

## 6. Explication : Type=simple vs Type=forking

<!-- Expliquer la différence entre ces deux types.
     Pourquoi simple est-il adapté à logwatcher.sh ?
     Dans quel cas utiliserait-on forking ? -->

[ Votre explication ici ]

---

## 7. Explication : Restart=on-failure

<!-- Expliquer ce que fait cette directive.
     Dans quel cas serait-elle insuffisante ? (ex: si le script quitte avec code 0) -->

[ Votre explication ici ]
