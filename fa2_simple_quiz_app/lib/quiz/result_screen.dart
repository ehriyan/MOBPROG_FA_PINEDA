import 'package:fa2_simple_quiz_app/commons/constants.dart';
import 'package:fa2_simple_quiz_app/commons/styled_button.dart';
import 'package:fa2_simple_quiz_app/commons/styled_text.dart';
import 'package:fa2_simple_quiz_app/data/quiz_data.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.switchScreen, this.score, {super.key});

  final void Function(String) switchScreen;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 15,
          children: [
            const StyledText(
              'You completed the quiz!',
              titleSize,
              color: textColor,
            ),
            StyledText(
              'You got $score out of ${quizData.length} correct.',
              bodySize,
              color: textColor,
            ),

            const SizedBox(height: 20),

            StyledButton(
              text: 'Restart',
              icon: Icons.refresh,
              onPressed: () {
                switchScreen('home-screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
