# Milano Coffee Flutter App ☕

This project is a demo Flutter application for Milano Coffee, featuring a login system and showcasing several core functionalities of a coffee shop app. It is designed to work on multiple platforms, including Android, iOS, web, Windows, and Linux.

## Features

- **User Authentication:** Login functionality using phone number and password.
- **Home Page:** Displays banners, product lists, and store information.
- **Order Page:** (In development) Placeholder for ordering coffee and products.
- **Promotion Page:** View current promotions and details.
- **Map Integration:** Find coffee shop locations using integrated maps and geolocation.
- **QR Page:** Scan and use QR codes for shop features.
- **Profile Management:** Update user details and manage account information.
- **Responsive UI:** Built with Flutter for a consistent experience across devices.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart
- Android Studio or VSCode (recommended for development)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/DoanCongPho/Milano_coffee_flutter.git
   cd Milano_coffee_flutter
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. (Optional) Generate data (if using code generation):
   ```bash
   ./gen.sh
   ```

4. Run the app:
   ```bash
   flutter run
   ```
   - Use `flutter run -d chrome` for web.
   - Use `flutter run -d android` for Android, etc.

## Project Structure

- `lib/` - Main source code:
  - `module/` - App modules (home, order, map, promotions, etc.)
  - `cores/` - Core repository and network logic.
  - `widget/` - Common widgets.
  - `model/` - Data models.
- `android/`, `ios/`, `web/`, `windows/`, `linux/` - Platform-specific configuration.
- `assets/` - Images and other static assets.

## Scripts

- `gen.sh`: Helper script to run code generation with build_runner.

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License

This project is for demo and educational purposes.

---

*Made with Flutter and ☕ by DoanCongPho.*