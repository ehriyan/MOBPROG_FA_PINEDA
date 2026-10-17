import 'package:flutter/material.dart';

const double padding = 60;
const double borderRadius = 30;

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget{
  const GradientContainer(
    this.child, {
      super.key, 
      required this.color1,
      required this.color2,
      required this.color3,
    }
  );

  final Widget child;
  final Color color1;
  final Color color2;
  final Color color3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: startAlignment,
          end: endAlignment,
          colors: [
            color1,
            color2,
            color3,
          ],
        ),
      ),
      child: child,
    );
  }
}