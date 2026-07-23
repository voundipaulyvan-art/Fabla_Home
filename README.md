# Fabla Home

Application mobile de livraison de colis, pensée pour le marché camerounais (Douala). Développée avec **Flutter**.

> *"Votre colis, notre mission."*

## À propos

Fabla Home est une plateforme de livraison connectant clients, livreurs et administrateurs. L'application permet de créer une demande de livraison, suivre son colis en temps réel, consulter son historique, gérer ses paiements et noter les livraisons effectuées.

## Fonctionnalités

- **Onboarding** : Splash screen animé, écran de bienvenue, inscription et connexion
- **Espace client** :
  - Accueil avec recherche de livraison
  - Création d'une nouvelle livraison
  - Suivi de colis en temps réel
  - Historique des livraisons (filtrable par statut : en cours, livré, annulé)
  - Gestion des paiements
  - Profil utilisateur
  - Évaluations et avis
- **Espace livreur** : Dashboard dédié pour la gestion des livraisons assignées
- **Espace administrateur** : Vue d'ensemble avec KPIs, graphiques de livraisons et de revenus

## Design

- Palette de couleurs : bleu marine profond (`#1A1A2E`) et orange (`#F97316`)
- Composants réutilisables : boutons personnalisés, badges de statut
- Interface conçue à partir d'une maquette Figma dédiée

## Stack technique

| Élément | Détail |
|---|---|
| Framework | Flutter / Dart |
| UI | Material Design personnalisé |
| Architecture | Écrans organisés par fonctionnalité |

## Structure du projet

```
lib/
├── main.dart                          # Point d'entrée, thème, routes
├── core/
│   ├── theme/app_colors.dart          # Palette de couleurs de l'app
│   └── constants/app_routes.dart      # Constantes de routes
├── widgets/
│   ├── app_button.dart                # Bouton réutilisable
│   └── status_badge.dart              # Badge de statut de livraison
├── screens/
│   ├── splash/
│   ├── welcome/
│   ├── auth/                          # Connexion / Inscription
│   ├── home/                          # Accueil client
│   ├── payment/
│   ├── driver/                        # Dashboard livreur
│   ├── delivery/                      # Création de livraison
│   ├── tracking/                      # Suivi temps réel
│   ├── history/                       # Historique des livraisons
│   └── ratings/                       # Évaluations
└── models/
    └── delivery.dart                  # Modèles de données
```

## Installation et lancement

### Prérequis
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installé et ajouté au PATH
- Un navigateur (Chrome/Edge) pour un test rapide en web, ou un appareil/émulateur Android

### Étapes

```bash
# Cloner le projet
git clone <url-du-repo>
cd fabla_home

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

Si les dossiers de plateforme (web, windows, android...) sont absents, générez-les avec :

```bash
flutter create .
```

## Tests

```bash
flutter test
```

## État du projet

Projet réalisé dans un cadre pédagogique / personnel, à des fins d'apprentissage du développement mobile front-end avec Flutter. Le back-end et les intégrations réelles (paiement Mobile Money, tracking GPS, authentification) ne sont pas encore implémentés — les données affichées sont actuellement simulées (mock data).

## Pistes d'évolution

- [ ] Connexion à une API back-end réelle
- [ ] Intégration du paiement Mobile Money
- [ ] Tracking GPS en temps réel
- [ ] Authentification sécurisée
- [ ] Notifications push

## Auteur

Projet développé par **Paul Yvan** dans le cadre de son parcours en développement mobile.
