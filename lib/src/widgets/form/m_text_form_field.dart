import 'package:flutter/material.dart';

class MTextFormField extends StatefulWidget {
  const MTextFormField(
      {Key? key,
      required this.label,
      required this.initValue,
      required this.onSaved})
      : super(key: key);

  final String label;
  final String initValue;
  final Function(String value) onSaved;

  @override
  State<MTextFormField> createState() => _MTextFormFieldState();
}

class _MTextFormFieldState extends State<MTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value == "") return "Field is required";
          return null;
        },
        initialValue: widget.initValue,
        onSaved: (newValue) => widget.onSaved(newValue ?? ""),
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: widget.label));
  }
}
