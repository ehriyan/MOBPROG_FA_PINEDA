import 'dart:math';
import 'package:flutter/material.dart';

const List<Color> wheelColors = [
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.cyan,
  Colors.blue,
  Colors.red,
];

const double radius = 11;
const double borderWidth = 3;

class ColorWheel extends StatefulWidget {
  const ColorWheel({
    super.key,
    required this.size,
    required this.onColorChanged,
  });

  final double size;
  final void Function(Color color) onColorChanged;

  @override
  State<ColorWheel> createState() => _ColorWheelState();
}

class _ColorWheelState extends State<ColorWheel> {
  late Offset _thumbPosition = Offset(widget.size / 2, widget.size / 2);

  Color _sweepColor(double fraction) {
    final position = fraction * (wheelColors.length - 1);
    final index = min(position.floor(), wheelColors.length - 2);
    return Color.lerp(
      wheelColors[index],
      wheelColors[index + 1],
      position - index,
    )!;
  }

  void _pickColor(Offset touchPosition) {
    final radius = widget.size / 2;
    final center = Offset(radius, radius);

    var offset = touchPosition - center;
    if (offset.distance > radius) {
      offset = Offset.fromDirection(offset.direction, radius);
    }

    final fraction = (offset.direction % (2 * pi)) / (2 * pi);
    final baseColor = _sweepColor(fraction);
    final whiteOverlay = Color.lerp(
      Colors.white,
      Colors.transparent,
      offset.distance / radius,
    )!;

    setState(() {
      _thumbPosition = center + offset;
    });

    widget.onColorChanged(Color.alphaBlend(whiteOverlay, baseColor));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        _pickColor(details.localPosition);
      },
      onPanUpdate: (details) {
        _pickColor(details.localPosition);
      },
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(colors: wheelColors),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Colors.white, Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              left: _thumbPosition.dx - radius,
              top: _thumbPosition.dy - radius,
              child: Container(
                width: radius * 2,
                height: radius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: borderWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}