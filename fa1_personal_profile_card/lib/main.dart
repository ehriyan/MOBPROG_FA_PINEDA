import 'package:flutter/material.dart';
import 'package:fa1_personal_profile_card/gradient_container.dart';
import 'package:fa1_personal_profile_card/card_text.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 216, 192),
        body: Center(
          child: GradientContainer(
            CardText(
              name: 'ERIANNE L. PINEDA',
              program: 'BS Applied Mathematics (Information Technology Track)',
              bio: 'Do not do unto others what you gonna do with the dessert.',
            ),
            color1: Color.fromARGB(255, 238, 185, 87),
            color2: Color.fromARGB(255, 240, 120, 51),
            color3: Color.fromARGB(255, 149, 84, 187),
          ),
        ),
      ),
    )
  );
}
