import 'package:flutter/material.dart';

class MMultiChooseItem {
  final String name;
  final bool status;

  const MMultiChooseItem({
    required this.name,
    required this.status,
  });

  MMultiChooseItem copyWith({
    String? name,
    bool? status,
  }) {
    return MMultiChooseItem(
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }
}

class MMultiChooseFormField extends StatefulWidget {
  const MMultiChooseFormField(
      {Key? key,
      required this.label,
      this.values = const [],
      required this.items})
      : super(key: key);
  final String label;
  final List<String> values;
  final List<String> items;
  @override
  State<MMultiChooseFormField> createState() => _MMultiChooseFormFieldState();
}

class _MMultiChooseFormFieldState extends State<MMultiChooseFormField> {
  List<MMultiChooseItem> items = [];
  bool isOpen = false;

  @override
  void initState() {
    items = widget.items
        .map((e) => MMultiChooseItem(
            name: e, status: widget.values.contains(e) ? true : false))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<List<String>>(
      validator: (List<String>? values) {
        if (values == null) {
          return "Field is required";
        }

        if (values.isEmpty) {
          return "Please select on item";
        }

        return null;
      },
      initialValue: widget.values,
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
                                          : e)
                                      .toList();
                                  field.didChange(items
                                      .where((e) => e.status == true)
                                      .toList()
                                      .map((e) => e.name)
                                      .toList());
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
                          color: Theme.of(context).colorScheme.error, fontSize: 13)),
                )),
          ],
        );
      },
    );
  }
}
