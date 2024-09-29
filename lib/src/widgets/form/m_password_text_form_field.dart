import 'package:flutter/material.dart';

class MPasswordTextFormField extends StatefulWidget {
  const MPasswordTextFormField(
      {Key? key,
      required this.label,
      required this.initValue,
      required this.onSaved})
      : super(key: key);

  final String label;
  final String initValue;
  final Function(String value) onSaved;

  @override
  State<MPasswordTextFormField> createState() => _MPasswordTextFormFieldState();
}

class _MPasswordTextFormFieldState extends State<MPasswordTextFormField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value == "") return "Field is required";
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          if (!regex.hasMatch(value ?? "")) {
            return "Enter valid password";
          }
          return null;
        },
        obscureText: isShowPassword ? false : true,
        initialValue: widget.initValue,
        onSaved: (newValue) => widget.onSaved(newValue ?? ""),
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () => setState(() {
                isShowPassword = !isShowPassword;
              }),
              child: Icon(
                  isShowPassword ? Icons.visibility : Icons.visibility_off),
            ),
            border: const OutlineInputBorder(),
            labelText: widget.label));
  }
}
