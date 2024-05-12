import 'package:flutter/material.dart';

class MNumberFormField extends StatefulWidget {
  final String label;
  final int value;
  final int max;
  final int min;
  final Function(int value) onChange;

  const MNumberFormField(
      {Key? key,
      required this.label,
      required this.onChange,
      this.value = 0,
      this.max = 15,
      this.min = -15})
      : super(key: key);

  @override
  State<MNumberFormField> createState() => _MNumberFormFieldState();
}

class _MNumberFormFieldState extends State<MNumberFormField> {
  int value = 0;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      validator: (int? v) {
        if (v == null) {
          return "This field is required";
        }

        if (v > widget.max) {
          return "The value is greater than the maximum value";
        }

        if (v < widget.min) {
          return "The value is less than the minimum value";
        }

        return null;
      },
      initialValue: value,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                title: Text(widget.label),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (value < 15) {
                            value++;
                            widget.onChange(value);
                            field.didChange(value);
                            setState(() {});
                          }
                        },
                        icon: Icon(Icons.add,color: Theme.of(context).primaryColor,)),
                    Text(value.toString()),
                    IconButton(
                        onPressed: () {
                          if (value > -15) {
                            value--;
                            widget.onChange(value);
                            field.didChange(value);
                            setState(() {});
                          }
                        },
                        icon: Icon(Icons.remove,color: Theme.of(context).primaryColor,)),
                  ],
                ),
              ),
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
