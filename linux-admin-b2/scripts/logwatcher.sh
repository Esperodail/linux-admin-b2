#!/bin/bash
# ============================================================
# Script  : logwatcher.sh
# Auteur  : Prénom NOM
# Date    : YYYY-MM-DD
# Desc    : Surveillance des tentatives de connexion SSH
# Usage   : Lancé par le service systemd logwatcher.service
# ============================================================

# === Variables ===============================================
AUTH_LOG="/var/log/auth.log"    # adapter si /var/log/secure (RHEL)
LOG_DIR="/var/log/logwatcher"
LOG_FILE="$LOG_DIR/activity.log"
INTERVAL=30                      # secondes entre chaque cycle
SEUIL=5                          # seuil d'alerte


# === Initialisation ==========================================
# TODO : créer LOG_DIR si absent (mkdir -p)

# Compteur de base (nombre de lignes au démarrage)
LAST_COUNT=0


# === Boucle principale =======================================
while true; do

    TIMESTAMP=$(date '+%H:%M:%S')
    DATE=$(date '+%Y-%m-%d %H:%M:%S')

    # TODO : compter le total de tentatives échouées dans AUTH_LOG
    #        (chercher "Failed password" ou "Invalid user")
    #        Stocker dans TOTAL
    TOTAL=0

    # TODO : calculer le nombre de NOUVELLES tentatives depuis le cycle précédent
    #        (TOTAL - LAST_COUNT)
    NOUVELLES=0

    # Mettre à jour le compteur de référence
    LAST_COUNT=$TOTAL

    # TODO : écrire dans journald (via logger ou stderr) :
    #        "[LOGWATCHER] XX tentative(s) SSH échouée(s) — HH:MM:SS"


    # TODO : si NOUVELLES > SEUIL, écrire un message d'alerte dans journald


    # TODO : écrire dans LOG_FILE :
    #        "$DATE | Nouvelles: XX | Total: XX"


    sleep $INTERVAL

done
