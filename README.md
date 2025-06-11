# 🧪 Test Technique Flutter – Création de trois Interfaces Utilisateurs

## 🎯 Objectif

Ce test vise à évaluer la capacité du candidat à :

- Créer des interfaces responsives et esthétiques avec Flutter.
- Suivre une maquette ou une description fonctionnelle.
- Structurer le code proprement (widgets personnalisés, séparation logique).
- Gérer des interactions utilisateur de base (navigation, formulaires, feedback).

---

## 📝 Sujet

### Contexte

Vous devez réaliser une mini-application Flutter nommée **ViewerX**, qui permet d'accéder au trois (3) vues décrites en image par les **svg**.

---

### Fonctionnalités attendues

#### 1. Écran qui permet de scanner une carte bancaire.

- Affichage :
  - Bouton de navigation.
  - Titre et instructions.
  - Module caméra.
  - Instruction supplémentaires.
  - Bouton de **"Flash"**.
  - Bouton pour **"Capturer"**.
  - Bouton pour accéder à la **"Galerie"**.

- Design attendu :
  - Utilisation du plugin `image_picker`, `google_mlkit_object_detection` pour a prise d'image. L'extraction des données est un plus.
  - UI propre, centrée, adaptée à différents formats d’écrans mobile valider pour 280px, 320px, 440px.

#### 2. Écran d'accueil de l'historique

- Affichage : 
  - La première ligne définit Le titre et le bouton de filtre.
  - Les récapitulatifs en recharge, retrait et transfert (Scrollable horizontablement).
  - L'historique du solde dans un chart.
  - L'historique des transactions en liste (3 items max). si click sur une entrée ouvrir le ticket associé **ticket.svg**
  - La barre de menu. (pour les autres menues de la page, renvoyer,
    * Menu Portefeuille, Accueil, Compte -> Page blanche avec un Texte **"Portefeuille/Accueil/Compte vide"**
    * Menu Central -> Naviger vers le document scanner **document-scanner.svg**
    * Menu Historique -> Page courante.

- Design attendu :
  - Utilisation du plugin `fl_chart` pour le chart.
  - UI propre, centrée, adaptée à différents formats d’écrans mobile valider pour 280px, 320px, 440px.

#### 3. Écran du ticket

- Affichage : 
  - Respecter le design du ticket.

- Design attendu :
  - UI propre, centrée, adaptée à différents formats d’écrans mobile valider pour 280px, 320px, 440px.

---

### Contraintes techniques

- Responsivité minimale : l’interface doit s’adapter correctement aux tailles de smartphones ou tablettes.
- Code bien organisé :
  - Fichiers séparés (`/screens`, `/widgets`, etc.)
  - Bonne séparation des données du template dans des services.

---

## ✅ Critères d’évaluation

| Critère                        | Description                                                                 |
|-------------------------------|-----------------------------------------------------------------------------|
| Respect des spécifications     | Fonctionnalités complètes et conformes                                     |
| Qualité du code                | Lisibilité, commentaires, bonne séparation logique des composants          |
| UX/UI                          | Interface claire, bien agencée et responsive                               |
| Gestion d’état                | Approche cohérente pour la gestion et l’affichage des données              |

---

## Comment soumettre.

- Fork de ce dépôt GitHub dans vos repos publique.
- Implémentation du test dans votre fork.
- Envoyer l'URL de **votre repository mis à jour**.

## ⏱️ Durée estimée

**Samedi 14 le Juin** est le delai de soumission.

---

## 🔧 Livrables attendus

- Code source (GitHub)
- Un petit fichier `README.md` contenant :
  - Instructions de build/lancement (`flutter pub get`, etc.)
  - Capture(s) d’écran 

---

## 💡 Bonus (facultatif)

- Dark mode.
- Animation légère à l’enregistrement ou au chargement de la page.

---

Bonne chance ! 🚀
