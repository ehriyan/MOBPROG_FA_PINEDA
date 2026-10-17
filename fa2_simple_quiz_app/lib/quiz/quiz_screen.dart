import 'package:fa2_simple_quiz_app/commons/constants.dart';
import 'package:fa2_simple_quiz_app/commons/styled_button.dart';
import 'package:fa2_simple_quiz_app/commons/styled_text.dart';
import 'package:fa2_simple_quiz_app/data/quiz_data.dart';
import 'package:fa2_simple_quiz_app/model/quiz.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
    this.switchScreen, {
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String) switchScreen;
  final void Function(bool) onSelectAnswer;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var questionIndex = 0;

  void answerQuestion(String answer) {
    bool isCorrect = answer == quizData[questionIndex].correctAnswer;
    widget.onSelectAnswer(isCorrect);

    if (questionIndex < quizData.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      widget.switchScreen('result-screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    Quiz currentQuestion = quizData[questionIndex];

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 15,
        children: [
          StyledText(currentQuestion.question, titleSize, color: textColor),

          const SizedBox(height: 20),

          ...currentQuestion.getShuffledList().map(
            (choice) => StyledButton(
              text: choice,
              onPressed: () {
                answerQuestion(choice);
              },
            ),
          ),
        ],
      ),
    );
  }
}
