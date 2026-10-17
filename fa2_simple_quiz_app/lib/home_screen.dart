import 'package:fa2_simple_quiz_app/commons/constants.dart';
import 'package:fa2_simple_quiz_app/commons/styled_button.dart';
import 'package:fa2_simple_quiz_app/commons/styled_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.switchScreen, {super.key});

  final void Function(String) switchScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        const StyledText('Welcome!', titleSize, color: textColor),
        const StyledText(
          'How smart are you? Test your knowledge here.',
          bodySize,
          color: textColor,
        ),

        const SizedBox(height: 20),

        StyledButton(
          text: 'Start Quiz',
          icon: Icons.play_arrow,
          onPressed: () {
            switchScreen('quiz-screen');
          },
        ),
      ],
    );
  }
}
