import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabii_clone_app/screens/login_screen.dart';
import 'package:tabii_clone_app/screens/splash_screen.dart';
import 'screens/main_screen.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
        ),
    );

    await Firebase.initializeApp();

    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Colors.black,
                colorScheme: const ColorScheme.dark(
                    primary: Colors.white,
                    secondary: Colors.white,
                    surface: Colors.black,
                    background: Colors.black,
                    onBackground: Colors.white,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                ),
            ),
            home: const SplashScreen(),
            routes: {
                "/main": (context) => const MainScreen(),
                "/login": (context) =>  SignInScreen(),
            },
        );
    }
}