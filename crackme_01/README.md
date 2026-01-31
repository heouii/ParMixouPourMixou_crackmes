# Crackme 01

## Niveau : Facile

### Description

Ce crackme est un programme écrit en assembleur x86 (32 bits) pour Linux.
Il lit un mot de passe depuis l’entrée standard et vérifie sa validité.

Le mot de passe attendu fait **exactement 16 caractères**.
Aucun mot de passe n’est stocké en clair dans le binaire.

Chaque caractère saisi est transformé par une opération arithmétique simple
avant d’être comparé à une valeur interne.


### Fonctionnement

- Le programme lit l’entrée utilisateur depuis `stdin`
- Chaque caractère est traité de manière indépendante
- Une transformation **(+1)** est appliquée à chaque octet
- Les valeurs transformées sont comparées en boucle
- Si une seule comparaison échoue, l’accès est refusé

Le programme accepte soit :
- un caractère de fin de ligne (`\\n`)
- soit une fin de chaîne (`\\0`)
après les 16 caractères du mot de passe.

### Contraintes techniques

- Architecture : x86 (32 bits)
- Système : Linux
- Langage : assembleur NASM

### Utilisation

```bash
$ echo "PASSWORD" | ./crackme01
