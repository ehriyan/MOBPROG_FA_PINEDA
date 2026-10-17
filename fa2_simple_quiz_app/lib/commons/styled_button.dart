import 'package:fa2_simple_quiz_app/commons/constants.dart';
import 'package:fa2_simple_quiz_app/commons/styled_text.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  final String text;
  final void Function() onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(icon, color: textColor),
        label: StyledText(text, bodySize, color: textColor),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: StyledText(text, bodySize, color: textColor),
    );
  }
}
