# Developer Setup & Run Guide

## Prerequisites
- Flutter SDK (version ^3.13.5 or compatible stable release)
- Android SDK & tools (Android device or emulator running API 21+)
- Git

## 1. Install Dependencies
Run from the project root:
```bash
flutter pub get
```

## 2. Configure Backend Credentials
`lib/core/config.dart` is excluded from Git to prevent leaking credentials. Create your local configuration by copying the example template:
```bash
cp lib/core/config.example.dart lib/core/config.dart
```
Then edit `lib/core/config.dart` and replace the placeholder strings with your project credentials from the Supabase dashboard:
```dart
const String SUPABASE_URL = 'https://your-project.supabase.co';
const String SUPABASE_ANON_KEY = 'your-actual-anon-key';
```

> **Security Note:** Never commit production API keys or service role keys to Git. `config.dart` must always remain in `.gitignore`.

## 3. Run the App in Development
To run on a connected Android device or emulator:
```bash
flutter run
```

## 4. Run Analysis & Tests
Verify code formatting, static analysis, and unit/widget tests:
```bash
flutter analyze
flutter test
```

## 5. Build Release APK
Generate optimized, ABI-specific release APKs:
```bash
flutter build apk --split-per-abi
```
The resulting APKs will be located in `build/app/outputs/flutter-apk/`.
