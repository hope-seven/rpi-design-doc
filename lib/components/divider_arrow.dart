import 'package:flutter/material.dart';

class DividerWithArrow extends StatelessWidget {
  final Color lineColor;
  final Color arrowColor;
  final double thickness;
  final double spacing;

  const DividerWithArrow({
    super.key,
    this.lineColor = const Color(0xFFB0BEC5), // blue-grey
    this.arrowColor = Colors.blueAccent,
    this.thickness = 1.0,
    this.spacing = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Divider(
              color: lineColor,
              thickness: thickness,
              endIndent: 12,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: arrowColor,
            size: 36,
          ),
          Expanded(
            child: Divider(
              color: lineColor,
              thickness: thickness,
              indent: 12,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
