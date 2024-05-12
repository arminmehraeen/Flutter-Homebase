import 'package:flutter/material.dart';

class MStepperItem {
  final String label ;
  final Widget widget ;

  const MStepperItem({
    required this.label,
    required this.widget,
  });
}


class MStepper extends StatefulWidget {
  const MStepper({super.key, required this.steps, this.cancelButtonText, this.continueButtonText, this.cancelButtonColor, this.continueButtonColor, this.stepperType}) ;
  final List<MStepperItem> steps ;
  final String? cancelButtonText ;
  final String? continueButtonText ;
  final Color? cancelButtonColor ;
  final Color? continueButtonColor ;
  final StepperType? stepperType;
  @override
  State<MStepper> createState() => _MStepperState();
}

class _MStepperState extends State<MStepper> {

  int step = 0 ;

  @override
  Widget build(BuildContext context) {
    return Stepper(
        physics: const BouncingScrollPhysics(),
        currentStep: step,
        onStepTapped: (value) {
          setState(() {
            step = value ;
          });
        },
      controlsBuilder: (context, details) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(details.onStepCancel != null) ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: widget.cancelButtonColor ?? Colors.red
                  ),
                  onPressed:() => details.onStepCancel!(), child: Text(widget.cancelButtonText ?? "Back")),

              if(details.onStepCancel != null && details.onStepContinue != null) const SizedBox(width: 10,) ,

              if(details.onStepContinue != null) ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: widget.continueButtonColor ?? Colors.blue
                  ),
                  onPressed:() => details.onStepContinue!(), child: Text( widget.continueButtonText ?? "Continue"))
            ],
          ) ;
      },
        onStepContinue: step != widget.steps.length - 1 ? () {
          setState(() {
            step +=1;
          });
        }:null,
        onStepCancel: step != 0 ?  () {
          setState(() {
            step -=1;
          });
        } : null,
        type: widget.stepperType ?? StepperType.vertical,
        steps: [

          for (int i = 0; i < widget.steps.length; i++) Step(
              isActive: i == step,
              title: Text(widget.steps[i].label), content: widget.steps[i].widget)

        ]

    );
  }
}
