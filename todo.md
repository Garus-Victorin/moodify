# Moodify → DDMusic : Plan d'atteinte du niveau (todo.md)

> Objectif : porter Moodify au niveau fonctionnel et UX de **Music Player & MP3 — DDMusic** (voir `ddmusic.md`).
> Sources : analyse agents (architecture, audio, UI, data, tests) + `ddmusic.md`.

---

## Phase 0 — Build & stabilité (bloquants)

- [ ] Corriger les erreurs Drift : `NativeDatabase` import, `p.join`, schéma colonnes, `Value<int>` vs `int`, `InsertMode.insertOrReplace`.
- [ ] Corriger les providers : `audioServiceProvider` / `musicScannerProvider` accès `.notifier`.
- [ ] Résoudre les conflits d'import `SongModel` (on_audio_query) via `hide`/prefix.
- [ ] Aligner `SongModel`/`AlbumModel`/`ArtistModel` avec le scanner (champs `year`, `sizeBytes`, constructeurs).
- [ ] Remplacer les APIs dépréciées : `ConcatenatingAudioSource` → `setAudioSources`, `withOpacity` → `withValues`.
- [ ] Mettre à jour les tests GoRouter (getters supprimés `initialLocation`, `routes`, `canNavigate`).
- [ ] Régénérer tous les `.g.dart` (drift, riverpod) et commiter.
- [ ] Vérifier `flutter analyze` sans erreurs bloquantes.

## Phase 1 — Audio core (parité DDMusic)

- [ ] Implémenter l'audio en arrière-plan (`audio_service` BackgroundAudioTask, notifications, lock screen, media session).
- [ ] Corriger `AudioPlayerNotifier` : écouter `playbackEventStream` et mettre à jour l'état (playing/paused/buffering/position).
- [ ] Supprimer l'usage déprécié `ConcatenatingAudioSource` → `setAudioSources`.
- [ ] Gestion de file d'attente : add/remove/reorder, persistence, écran "Up Next".
- [ ] Sleep timer avec durée personnalisable + fade out progressif + auto-pause.
- [ ] Contrôle de vitesse de lecture (0.5x–2.0x) + fade in/out.
- [ ] Shuffle / Repeat (off/all/one) fonctionnels et persistants.
- [ ] Curseur de volume ajustable dans le Now Playing.
- [ ] Gapless playback (si possible avec just_audio).
- [ ] Afficher les vraies métadonnées (titre/artiste/album/durée) dans Now Playing et MiniPlayer (pas de valeurs hardcodées).

## Phase 2 — Égaliseur (backend)

- [ ] Connecter les sliders de bandes (60Hz–16kHz) à un moteur audio (android_audio_effects / equalizer).
- [ ] Implémenter les presets (Normal, Rock, Pop, Jazz, Classical, Hip-Hop, Dance) avec application réelle.
- [ ] Bass Boost, Virtualizer, Reverb fonctionnels.
- [ ] Persistance des réglages d'égaliseur (Settings table).
- [ ] Sauvegarde/chargement de presets personnalisés.

## Phase 3 — Paroles (Lyrics)

- [ ] Parser les paroles intégrées (tags ID3) et fichiers LRC synchronisés.
- [ ] Affichage synchronisé avec la lecture (karaoké) + défilement auto.
- [ ] UI lyrics dans Now Playing (toggle, bottom sheet / plein écran).
- [ ] Stockage/mise en cache via table `Lyrics` + repository.
- [ ] Mode karaoké (mise en surbrillance mot par mot si possible).

## Phase 4 — Bibliothèque & métadonnées

- [ ] Extraction et affichage des pochettes d'album (album art) avec cache (cached_network_image / image cache).
- [ ] Images d'artistes (avatars circulaires).
- [ ] Écran détail Album (`/album/:id`) : header blur parallax, infos, liste pistes, Play All / Shuffle.
- [ ] Écran détail Artiste (`/artist/:id`) : couleur dominante, grille albums, toutes chansons, Play All / Shuffle All.
- [ ] Écran détail Dossier (`/folder/:id`).
- [ ] Navigation Genres (grille avec gradients).
- [ ] Filtres : durée et taille des fichiers.
- [ ] Sidebar alphabétique sur l'écran Songs.
- [ ] Tri : A-Z, Z-A, Recently Added, Most Played, Duration, File Size.
- [ ] Smart playlists : Recently Played, Most Played, Featured (auto).
- [ ] Sections Home : récents, favoris, albums (pas de placeholders statiques).
- [ ] Multi-sélection (bulk actions : add to playlist, delete, share).

