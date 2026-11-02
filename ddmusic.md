# DDMusic — Design Experience (DX) Complète

> Référence exhaustive de l'expérience design / UX de **Music Player & MP3 — DDMusic**
> Sources : Google Play, App Store, AppGoblin, AppCompare, MWM (analyse UX + 6 captures officielles), AppLoko, Unstore (alternatives/lacunes), lawnicons (activité splash).
>
> **Note importante** : deux apps distinctes portent le nom DDMusic :
> - **Android** : Hitchhike Tech, package `musicplayer.playmusic.audioplayer`, Flutter, ~100 M+ installs, v2.12.0 (16/10/2026).
> - **iOS** : TIN THIEN AN TECHNOLOGY SERVICE (TTA Technology Service), id6740784053, v1.0.5, 29,8 MB, lecture cloud multi-appareils, abonnement hebdo $4,99.
> Elles ne partagent pas le même éditeur ni la même base technique. Ce document couvre principalement l'Android (Flutter), avec les spécificités iOS signalées.

---

## 1. Identité & Positionnement

| Attribut | Détail |
|---|---|
| Nom affiché | Music Player & MP3 — DDMusic |
| Éditeur Android | Hitchhike Tech (Hong Kong) |
| Éditeur iOS | TIN THIEN AN TECHNOLOGY SERVICE TRADING COMPANY LIMITED |
| Catégorie | Music & Audio |
| Type | Lecteur **offline** de fichiers audio locaux (Android) ; lecteur cloud offline + import (iOS) |
| Cible | Audiophiles / collection personnelle locale |
| Slogan store | "Play music with this powerful offline music player for android" |
| Positionnement | UI simple, propre, élégante ("clean, clean, and stylish") ; égaliseur intégré ; tous formats |
| Splash Activity | `musicplayer.playmusic.audioplayer.ui.splash.SplashActivity` |
| Framework Android | **Flutter** (SDK détecté par AppGoblin) |
| Plateformes | Android 7.0+ (API 24) ; iOS 15.6+ |
| Taille | ~40,5 Mo (Android v2.12.0) ; ~29,8 Mo (iOS) |
| Installations | ~100 M+ (Android), 1 k+ (iOS) |
| Notes | 4,66 ★ / 1,6 M avis (Android) ; 5,0 / 5 (3 avis, iOS) |
| MAU / revenus | ~29 M MAU ; ~$1 M/mois (58 % IAP / 42 % pub) |
| Dernière MAJ Android | v2.12.0 — 16/10/2026 |
| Dernière MAJ iOS | v1.0.5 — 18/11/2025 |

---

## 2. Identité Visuelle

### 2.1 Icône d'application
- Symbole : **note de musique blanche** centrée
- Fond : **mesh gradient vibrant** rose / orange / bleu
- Style : moderne, saturé, reconnaissable

### 2.2 Thèmes
- **Light** et **Dark** (sélection manuelle)
- Couleurs dynamiques **Material You** (dérivées de l'artwork de l'album)
- Personnalisation des thèmes / fonds / couleurs d'accent
- iOS : thèmes personnalisés derrière achat intégré (selon Unstore)

### 2.3 Typographie & Formes
- UI Material 3 (coins arrondis, elevation douce)
- Miniatures d'album **48 dp arrondies**
- Avatars artistes circulaires avec initiales
- Grilles responsives (2 colonnes portrait / 4 colonnes paysage)

### 2.4 Couleurs & ambiance
- Fond sombre profond (mode nuit)
- Artwork d'album en header avec **blur parallax**
- Extraction de la **couleur dominante** pour écrans artiste/album
- Fonds gradient sur cartes genre

---

## 3. Navigation & Architecture d'Information

### 3.1 Bottom Navigation Bar (5 onglets)
1. **Home** — accueil, récap mensuel, playlists auto
2. **Library** — bibliothèque (sous-onglets)
3. **Search** — recherche globale
4. **Stats** — statistiques d'écoute
5. **Settings** — réglages

