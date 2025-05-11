# Flutter Article App

A Flutter app that fetches and displays a list of articles from a public API.

## Features
- List of articles
- Search functionality
- Detail view
- Favorites system
- Responsive UI
- Modern and user-friendly interface

## Setup Instructions
1. Clone the repo:
```bash
git clone <your-repo-link>
cd flutter_article_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Tech Stack
- Flutter SDK: 3.x
- State Management: GetX
- HTTP Client: Dio
- Persistence: Shared Preferences
- Navigation: GetX Named Routes

## Project Structure
```
lib/
├── controller/
│   └── article_controller.dart
├── models/
│   └── article_model.dart
├── views/
│   ├── home_view.dart
│   ├── article_detail_view.dart
│   └── favourites_view.dart
├── widgets/
│   └── article_card.dart
└── main.dart
```

## Features in Detail
- **Article List**: Displays a list of articles fetched from JSONPlaceholder API
- **Search**: Real-time search functionality for articles
- **Favorites**: Save and manage favorite articles
- **Detail View**: View full article content with favorite toggle
- **Responsive Design**: Works on both mobile and tablet devices
