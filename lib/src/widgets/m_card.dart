import 'package:flutter/material.dart';

class MCard extends StatelessWidget {
  // Constructor for MCard
  const MCard({
    Key? key,
    required this.widget,
    this.elevation = 3,
    this.borderRadius = 20,
  }) : super(key: key);

  // The child widget to be placed inside the card
  final Widget widget;

  // The elevation of the card (default is 3)
  final double elevation;

  // The border radius of the card (default is 20)
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      // Set the elevation of the card
      elevation: elevation,
      // Define the shape of the card with rounded corners
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      // Place the provided widget inside the card
      child: widget,
    );
  }
}