> Mini-player persistant positionné **au-dessus** de la bottom nav. Le Now Playing s'étend par **swipe up** ou tap sur la mini-player.

### 3.2 Top Tab Bar (Library)
Onglets horizontaux scrollables :
- **Songs · Albums · Artists · Playlists · Folders · Genres**

### 3.3 Visibilité de la nav
- **Visible** : Home, Library, Search, Stats, Settings
- **Masquée** : Now Playing détaillé, détail album/artiste/playlist, file de lecture, lyrics plein écran, égaliseur, sleep timer

### 3.4 Transitions
- Shared element transitions (artwork → player)
- Bottom sheets : Lyrics, Equalizer, Sleep Timer (ou plein écran selon contexte)
- Parallax blur sur headers d'album

---

## 4. Inventaire des Écrans (captures officielles MWM + store)

| # | Écran | Légende UX (MWM) | Contenu attendu |
|---|---|---|---|
| 1 | Bibliothèque Musicale Unifiée | Barre de recherche intuitive pour titres + navigation simplifiée via barre d'onglets inférieure | Accueil/bibliothèque centralisée, recherche, bottom nav |
| 2 | Playlists Personnalisées | Boutons **"Play"** et **"Shuffle"** distincts, contrôle immédiat | Lecture directe d'une playlist |
| 3 | Expérience d'Écoute Premium | Lecture immersive, contrôles précis de progression + **curseur de volume ajustable** | Now Playing avec seek bar + volume |
| 4 | Recherche Rapide Efficace | Barre de recherche réactive + résultats filtrés affichés clairement | Search avec filtres |
| 5 | Maîtrise des Playlists | Créer de nouvelles playlists, organiser sélections, afficher **nb titres + durée totale** | Gestion/édition playlist |
| 6 | Importation Polyvalente Simplifiée | Import depuis **iCloud, Dropbox, transfert WiFi direct** | (iOS) Import cloud / WiFi |

### 4.1 Splash
- Écran de démarrage animé (logo DDMusic)

### 4.2 Home
- Playlists automatiques mises en avant : **Recently Played, Most Played, Featured**
- Accès rapide aux favoris
- Sections horizontales de cartes
- FAB / création playlist

### 4.3 Library — Songs
- Barre de recherche en haut, filtrage temps réel
- Tri : A-Z, Z-A, Recently Added, Most Played, Duration, File Size
- Sidebar alphabétique (scroll rapide)
- Item chanson : artwork 48 dp arrondi, titre gras, artiste+album (secondaire), durée à droite, cœur (favori), indicateur now-playing (barres animées)
- Long press → menu : Play Next, Add to Queue, Add to Playlist, Go to Album, Go to Artist, Share, Info, Set as Ringtone, Delete from Device

### 4.4 Library — Albums
- Grille responsive 2/4 colonnes
- Carte : artwork, titre, artiste, nb pistes, année
- Détail : header artwork large blur parallax, infos (artiste, année, pistes, durée, genre), liste pistes, Play All / Shuffle, ajout playlist

### 4.5 Library — Artists
- Liste alphabétique ; avatar circulaire initiales, nom, nb albums/chansons
- Détail : header couleur dominante, grille albums, liste chansons, Play All / Shuffle All

### 4.6 Library — Playlists
- Grille cartes (collage 4 artworks, nom, nb chansons, durée totale)
- FAB "Create New Playlist"
- Playlists IA (icône sparkle)
- Détail : Play All, Shuffle, Edit, Delete, liste + drag handle (réorder), swipe gauche (retirer), Add more songs

### 4.7 Library — Folders
- Arborescence dossier ; icône dossier, chemin, nb chansons

### 4.8 Library — Genres
- Grille cartes genre (fonds gradient), tags ID3

### 4.9 Search
- Recherche globale : chansons, albums, artistes, genres, playlists
- Suggestions temps réel

### 4.10 Stats — Monthly Music Recap
- Temps d'écoute mensuel, jours actifs, habitudes quotidiennes (graphiques)
- Top Listens : chansons, artistes, albums
- Achievements / badges

