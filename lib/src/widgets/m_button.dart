import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  final Function() onTap;
  final String? title;
  final IconData? icon;
  final Color? color;

  const MButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.color,
      required this.icon})
      : super(key: key);

  const MButton.text(
      {Key? key,
      required this.onTap,
      required this.title,
      this.color,
      this.icon})
      : super(key: key);

  const MButton.icon(
      {Key? key,
      required this.onTap,
      this.title,
      this.color,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: color, padding: const EdgeInsets.all(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) Icon(icon),
            if (icon != null && title != null)
              const SizedBox(
                width: 8,
              ),
            if (title != null) Text(title!)
          ],
        ));
  }
}
