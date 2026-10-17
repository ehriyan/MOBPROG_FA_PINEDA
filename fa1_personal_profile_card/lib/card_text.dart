import 'package:flutter/material.dart';

const double largeFontSize = 35;
const double mediumFontSize = 20;
const double smallFontSize = 16; 
const double spacing = 10;

const Color primaryColor = Color.fromARGB(255, 52, 33, 95);
const Color secondaryColor = Colors.white;

class CardText extends StatelessWidget {
  const CardText({
    super.key,
    required this.name,
    required this.program,
    required this.bio,
  });

  final String name;
  final String program;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: largeFontSize,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),

        const SizedBox(height: spacing),

        Text(
          program,
          style: TextStyle(
            fontSize: mediumFontSize,
            color: secondaryColor,
          ),
        ),

        SizedBox(height: spacing),

        Text(
          bio,
          style: TextStyle(
            fontSize: smallFontSize,
            color: secondaryColor,
            fontStyle: FontStyle.italic,
          ),
        ),

      ]
    );
  }
}