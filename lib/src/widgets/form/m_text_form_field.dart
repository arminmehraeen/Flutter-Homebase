import 'package:flutter/material.dart';

class MTextFormField extends StatefulWidget {
  // Constructor for MTextFormField
  const MTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    this.maxLine,
    this.validationRequireText,
  }) : super(key: key);

  // Text editing controller for the text field
  final TextEditingController controller;

  // Label text for the text field
  final String label;

  // Maximum number of lines for the text field
  final int? maxLine;

  // Validation text to display if the field is required
  final String? validationRequireText;

  @override
  State<MTextFormField> createState() => _MTextFormFieldState();
}

// State class for MTextFormField
class _MTextFormFieldState extends State<MTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Set the maximum number of lines for the text field
      maxLines: widget.maxLine,
      // Validator function to check if the field is required
      validator: (value) {
        if (value == "") {
          // If value is empty, return the validationRequireText, or default to a generic message
          return widget.validationRequireText ?? "This field is required";
        }
        return null; // Return null if validation passes
      },
      // Set the text editing controller for the text field
      controller: widget.controller,
      // Define decoration for the text field
      decoration: InputDecoration(
        // Set the label text for the text field
        labelText: widget.label,
        // Define border for the text field
        border: const OutlineInputBorder(),
      ),
    );
  }
}
