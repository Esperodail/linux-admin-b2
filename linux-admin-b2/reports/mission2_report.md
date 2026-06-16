# Rapport Mission 2 – Gestion des utilisateurs & groupes

**Auteur :** Prénom NOM  
**Date :** YYYY-MM-DD  
**Distribution :** (ex: Ubuntu 22.04 LTS)

---

## 1. Exécution du script

```bash
sudo ./scripts/create_users.sh
```

**Sortie :**

```
[ Coller ici la sortie réelle du terminal ]
```

---

## 2. Vérification des comptes créés

```bash
id alice
```

```
[ sortie réelle ]
```

```bash
id bob
```

```
[ sortie réelle ]
```

```bash
id charlie
```

```
[ sortie réelle ]
```

---

## 3. Vérification des groupes

```bash
cat /etc/group | grep -E 'devteam|ops'
```

```
[ sortie réelle ]
```

---

## 4. Vérification du répertoire projet

```bash
ls -ld /opt/devproject/
```

```
[ sortie réelle ]
```

---

## 5. Analyse : comportement en cas de double exécution

<!-- Expliquer ici ce qui se passe si le script est lancé une deuxième fois.
     Comment avez-vous géré l'idempotence (useradd qui plante si le user existe déjà) ?
     Quelle commande / condition avez-vous utilisée ? -->

[ Votre explication ici ]
