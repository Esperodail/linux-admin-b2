#!/bin/bash
# ============================================================
# Script  : create_users.sh
# Auteur  : Prénom NOM
# Date    : YYYY-MM-DD
# Desc    : Création automatisée des comptes équipe dev
# Usage   : sudo ./scripts/create_users.sh
# ============================================================

# === Vérification root =======================================
# TODO : vérifier que le script est lancé en root
#        Afficher un message d'erreur et quitter (exit 1) sinon



# === Variables ===============================================
GROUPE_DEV=""      # nom du groupe développeurs
GID_DEV=           # GID du groupe développeurs
GROUPE_OPS=""      # nom du groupe ops
GID_OPS=           # GID du groupe ops

USER1=""           # premier utilisateur
UID1=              # son UID
USER2=""           # deuxième utilisateur
UID2=
USER3=""           # troisième utilisateur
UID3=

PROJET_DIR=""      # chemin du répertoire projet


# === Création des groupes ====================================
# TODO : créer les deux groupes avec leurs GIDs imposés
#        Gérer le cas où le groupe existe déjà (ne pas planter)



# === Création des utilisateurs ===============================
# TODO : créer les trois utilisateurs avec :
#        - répertoire home (-m)
#        - shell bash (-s /bin/bash)
#        - UID imposé (-u)
#        - groupe primaire imposé (-g)
#        Gérer le cas où l'utilisateur existe déjà



# === Groupes secondaires =====================================
# TODO : ajouter alice au groupe ops sans écraser ses groupes existants



# === Mots de passe temporaires ===============================
# TODO : définir un mot de passe temporaire pour chaque utilisateur
#        Forcer le changement de mot de passe à la première connexion (passwd -e)



# === Répertoire projet =======================================
# TODO : créer /opt/devproject/ avec les bons propriétaires et permissions



# === Récapitulatif ===========================================
echo ""
echo "============================================================"
echo " Récapitulatif de création"
echo "============================================================"
# TODO : afficher id de chaque utilisateur + ls -ld du répertoire
