import 'package:flutter/material.dart';

class MTimeFormField extends StatefulWidget {
  final String label;
  final TimeOfDay? value;
  final Function(TimeOfDay value) onChange;

  const MTimeFormField(
      {Key? key, required this.label, required this.onChange, this.value})
      : super(key: key);

  @override
  State<MTimeFormField> createState() => _MTimeFormFieldState();
}

class _MTimeFormFieldState extends State<MTimeFormField> {
  TimeOfDay? value;

  @override
  void initState() {
    if (widget.value != null) {
      value = widget.value!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<TimeOfDay>(
      validator: (TimeOfDay? v) {
        if (v == null) {
          return "This field is required";
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
                  border: Border.all(
                      color: field.hasError
                          ? Theme.of(context).colorScheme.error
                          : Colors.grey)),
              child: ListTile(
                onTap: () async {
                  TimeOfDay? data = await showTimePicker(
                      context: context,
                      initialTime:
                          value ?? const TimeOfDay(hour: 0, minute: 0));

                  if (data != null) {
                    value = data;
                    widget.onChange(data);
                    field.didChange(value);
                    setState(() {});
                  }
                },
                title: Text(widget.label),
                trailing: value == null
                    ? const Text("Not Registered")
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(value!.hour.toString()),
                          const Text(" : "),
                          Text(value!.minute.toString()),
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
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 13)),
                ))
          ],
        );
      },
    );
  }
}
