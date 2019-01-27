import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  static const String routeName = "/stepper";

  _StepperState createState() => new _StepperState();
}

class _StepperState extends State<StepperWidget> {
  int currentStep = 0;
  List<Step> mySteps = [
    Step(
      title: Text('Step 1'),
      content: Text('Hello!'),
      isActive: true
    ),
    Step(
      title: Text('Step 2'),
      content: Text('World!'),
      state: StepState.editing,
      isActive: false
    ),
    Step(
      title: Text('Step 3'),
      content: Text('Hello World!'),
      isActive: false
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: Container(
        child: Stepper(
          currentStep: this.currentStep,
          steps: mySteps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
            print('onStepTapped: ${step.toString()}');
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
              print('onStepCancel: ${currentStep.toString()}');
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < mySteps.length - 1) {
                currentStep = currentStep + 1;
              } else {
                currentStep = 0;
              }
            });
            print('onStepContinue: ${currentStep.toString()}');
          },
        ),
      ),
    );
  }
}