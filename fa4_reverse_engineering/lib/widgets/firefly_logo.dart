import 'package:fa4_reverse_engineering/constants.dart';
import 'package:flutter/material.dart';

class FireflyLogo extends StatelessWidget {
  const FireflyLogo({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      color: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }
}
