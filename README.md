# Khmer Foodies App 
![UI 2](https://github.com/user-attachments/assets/1c688a52-c38c-483e-aafd-01c8f38b3cb5)
![UI 1 ](https://github.com/user-attachments/assets/bec92128-16b1-40d5-b36e-73a32b7a766f)

## Overview
**Khmer Foodies** is a Flutter application showcasing various Cambodian dishes. The app features a clean UI with a banner, a list of food items loaded from a JSON file, and interactive elements for navigation.

## Features
- **Beautiful UI** with a custom font and styling.
- **Dynamic Food List** loaded from `data.json`.
- **Responsive Design** that adapts to different screen sizes.
- **Navigation Menu** with user and menu icons.
- **Smooth Scrolling** using `ListView` and `SingleChildScrollView`.

## Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-repo/khmer-foodies.git
   cd khmer-foodies
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run the app:**
   ```sh
   flutter run
   ```

## Project Structure
```
khmer_foodies/
│── assets/
│   ├── images/
│   ├── data.json  # Contains food data
│── lib/
│   ├── main.dart
│   ├── home_page.dart
│   ├── banner_widget.dart
│── pubspec.yaml
│── README.md
```

## Dependencies
Ensure the following dependencies are in your `pubspec.yaml`:
```yaml
flutter:
  sdk: flutter

dependencies:
  flutter:
    sdk: flutter
  json_annotation: any
```

## Data Structure (`assets/data.json`)
```json
[
  {
    "name": "Amok",
    "image": "assets/images/amok.jpg",
    "description": "A popular Cambodian dish made with fish and coconut curry."
  },
  {
    "name": "Bai Sach Chrouk",
    "image": "assets/images/bai_sach_chrouk.jpg",
    "description": "Grilled pork with rice, commonly eaten for breakfast."
  }
]
```

## Known Issues
- Ensure that `data.json` is correctly formatted and included in `pubspec.yaml`.
- If assets are not loading, run:
  ```sh
  flutter clean && flutter pub get
  ```

## License
This project is licensed under the MIT License.

## Contact
For any issues or suggestions, feel free to open an issue or contribute!

Happy coding! 🚀