### 4.11 Now Playing (Lecteur Complet)
- Artwork grand format centré, fond flouté dérivé
- Titre + artiste + album
- Barre de progression (seek) temps écoulé/restant
- Contrôles : Previous, Play/Pause, Next
- Modes : Shuffle, Repeat (off/all/one)
- Boutons : Favorite (cœur), Queue, Lyrics, Equalizer, Sleep timer, Speed, Share
- Curseur de volume ajustable
- Mini-player persistant (artwork, titre/artiste, play/pause, next)
- Expansion swipe up / tap
- Notification, lock screen, widgets, Bluetooth

### 4.12 Settings
- Thèmes Light/Dark/custom
- Égaliseur, scan, filtres durée/taille
- Backup/restore playlists, sleep timer, widgets/notifications, tag editor, ringtone

---

## 5. Égaliseur Audio

- **10 bandes** de fréquence
- Presets : Classical, Folk, Jazz, Rock, Pop, Normal, Hip-Hop, Dance…
- Bass Boost
- Reverb (plusieurs types)
- Music Virtualizer
- Application en un clic + réglage manuel fin
- (iOS) Presets avancés et thèmes derrière IAP (selon Unstore)

---

## 6. Paroles (Lyrics)

- Paroles intégrées (tags) + fichiers LRC synchronisés
- Affichage synchronisé (karaoké), défilement auto
- Accès depuis Now Playing (bottom sheet ou plein écran)

---

## 7. Playlists & Favoris

- Création/édition/suppression playlists
- Ajout/retrait (swipe), réorder (drag handle)
- Playlists auto : Featured, Most Played, Recently Played
- Favoris (cœur) liste dédiée
- Import/Export (backup & restore)
- Collage 4 artworks sur carte playlist
- Playlists IA (sparkle)

---

## 8. Gestion de Bibliothèque

- Scan profond + auto-refresh
- Filtres : durée et taille fichier
- Organisation : chansons, albums, artistes, dossiers, genres, playlists
- Recherche rapide multi-critères
- Hide & favorite songs
- Tag editor : nom, album, artiste, pochette
- Ringtone setting
- Suppression depuis l'appareil

---

## 9. Sleep Timer & Lecture

- Sleep timer durée personnalisable + fade out
- Lecture arrière-plan, lock screen, Bluetooth/casque filaire
- Shuffle, loop, repeat, speed control, fade in/out
- Contrôles notification / widgets / lock screen

---

## 10. Widgets & Notifications

- Widgets écran d'accueil
- Centre de notifications
- Lock screen + commandes Bluetooth

---

## 11. Personnalisation (Thèmes)

- Light / Dark / custom
- Couleurs dynamiques Material You
- Fonds / couleurs d'accent
- Animations fluides

---

## 12. Composants UI Récurrents

- Mini-player persistant
- Bottom sheets : Lyrics, Equalizer, Sleep Timer
- FAB : Create playlist
- Cards : album, playlist (collage 4), genre (gradient)
- List items : chanson (thumbnail 48dp + titre bold + artiste/album + durée + cœur + now-playing bars)
- Avatar circulaire artiste (initiales)
- Grilles responsive
- Sidebar alphabétique
- Chips filtre/tri
- Sparkle icon (playlists IA)

---

## 13. Micro-interactions & Feedback

- Now-playing indicator : barres animées sur l'item actif
- Heart fill/unfill
- Swipe retirer playlist
- Drag handle réorder
- Long press menu contextuel riche
- Shared element artwork
- Parallax blur headers
- Fade out sleep timer

---

## 14. Stack Technique (détectée Android — AppGoblin)

- **Framework** : Flutter
- **Ad networks** : Google, Facebook, InMobi, ByteDance
- **Médiation** : AdMob
- **Analytics produit** : Firebase
- **Attribution** : Adjust
- **Business** : Volcengine
- **Dev tools** : Google, Square, Airbnb Engineering
- Récap : 11 dev tools, 6 ad networks, 1 médiation, 1 analytics, 1 attribution, 1 business tool

