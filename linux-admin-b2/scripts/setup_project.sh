#!/bin/bash
# ============================================================
# Script  : setup_project.sh
# Auteur  : Prénom NOM
# Date    : YYYY-MM-DD
# Desc    : Mise en place de l'espace de travail partagé
# Usage   : sudo ./scripts/setup_project.sh
# Note    : Exécuter après create_users.sh
# ============================================================

# === Vérification root =======================================
# TODO : vérifier root, exit 1 sinon



# === Variables ===============================================
BASE_DIR="/srv/devproject"
GROUPE_DEV="devteam"


# === Création de l'arborescence ==============================
# TODO : créer BASE_DIR et ses sous-dossiers :
#        src/, docs/, releases/, logs/



# === Propriétaires et permissions ============================
# TODO :
#   src/      → root:devteam, 770
#   docs/     → root:devteam, 770
#   releases/ → root:devteam, 750
#   logs/     → root:root,    700



# === Bits spéciaux ===========================================
# TODO : poser le sticky bit sur src/ et docs/
# TODO : poser le SGID sur src/ et docs/



# === ACL pour charlie ========================================
# TODO : donner à charlie un accès en lecture (r-x) sur docs/
#        via setfacl (sans modifier les permissions POSIX)



# === Fichiers de test ========================================
# TODO : créer un fichier de test dans chaque sous-dossier



# === Récapitulatif ===========================================
echo ""
echo "============================================================"
echo " Récapitulatif de l'arborescence"
echo "============================================================"
# TODO : afficher ls -laR $BASE_DIR et getfacl $BASE_DIR/docs/
