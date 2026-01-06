# 🟢 Hack Script — Matrix Decode Game

Un **mini-jeu en Bash inspiré de l’univers Matrix**, où tu dois identifier et mémoriser une **séquence flash secrète** tout en évitant que le **niveau de trace** n’atteigne 100 %.

Tout se joue dans le terminal, avec une ambiance *Matrix* : défilement de caractères, flashs, pression croissante et références mythiques.

---

## 🎮 Principe du jeu

- Le jeu comporte **10 niveaux**
- À chaque niveau :
  - Plusieurs mots défilent façon *Matrix decode*
  - **Un seul mot est le mot secret** (flash distinct)
  - Tu dois le mémoriser
- Tu disposes d’un **temps limité** pour le saisir
- Chaque erreur augmente le **TRACE LEVEL**
- À **100 % de trace → FIN DE PARTIE**
- Termine les 10 niveaux pour prendre le **contrôle du mainframe**

---

## 🧠 Fonctionnalités

- Effets visuels Matrix (défilement, flash, couleurs ANSI)
- Difficulté progressive :
  - Temps de réponse réduit
  - Flash plus rapide
  - Pénalité de trace plus élevée
- Système de trace dynamique en temps réel
- Références à l’univers Matrix (Neo, Zion, Architect, Deus Ex Machina…)
- 100 % **Bash**, aucun outil externe requis

---

## 📁 Structure du projet

```
hack-script/
│
├── hack.sh     # Jeu principal
└── README.md   # Documentation
```

---

## 🛠️ Prérequis

- Linux / macOS / Unix
- Terminal compatible ANSI
- Bash (installé par défaut sur la plupart des systèmes)

---

## 📥 Installation

```bash
git clone https://github.com/kiseij660/hack-script.git
cd hack-script
chmod +x hack.sh
```

---

## ▶️ Lancer le jeu

```bash
./hack.sh
```

👉 Recommandé : jouer en **plein écran** pour une immersion optimale.

---

## 🧪 Règles importantes

- La saisie est **insensible à la casse**
- Une mauvaise réponse augmente la trace
- Une bonne réponse la réduit
- À **100 % de trace**, le système t’identifie et coupe le flux

---

## 🏆 Condition de victoire

✔ Compléter les **10 couches réseau**  
✔ Maintenir la trace sous le seuil critique  
✔ Devenir **L’Élu du système**

---

## 🧩 Personnalisation

Le script est facilement modifiable :
- nombre de niveaux
- mots affichés
- vitesses de défilement
- pénalités
- couleurs et messages

Tout est configurable directement dans `hack.sh`.

---

## ⚠️ Avertissement

> Ce projet est **un jeu et une démonstration visuelle**.  
> Il ne réalise **aucune action de hacking réel** et n’a aucun objectif malveillant.

---

## 📜 Licence

Projet libre — utilisation, modification et partage autorisés.

---

🟩 *Wake up, Neo… the Matrix has you.*
