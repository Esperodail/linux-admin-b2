# Rapport Mission 5 – Sécurisation SSH & pare-feu

**Auteur :** Prénom NOM  
**Date :** YYYY-MM-DD  
**Distribution :** (ex: Ubuntu 22.04 LTS)

---

## 1. Exécution du script de durcissement

```bash
sudo ./scripts/harden_ssh.sh
```

**Sortie :**

```
[ Coller ici la sortie réelle du terminal ]
```

---

## 2. Diff – avant / après

```bash
diff /etc/ssh/sshd_config.bak.YYYYMMDD /etc/ssh/sshd_config
```

```
[ sortie réelle du diff ]
```

---

## 3. Validation de la syntaxe

```bash
sudo sshd -t
echo "Code retour : $?"
```

```
[ sortie réelle ]
```

---

## 4. Configuration UFW

Commandes exécutées :

```bash
[ Lister ici chaque commande ufw utilisée ]
```

**État du pare-feu :**

```bash
sudo ufw status verbose
```

```
[ sortie réelle ]
```

---

## 5. Test de connexion SSH

```bash
ssh -i ~/.ssh/id_ed25519 <utilisateur>@<IP>
```

```
[ sortie réelle ou description du résultat ]
```

---

## 6. Analyse : pourquoi PasswordAuthentication no est-il critique ?

<!-- 5 lignes minimum expliquant :
     - ce qu'est une attaque par brute-force SSH
     - pourquoi les mots de passe sont vulnérables même complexes
     - ce qu'apportent les clés SSH en comparaison
     - pourquoi cette directive est plus impactante que PermitRootLogin no seul -->

[ Votre explication ici ]

---

## 7. Réflexion : mesures de durcissement complémentaires en production

<!-- Citer et expliquer brièvement 3 mesures supplémentaires que vous ajouteriez
     sur un vrai serveur en production (Fail2Ban, port knocking, certificats SSH, etc.) -->

[ Votre réflexion ici ]
