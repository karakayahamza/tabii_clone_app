# README for Tabii Clone App

## Overview

Tabii Clone App is a Flutter application designed to provide a seamless user experience with a dark theme. The app utilizes Firebase for backend services and features a splash screen that transitions to the main application interface. 

## Features

- **Splash Screen**: A visually appealing splash screen that appears when the app is launched.
- **Login Screen**: A dedicated screen for user authentication.
- **Main Screen**: The primary interface of the application, accessible after login.
- **Dark Theme**: The app is designed with a dark theme for better visibility and user comfort.

## Technologies Used

- **Flutter**: The framework used for building the application.
- **Firebase**: Used for backend services, including user authentication and data storage.

## Installation

To run this application locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd tabii_clone_app
   ```

2. **Install dependencies**:
   Make sure you have Flutter installed on your machine. Then run:
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**:
   - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
   - Follow the instructions to add your app to the Firebase project and download the `google-services.json` or `GoogleService-Info.plist` file.
   - Place the file in the appropriate directory in your Flutter project.

4. **Run the application**:
   ```bash
   flutter run
   ```

## Code Structure

The main entry point of the application is located in `lib/main.dart`. Here’s a brief overview of the key components:

- **Firebase Initialization**: The app initializes Firebase services before running the main application.
- **MyApp Class**: This is the root widget of the application, which sets up the MaterialApp with routes and themes.
- **Routing**: The app defines routes for navigating between the splash screen, login screen, and main screen.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to modify this README as needed to better fit your project's specifics!
