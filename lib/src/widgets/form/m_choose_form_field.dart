import 'package:flutter/material.dart';

import 'm_multi_choose_form_field.dart';

class MChooseFormField extends StatefulWidget {
  const MChooseFormField(
      {Key? key, required this.label, this.value, required this.items})
      : super(key: key);
  final String label;
  final String? value;
  final List<String> items;
  @override
  State<MChooseFormField> createState() => _MChooseFormFieldState();
}

class _MChooseFormFieldState extends State<MChooseFormField> {
  List<MMultiChooseItem> items = [];
  bool isOpen = false;

  @override
  void initState() {
    items = widget.items
        .map((e) =>
            MMultiChooseItem(name: e, status: e == widget.value ? true : false))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (String? values) {
        if (values == null) {
          return "Field is required";
        }
        return null;
      },
      initialValue: widget.value,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    child: ListTile(
                      title: Text(widget.label),
                      trailing: Icon(isOpen
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded),
                    ),
                  ),
                  Visibility(
                    visible: isOpen,
                    child: Column(children: [
                      Container(
                        height: 1,
                        color: Colors.grey,
                        width: double.infinity,
                      ),
                      ...items
                          .map((currentItem) => CheckboxListTile(
                                title: Text(currentItem.name),
                                value: currentItem.status,
                                onChanged: (bool? value) {
                                  items = items
                                      .map((e) => e.name == currentItem.name
                                          ? e.copyWith(status: value)
                                          : e.copyWith(status: false))
                                      .toList();
                                  field.didChange((value ?? false)
                                      ? currentItem.name
                                      : null);
                                  setState(() {});
                                },
                              ))
                          .toList(),
                    ]),
                  )
                ],
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
                )),
          ],
        );
      },
    );
  }
}
