# Rapport Mission 3 – Système de fichiers & permissions

**Auteur :** Prénom NOM  
**Date :** YYYY-MM-DD  
**Distribution :** (ex: Ubuntu 22.04 LTS)

---

## 1. Exécution du script

```bash
sudo ./scripts/setup_project.sh
```

**Sortie :**

```
[ Coller ici la sortie réelle du terminal ]
```

---

## 2. Arborescence après configuration

```bash
ls -laR /srv/devproject/
```

```
[ sortie réelle ]
```

---

## 3. Vérification des ACL

```bash
getfacl /srv/devproject/docs/
```

```
[ sortie réelle ]
```

---

## 4. Test de validation – utilisateur alice

```bash
su - alice -c "touch /srv/devproject/src/test_alice.txt && ls -l /srv/devproject/src/"
```

```
[ sortie réelle ]
```

*Interprétation :*

[ Expliquer pourquoi alice peut/ne peut pas créer ce fichier, quel groupe est attribué au fichier grâce au SGID ]

---

## 5. Test de validation – utilisateur charlie

```bash
su - charlie -c "cat /srv/devproject/docs/ARCHITECTURE.md"
```

```
[ sortie réelle ]
```

*Interprétation :*

[ Expliquer pourquoi charlie peut lire ce fichier grâce à l'ACL sans appartenir au groupe devteam ]

---

## 6. Explication : utilité du bit SGID en contexte collaboratif

<!-- 5 à 10 lignes expliquant :
     - ce que fait le SGID sur un répertoire
     - pourquoi c'est utile quand plusieurs membres d'une équipe partagent un dossier
     - ce qui se passerait sans ce bit -->

[ Votre explication ici ]
