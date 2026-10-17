import 'package:fa3_my_reading_list_expdisthmcrt/constants.dart';
import 'package:fa3_my_reading_list_expdisthmcrt/screens/books_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ReadingListApp());
}

class ReadingListApp extends StatefulWidget {
  const ReadingListApp({super.key});

  @override
  State<ReadingListApp> createState() => _ReadingListAppState();
}

class _ReadingListAppState extends State<ReadingListApp> {
  ThemeMode _currentThemeMode = ThemeMode.light;

  void _toggleTheme() {
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
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 22,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 15,
          ),
        ),
      ),

      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 22,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 15,
          ),
        ),
      ),

      themeMode: _currentThemeMode,

      home: BooksScreen(
        onToggleTheme: _toggleTheme,
        isDarkMode: _currentThemeMode == ThemeMode.dark,
      ),
    );
  }
}