## Phase 5 — Playlists

- [ ] Écran liste de toutes les playlists (grille avec collage 4 artworks).
- [ ] Création de playlist (FAB + dialog).
- [ ] Édition : renommer, supprimer, partager.
- [ ] Ajout/retrait de chansons (swipe gauche), réordonnancement (drag handle).
- [ ] Play All / Shuffle distincts.
- [ ] Playlists IA marquées (icône sparkle) — optionnel.
- [ ] Persistance via `PlaylistRepository` + `PlaylistSongs` (reorder).
- [ ] Import/export (backup & restore) des playlists.

## Phase 6 — Recherche

- [ ] Recherche multi-catégories : chansons, albums, artistes, genres, playlists.
- [ ] Suggestions temps réel.
- [ ] Historique de recherche.
- [ ] Onglets/filtres dans la recherche.

## Phase 7 — Statistiques (Monthly Music Recap)

- [ ] Table `History` alimentée (playDuration, playedAt).
- [ ] Écran Stats : temps d'écoute mensuel, jours actifs, habitudes quotidiennes (graphiques).
- [ ] Top Listens : top chansons, artistes, albums.
- [ ] Achievements / badges.
- [ ] Navigation par mois.
- [ ] Charts (packages charts).

## Phase 8 — Paramètres & personnalisation

- [ ] Persistance des paramètres (Settings table + `SettingsRepository`).
- [ ] Changement de thème (Light/Dark/AMOLED) effectif et persistant.
- [ ] Couleurs dynamiques Material You depuis l'artwork.
- [ ] Scan & refresh de la bibliothèque.
- [ ] Backup & restore playlists.
- [ ] Widgets écran d'accueil.
- [ ] Contrôles notification / lock screen / Bluetooth.
- [ ] Tag editor (nom, album, artiste, pochette).
- [ ] Ringtone setting.
- [ ] Sleep timer (UI + logique).
- [ ] Gestion de la bibliothèque (hide/favorite).

## Phase 9 — UX / polish / performance

- [ ] Remplacer les `CircularProgressIndicator` par des skeleton loaders.
- [ ] Pagination / virtualisation pour grandes bibliothèques.
- [ ] Cache d'images (album art).
- [ ] Gestion des erreurs utilisateur (messages clairs, retry).
- [ ] Accessibilité : TalkBack, contraste, tailles de police.
- [ ] Haptic feedback sur les contrôles.
- [ ] Animations fluides (flutter_animate) — déjà partiel.
- [ ] Shared element transitions (artwork → player).
- [ ] Supprimer les widgets dupliqués (`BottomNavigation` dans `app_scaffold.dart`).
- [ ] Internationalisation (i18n) — actuellement strings en dur en français.
- [ ] Supprimer les placeholders et mock data.

## Phase 10 — Tests

- [ ] Remplacer les stubs de `song_repository_test.dart` et `local_song_datasource_test.dart` par de vrais tests.
- [ ] Tests d'intégration DB (Drift in-memory).
- [ ] Tests des flux utilisateur (scan → play → favorite → playlist).
- [ ] Tests des permissions (granted/denied/permanent).
- [ ] Tests des services audio (playback, queue, shuffle/repeat).
- [ ] Tests d'accessibilité et de performance.
- [ ] Couverture cible ≥ 70% sur les repositories et services.

## Références

- Design cible : `ddmusic.md` (sections 3 à 19).
- Lacunes connues de DDMusic à éviter : pubs intrusives, fonctions essentielles payantes, absence de gapless/replay gain, pas de sync cloud sur Android.

---

**Ordre recommandé** : Phase 0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 10.
