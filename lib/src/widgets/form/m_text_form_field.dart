import 'package:flutter/material.dart';

class MTextFormField extends StatefulWidget {
  const MTextFormField({super.key, required this.controller, required this.label, this.maxLine, this.validationRequireText});
  final TextEditingController controller ;
  final String label ;
  final int? maxLine ;
  final String? validationRequireText ;
  @override
  State<MTextFormField> createState() => _MTextFormFieldState();
}

class _MTextFormFieldState extends State<MTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine,
      validator: (value) {
        if(value == "") {
          return widget.validationRequireText ?? "This field is required" ;
        }
        return null ;
      },
      controller: widget.controller,
      decoration:  InputDecoration(
        label: Text(widget.label),
        border: const OutlineInputBorder(),
      ),
    );
  }
}