import 'package:flutter/material.dart';

class MInkwell extends StatelessWidget {
  const MInkwell({super.key, required this.onTap, required this.child, this.padding = 10, this.borderRadius = 20});
  final Function() onTap ;
  final Widget child ;
  final double padding ;
  final double borderRadius ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
      onTap: () => onTap(),
    );
  }
}
