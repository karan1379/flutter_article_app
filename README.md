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

## State Management Explanation
This app uses GetX for state management, which provides a simple yet powerful solution for reactive programming. The `ArticleController` extends `GetxController` and manages the app's state using observable variables (`.obs`). This allows for automatic UI updates when data changes, with minimal boilerplate code. The controller handles data fetching, search functionality, and favorites management, while the views simply observe and react to these state changes.

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

## Known Issues / Limitations
- Currently using a mock API (JSONPlaceholder) - in a production environment, this would need to be replaced with a real API
- No offline support - articles are not cached locally
- No pagination implemented for large article lists
- No user authentication system
- Limited error handling for network failures
- No unit tests or widget tests implemented yet