---

## 15. Monétisation

- Gratuit + publicités (bannières + interstitiels, AdMob médiation)
- IAP Android : $1,99–$11,99 / item
- Abonnement iOS : $4,99/semaine, essai 3 jours, renouvellement auto
- Fonctions avancées (EQ presets, thèmes, dossiers) derrière IAP (selon Unstore)

---

## 16. Performance & Compatibilité

- Testé sur des milliers d'appareils
- Lecture arrière-plan heures durant
- Formats : MP3, WAV, FLAC, AAC, 3GP, OGG, M4A
- Deep scan & auto refresh
- Grandes bibliothèques

---

## 17. Points forts UX (à retenir pour Moodify)

1. Bottom nav 5 onglets + mini-player persistant au-dessus
2. Library 6 sous-onglets (Songs/Albums/Artists/Playlists/Folders/Genres)
3. Tri riche + sidebar alphabétique
4. Indicateur now-playing animé sur items
5. Long-press menu contextuel complet
6. Détail album/artiste : header blur parallax + couleur dominante
7. Playlists : collage 4 artworks + drag reorder + swipe remove
8. Monthly recap : charts + achievements
9. Égaliseur 10 bandes + presets + bass boost + reverb + virtualizer
10. Paroles synchronisées (karaoké)
11. Sleep timer avec fade out
12. Tag editor + ringtone setting
13. Backup/restore playlists
14. Widgets + notifications + lock screen
15. Thèmes Light/Dark + couleurs dynamiques Material You
16. Boutons Play et Shuffle distincts sur playlist (contrôle immédiat)
17. Curseur de volume ajustable en lecture

---

## 18. Lacunes & Limites (ce qui manque / ce qui n'est pas connu)

### 18.1 Lacunes fonctionnelles identifiées (Unstore / reviews)
- **Absence d'EQ paramétrique**, pas de Replay Gain, pas de lecture **gapless** (FLAC)
- Sortie audio système générique (pas de DSP propre)
- Publicités pop-up et bannières dans l'interface lecteur (version gratuite)
- Fonctions essentielles derrière IAP : EQ presets avancés, thèmes personnalisés, outils gestion dossiers
- Pas de streaming / découverte en ligne (offline uniquement sur Android)
- Pas de sync cloud multi-appareils sur Android (présent sur iOS uniquement)
- Historique de permissions excessives sur certaines anciennes versions (confiance utilisateur)

### 18.2 Données non disponibles / non vérifiables
- Valeurs de couleur hex précises (palette non documentée publiquement)
- Typographie exacte (pas de charte typo publique)
- Nombre et nom exacts des 5 onglets bottom nav (inféré, non confirmé visuellement)
- Détails du layout equalizer (curves, Q, gain par bande)
- Comportement précis des mini-player / bottom sheets (durées d'animation, easing)
- Captures d'écran : non lisibles visuellement (modèle texte uniquement) — légende MWM utilisée comme source
- Tablette / mode paysage non documenté
- Accessibilité (TalkBack, contraste, tailles de police adaptatives) non documentée

### 18.3 Ambiguïtés éditeur
- Deux apps "DDMusic" distinctes (Android Hitchhike Tech vs iOS TTA Technology Service) — ne pas confondre les fonctionnalités cloud (iOS uniquement) avec l'Android offline pur.

---

## 19. Synthèse pour Moodify

À intégrer comme référence de design : bottom nav 5 onglets, library 6 sous-onglets, mini-player persistant, now-playing avec seek + volume, playlists collage/drag/swipe, monthly recap avec charts, égaliseur 10 bandes, paroles LRC, sleep timer fade out, tag editor, widgets/lock screen, thèmes Light/Dark + Material You. À éviter : pubs intrusives, fonctions essentielles payantes, absence de gapless/replay gain.

*Document compilé à partir de sources publiques. Aucune capture d'écran n'a pu être analysée visuellement ; les descriptions d'écrans reposent sur les légendes officielles MWM et les fiches store.*
