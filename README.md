# Flutter Localization Example

This is a simple Flutter project demonstrating how to implement localization in a Flutter application. It supports multiple languages and allows switching between them dynamically.

## Features

- Supports English and Arabic languages.
- Uses JSON files for storing localized strings.
- Implements a localization delegate to load language files.
- Provides an extension method for easier translation in widgets.

## Project Structure

```
flutter_local_example/
│-- lib/
│   ├── main.dart
│   ├── app_localizations.dart
│   ├── home_page.dart
│-- assets/
│   ├── lang/
│       ├── en.json
│       ├── ar.json
│-- pubspec.yaml
```

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/mahmoudAbdelraheem/flutter_local_example.git
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter_local_example
   ```
3. Get the dependencies:
   ```sh
   flutter pub get
   ```
4. Run the project:
   ```sh
   flutter run
   ```

## Localization Implementation Steps

### 1. Define Supported Locales

In `main.dart`, specify the supported locales in the `MaterialApp`:

```dart
supportedLocales: const [
  Locale('en'),
  Locale('ar'),
],
```

### 2. Add Localization Delegates

```dart
localizationsDelegates: const [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
],
```

### 3. Implement Locale Resolution Callback

```dart
localeResolutionCallback: (deviceLocale, supportedLocales) {
  if (deviceLocale != null) {
    for (var locale in supportedLocales) {
      if (locale.languageCode == deviceLocale.languageCode) {
        return deviceLocale;
      }
    }
  }
  return supportedLocales.first;
},
```

### 4. Create JSON Language Files

Inside `assets/lang/`, create `en.json`:

```json
{
  "hello": "Hello",
  "welcome": "Welcome to our app"
}
```

And `ar.json`:

```json
{
  "hello": "مرحبأ!",
  "welcome": "مرحبأ بك في تطبيقنا!"
}
```

### 5. Load Localized Strings

In `app_localizations.dart`, read the JSON files:

```dart
Future<void> loadJsonLanguage() async {
  String jsonString = await rootBundle.loadString('assets/lang/${locale!.languageCode}.json');
  Map<String, dynamic> jsonMap = json.decode(jsonString);
  _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
}
```

### 6. Use Localization in Widgets

In `home_page.dart`, display translated strings:

```dart
Text(
  AppLocalizations.of(context)!.translate('hello'),
  style: const TextStyle(fontSize: 30),
),
```

## Dependencies

Add these dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```

## Contributing

Feel free to contribute by submitting pull requests or opening issues.

## Contact

For any inquiries, reach out to [My Mail](mailto:mahmoud.raheemm@gmail.com).
