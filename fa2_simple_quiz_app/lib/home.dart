import 'package:fa2_simple_quiz_app/home_screen.dart';
import 'package:fa2_simple_quiz_app/quiz/quiz_screen.dart';
import 'package:fa2_simple_quiz_app/quiz/result_screen.dart';
import 'package:fa2_simple_quiz_app/commons/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var activeScreen = 'home-screen';
  int score = 0;

  void switchScreen(String newScreen) {
    setState(() {
      activeScreen = newScreen;
      if (newScreen == 'home-screen') {
        score = 0;
      }
    });
  }

  void checkAnswer(bool isCorrect) {
    if (isCorrect) {
      score++;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = HomeScreen(switchScreen);

    if (activeScreen == 'quiz-screen') {
      currentScreen = QuizScreen(switchScreen, onSelectAnswer: checkAnswer);
    } else if (activeScreen == 'result-screen') {
      currentScreen = ResultScreen(switchScreen, score);
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryColor,
        body: Center(child: currentScreen),
      ),
    );
  }
}
