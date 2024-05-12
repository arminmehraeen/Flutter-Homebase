import 'package:flutter/material.dart';


class MInkwell extends StatelessWidget {
  // Constructor for MInkwell
  const MInkwell({
    Key? key,
    required this.onTap,
    required this.child,
    this.padding = 10,
    this.borderRadius = 20,
  }) : super(key: key);

  // Callback function called when InkWell is tapped
  final Function() onTap;

  // The child widget to be placed inside the InkWell
  final Widget child;

  // Padding around the child widget (default is 10)
  final double padding;

  // The border radius of the InkWell (default is 20)
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Set the border radius of the InkWell
      borderRadius: BorderRadius.circular(borderRadius),
      // Apply padding around the child widget
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
      // Define onTap behavior to call the provided onTap callback
      onTap: () => onTap(),
    );
  }
}
