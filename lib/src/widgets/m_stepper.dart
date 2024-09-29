import 'package:flutter/material.dart';

// Represents an item in the MStepper
class MStepperItem {
  final String label;
  final Widget widget;

  const MStepperItem({
    required this.label,
    required this.widget,
  });
}

// Custom Stepper widget
class MStepper extends StatefulWidget {
  const MStepper({
    Key? key,
    required this.steps,
    this.cancelButtonText,
    this.continueButtonText,
    this.cancelButtonColor,
    this.continueButtonColor,
    this.stepperType,
  }) : super(key: key);

  // List of steps in the stepper
  final List<MStepperItem> steps;

  // Text for the cancel button
  final String? cancelButtonText;

  // Text for the continue button
  final String? continueButtonText;

  // Color for the cancel button
  final Color? cancelButtonColor;

  // Color for the continue button
  final Color? continueButtonColor;

  // Type of the stepper (vertical or horizontal)
  final StepperType? stepperType;

  @override
  State<MStepper> createState() => _MStepperState();
}

class _MStepperState extends State<MStepper> {
  // Current step index
  int step = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      // Set physics for the stepper
      physics: const BouncingScrollPhysics(),
      // Set the current step
      currentStep: step,
      // Callback when a step is tapped
      onStepTapped: (value) {
        setState(() {
          step = value;
        });
      },
      // Customize the controls (cancel and continue buttons)
      controlsBuilder: (context, details) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Cancel button
            if (details.onStepCancel != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.cancelButtonColor ?? Colors.red,
                ),
                onPressed: () => details.onStepCancel!(),
                child: Text(widget.cancelButtonText ?? "Back"),
              ),
            // Add spacing between buttons if both cancel and continue buttons are present
            if (details.onStepCancel != null && details.onStepContinue != null)
              const SizedBox(width: 10),
            // Continue button
            if (details.onStepContinue != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.continueButtonColor ?? Colors.blue,
                ),
                onPressed: () => details.onStepContinue!(),
                child: Text(widget.continueButtonText ?? "Continue"),
              ),
          ],
        );
      },
      // Callback when continue button is pressed
      onStepContinue: step != widget.steps.length - 1
          ? () {
              setState(() {
                step += 1;
              });
            }
          : null,
      // Callback when cancel button is pressed
      onStepCancel: step != 0
          ? () {
              setState(() {
                step -= 1;
              });
            }
          : null,
      // Set the type of the stepper (vertical or horizontal)
      type: widget.stepperType ?? StepperType.vertical,
      // Generate steps
      steps: [
        for (int i = 0; i < widget.steps.length; i++)
          Step(
            // Set whether the step is active
            isActive: i == step,
            // Set title of the step
            title: Text(widget.steps[i].label),
            // Set content of the step
            content: widget.steps[i].widget,
          )
      ],
    );
  }
}
