# Movie Dex 🎥 – Flutter Movie & Cinema Ticket App

A Flutter app for browsing movies and buying cinema tickets. Users sign in with Firebase, browse **Trending**, **Top Rated** and **Popular** movies pulled live from [The Movie Database (TMDB)](https://developer.themoviedb.org/docs), search for a film, buy tickets for Singapore cinema chains, and find a cinema on Google Maps with a route from their current location.

Built for the CPMAD module (Module Group L1) at Nanyang Polytechnic.

## Features

- **Accounts:** sign up, sign in and log out with Firebase Authentication (email and password).
- **Browse movies:** horizontal carousels of trending, top-rated and popular movies from TMDB.
- **Search:** look up any movie by title.
- **Movie details:** banner, poster, overview, rating and release date, with a **Buy Ticket** button.
- **Tickets and cart:** ticket types for Shaw Theatres, Golden Village and Cathay Cineplexes (adult, student and senior prices). You can add them to a cart with a live badge count, change quantities, see the running total and check out.
- **Find Cinema:** cinema list stored in Cloud Firestore (name, address, latitude, longitude).
- **Map:** Google Maps view of the chosen cinema with a polyline from the user's current location.
- **Profile:** view and edit your first and last name.
- **About Us:** app description with tap-to-call and tap-to-email buttons.
- Navigation through a side drawer; state is managed with GetX.

## Tech stack

| Area | Packages |
|------|----------|
| Framework | Flutter / Dart (SDK `>=2.7.0 <3.0.0`, pre-null-safety) |
| State management | [`get`](https://pub.dev/packages/get) (GetX controllers for cart, drawer and user) |
| Backend | `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage` |
| Movie data | [`tmdb_api`](https://pub.dev/packages/tmdb_api), `http` |
| Maps & location | `google_maps_flutter`, `location`, `flutter_polyline_points`, `google_maps_utils` |
| UI | `google_fonts`, `getwidget`, `badges`, `fluttertoast` |
| Other | `url_launcher`, `shared_preferences`, `image_picker` |

## Project structure

```
lib/
├── main.dart                     # Firebase init, GetX setup, screen switching
├── description.dart              # Movie detail page
├── style.dart                    # Shared text styles
├── controllers/
│   ├── CartController.dart       # Cart items, quantities, total price
│   ├── DrawerController.dart     # Current screen index
│   └── UserController.dart       # Signed-in user's profile
├── model/                        # Cinema, User
├── screen/
│   ├── login.dart, registration.dart
│   ├── home.dart                 # TMDB fetch + search + carousels
│   ├── trending.dart, toprated.dart, popular.dart
│   ├── ticket.dart, detail.dart, cart.dart, checkout.dart
│   ├── showcinema.dart, map.dart # Cinema list + Google Map route
│   ├── profile.dart, editprofile.dart
│   ├── aboutus.dart
│   └── drawer.dart               # Side navigation
├── services/
│   ├── firebaseauth_service.dart
│   └── firestore_service.dart
├── utility/                      # Dialog + text helpers
└── just to add Cinema/           # Helper screens used to seed cinema data
images/                           # Ticket images, GIFs, buttons
```

## Getting started

This project targets an older, pre-null-safety Flutter SDK (Flutter 1.22 / 2.x era). Use a matching Flutter version (for example via [FVM](https://fvm.app/)) or migrate the code first.

1. Create a Firebase project, enable **Email/Password** sign-in and **Cloud Firestore**, and place your own `google-services.json` in `android/app/`.
2. Add a `cinema` collection in Firestore with documents containing `name`, `address`, `latitude` and `longitude`.
3. Get a TMDB API key and read-access token, and a Google Maps Android API key (see the note below on where to put them).
4. Run:
   ```bash
   flutter pub get
   flutter run
   ```

## Configuration note

In this version the TMDB credentials are written directly in `lib/screen/home.dart`, and the Google Maps key is in `android/app/src/debug/AndroidManifest.xml`. For your own build, supply your own keys and keep them out of source control, for example with `--dart-define` and a git-ignored `local.properties` / manifest placeholder.

## Author

Valerie Tan Wan Xin – Nanyang Polytechnic, Module Group L1
