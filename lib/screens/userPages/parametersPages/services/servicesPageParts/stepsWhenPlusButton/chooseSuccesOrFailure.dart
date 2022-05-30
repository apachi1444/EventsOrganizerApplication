import 'package:flutter/cupertino.dart';
import 'package:pfs/screens/userPages/parametersPages/services/servicesPageParts/stepsWhenPlusButton/succesStep.dart';

import 'failureStep.dart';

class ChooseSuccessOrFailure extends StatefulWidget {
  final bool isFailure;
  const ChooseSuccessOrFailure({Key? key, required this.isFailure})
      : super(key: key);

  @override
  State<ChooseSuccessOrFailure> createState() => _ChooseSuccessOrFailureState();
}

class _ChooseSuccessOrFailureState extends State<ChooseSuccessOrFailure> {
  @override
  Widget build(BuildContext context) {
    return widget.isFailure ? const FailureStep() : const SuccesStep();
  }
}
