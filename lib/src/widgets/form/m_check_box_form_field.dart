import 'package:flutter/material.dart';

class MCheckBoxFormField extends StatefulWidget {
  final String label;
  final String? subtitle ;
  final bool initValue;
  final Function(bool value) onChange;

  const MCheckBoxFormField(
      {Key? key,
      required this.label,
      this.initValue = false,
      required this.onChange, this.subtitle})
      : super(key: key);

  @override
  State<MCheckBoxFormField> createState() => _MCheckBoxFormFieldState();
}

class _MCheckBoxFormFieldState extends State<MCheckBoxFormField> {
  bool value = false;

  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) {
        if (value == false) {
          return "This value must be true";
        }
        return null;
      },
      initialValue: value,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              shape: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: field.hasError
                          ? Theme.of(context).errorColor
                          : Colors.grey)),
              value: value,
              onChanged: (v) {
                value = v ?? false;
                widget.onChange(value);
                field.didChange(value);
                setState(() {});
              },
              title: Text(
                widget.label,
              ),
              subtitle: widget.subtitle != null ?  Text(widget.subtitle!) : null,
            ),
            Visibility(
                visible: field.hasError,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10)
                          .copyWith(bottom: 0),
                  child: Text(field.errorText ?? "Default error text",
                      style: TextStyle(
                          color: Theme.of(context).errorColor, fontSize: 13)),
                ))
          ],
        );
      },
    );
  }
}
