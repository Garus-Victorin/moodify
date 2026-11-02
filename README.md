# Moodify - Lecteur Musical Android

![Moodify Logo](https://via.placeholder.com/150)

**Un lecteur musical Android moderne, rapide et entièrement hors ligne permettant de gérer, organiser et écouter sa bibliothèque musicale locale.**

## 📱 Fonctionnalités

### 🎵 Lecture musicale
- Lecture de fichiers audio locaux (MP3, FLAC, WAV, AAC, M4A, OGG)
- Contrôles complets (play/pause, suivant/précédent, avance rapide)
- Modes de lecture (normal, aléatoire, répétition)
- Lecture en arrière-plan avec notifications
- Support écran verrouillé et commandes Bluetooth

### 📂 Bibliothèque musicale
- Scanner automatique des fichiers audio
- Organisation par chansons, albums, artistes, dossiers
- Recherche intelligente avec suggestions
- Historique d'écoute et statistiques

### 📋 Playlists & Favoris
- Création et gestion de playlists
- Système de favoris
- Import/export de playlists

### 🎚️ Égaliseur audio
- Réglage des bandes de fréquence
- Presets (Normal, Rock, Pop, Jazz, Classique, Hip-Hop, Dance)
- Effets audio (Bass Boost, Virtualizer, Reverb)

### 📝 Paroles
- Support des paroles intégrées
- Fichiers LRC synchronisés
- Mode karaoké

### 🎨 Personnalisation
- Thèmes (Light, Dark, AMOLED)
- Couleurs dynamiques Material You
- Animations fluides

## 🛠️ Stack technique

- **Framework**: Flutter 3.x
- **Architecture**: Clean Architecture + Feature First
- **Gestion d'état**: Riverpod
- **Navigation**: GoRouter
- **UI**: Material 3
- **Animations**: Flutter Animate
- **Audio**: just_audio + audio_service + audio_session
- **Scanner**: on_audio_query
- **Stockage**: SQLite avec Drift
- **Permissions**: permission_handler

## 📦 Dépendances principales

```yaml
dependencies:
  flutter: sdk: flutter
  just_audio: ^0.9.37
  audio_service: ^0.18.12
  audio_session: ^0.1.21
  on_audio_query: ^2.9.0
  riverpod_annotation: ^2.3.5
  flutter_riverpod: ^2.4.9
  go_router: ^14.0.2
  drift: ^2.15.0
  drift_flutter: ^0.1.0
  flutter_animate: ^4.5.0
  cached_network_image: ^3.3.1
  permission_handler: ^11.3.0
```

## 🚀 Installation

1. Cloner le dépôt
2. Exécuter `flutter pub get`
3. Configurer les permissions Android dans `AndroidManifest.xml`
4. Lancer avec `flutter run`

## 📱 Captures d'écran

| Accueil | Lecteur | Recherche |
|---------|---------|-----------|
| ![Home](https://via.placeholder.com/300) | ![Player](https://via.placeholder.com/300) | ![Search](https://via.placeholder.com/300) |

## 🎯 Objectifs

- Expérience utilisateur premium
- Performances optimisées pour grandes bibliothèques
- Interface moderne et intuitive
- Fonctionnalités complètes de lecteur musical

## 📄 Licence

MIT License

## 🤝 Contribution

Les contributions sont les bienvenues ! Veuillez ouvrir une issue ou une pull request.

---

*Inspiré par les meilleurs lecteurs musicaux Android, avec une identité visuelle propre et une architecture moderne.*
