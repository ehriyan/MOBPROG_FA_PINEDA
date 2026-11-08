import 'package:flutter/material.dart';

const double colorBoxHeight = 24;

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
    required this.color,
  });

  final double fill;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FractionallySizedBox(
                heightFactor: fill,
                alignment: Alignment.bottomCenter,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    color: Theme.of(context).colorScheme.primary.withValues(
                          alpha: 0.65,
                        ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Container(
              height: colorBoxHeight,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}