import 'package:flutter/material.dart';

class MCard extends StatelessWidget {
  const MCard({super.key, required this.widget, this.elevation = 3, this.borderRadius = 20});
  final Widget widget ;
  final double elevation ;
  final double borderRadius ;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: widget,
    );
  }
}