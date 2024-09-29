import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MRangeSelectorField extends StatefulWidget {
  final String label;
  final double start;
  final double end;
  final double min;
  final double max;

  final Function(double min, double max) onChange;

  const MRangeSelectorField(
      {Key? key,
      required this.label,
      required this.onChange,
      this.start = 20,
      this.end = 50,
      this.min = 0,
      this.max = 100})
      : super(key: key);

  @override
  State<MRangeSelectorField> createState() => _MRangeSelectorFieldState();
}

class _MRangeSelectorFieldState extends State<MRangeSelectorField> {
  SfRangeValues values = const SfRangeValues(0, 0);

  @override
  void initState() {
    values = SfRangeValues(widget.start, widget.end);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<SfRangeValues>(
      validator: (SfRangeValues? v) {
        return null;
      },
      initialValue: values,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.label),
                  ),
                  SfRangeSlider(
                    min: widget.min,
                    max: widget.max,
                    values: values,
                    interval: 20,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (SfRangeValues v) {
                      values = v;
                      widget.onChange(v.start, v.end);
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 10,
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
                ))
          ],
        );
      },
    );
  }
}
