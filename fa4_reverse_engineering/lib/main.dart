import 'package:fa4_reverse_engineering/constants.dart';
import 'package:fa4_reverse_engineering/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FireflyApp());
}

class FireflyApp extends StatefulWidget {
  const FireflyApp({super.key});

  @override
  State<FireflyApp> createState() => _FireflyAppState();
}

class _FireflyAppState extends State<FireflyApp> {
  ThemeMode _currentThemeMode = ThemeMode.light;

  void _toggleThemeMode() {
    setState(() {
      _currentThemeMode = _currentThemeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: kColorScheme.primaryContainer,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
          titleTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kColorScheme.onPrimaryContainer,
          ),
        ),
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 50,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 15,
          ),
          titleSmall: TextStyle(
            color: kColorScheme.onSecondaryContainer,
            fontSize: 14,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme().copyWith(
          border: const OutlineInputBorder(
          ),
        ),
      ),

      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: kDarkColorScheme.primaryContainer,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
          titleTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kColorScheme.onPrimaryContainer,
          ),
        ),
        cardTheme: CardThemeData().copyWith(
          color: kDarkColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.onPrimaryContainer,
            foregroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 50,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 15,
          ),
          titleSmall: TextStyle(
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 14,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme().copyWith(
          border: const OutlineInputBorder(
          ),
        ),
      ),

      themeMode: _currentThemeMode,
      home: LoginScreen(onToggleTheme: _toggleThemeMode),
    );
  }
}
