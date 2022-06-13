import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pfs/extensions/validators.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/stepsWhenPlusButton/chooseSuccessOrFailure.dart';
import 'package:pfs/services/professionalServiceService.dart';

import 'dart:io';
import '../../../../../Models/Storage.dart';
import '../../../../../extensions/constants.dart';
import '../../../../../extensions/listOfCategories.dart';
import '../../../../../services/authService.dart';
import '../../../../authPages/inputTextWidget.dart';
import 'package:intl/intl.dart';


class AddServicePopUpModal extends StatefulWidget {
  const AddServicePopUpModal({Key? key}) : super(key: key);

  @override
  State<AddServicePopUpModal> createState() => _AddServicePopUpModalState();
}

class _AddServicePopUpModalState extends State<AddServicePopUpModal> {
  int currentStep = 0;
  bool isCompleted = false;
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  File? image;
  late bool isFailure;
  String? currentUserUid = AuthService().getCurrentIdUser();

  late Storage storage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storage = Storage();
  }

  @override
  Widget build(BuildContext context) {
    ProfessionalServiceService professionalServiceService =
        ProfessionalServiceService(professionalUid: currentUserUid);
    var fileName = image != null ? basename(image!.path) : 'No File Selected';
    if (isCompleted) {
      return ChooseSuccessOrFailure(
        isFailure: isFailure,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(ConstantColors.KPinkColor),
          title: const Text('Add Your Service'),
          centerTitle: true,
        ),
        body: Theme(
          data: ThemeData(
              primarySwatch: Colors.orange,
              colorScheme: const ColorScheme.light(
                primary: Color(ConstantColors.KPinkColor),
              )),
          child: Stepper(
            type: StepperType.vertical,
            steps: getSteps(fileName),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps(fileName).length - 1;

              if (isLastStep) {
                if (fileName == 'No File Selected') {
                  setState(() {
                    isFailure = true;
                  });
                } else {
                  storage.downloadFile(currentUserUid!, fileName).then((value) {
                    final now = DateTime.now();
                    String formatter = DateFormat('yMd').format(now);
                    professionalServiceService.addServiceToProfessional(
                        formatter,
                        selectedItem!,
                        _descriptionController.text.trim(),
                        _priceController.text.trim(),
                        value);
                  });

                  setState(() {
                    isFailure = false;
                  });
                }
                setState(() {
                  isCompleted = true;
                });
              } else {
                setState(() {
                  currentStep++;
                });
              }
            },
            onStepTapped: (step) => setState(() {
              currentStep = step;
            }),
            onStepCancel: () {
              currentStep == 0
                  ? null
                  : setState(() {
                      currentStep--;
                    });
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return currentStep >= 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: details.onStepContinue,
                          child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(ConstantColors.KGreenColor),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(Icons.verified_outlined,
                                    color: Colors.white),
                              )),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: details.onStepCancel,
                          child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(ConstantColors.KPinkColor),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(Icons.arrow_back_outlined,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: details.onStepContinue,
                          child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(ConstantColors.KGreenColor),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(Icons.verified_outlined,
                                    color: Colors.white),
                              )),
                        ),
                        const SizedBox(width: 10),
                      ],
                    );
            },
          ),
        ),
      );
    }
  }


  var list = categories;
  String? selectedItem = categories[0];

  List<Step> getSteps(var fileName) => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text('Step 1 : Choose Category'),
            content: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0XFFF8F4F4),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 0.6,
                            spreadRadius: 0.8,
                            offset: const Offset(0, 4))
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: DropdownButtonFormField<String>(
                        // validator: (val) =>
                        //     val != null ? 'Enter a valid email' : null,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueAccent,
                        ),
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            prefixIcon: Icon(Icons.map),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                        value: selectedItem,
                        items: list
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(fontSize: 12))))
                            .toList(),
                        onChanged: (item) {
                          setState(() {
                            selectedItem = item;
                          });
                        }),
                  ),
                ),
                const SizedBox(height: 12)
              ],
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text('Step 2 : Choose Your Price And Description'),
            content: SingleChildScrollView(
              child: Column(children: [
                SingleChildScrollView(
                  child: InputTextWidget(
                    validate: DescriptionValidator.validate,
                    isPassword: false,
                    icon: Icons.description,
                    inputHintText: 'Description Here !',
                    controllerUsedInInput: _descriptionController,
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  child: InputTextWidget(
                    validate : PriceValidator.validate,
                    isPassword: false,
                    icon: Icons.price_change,
                    inputHintText: 'Price Here !',
                    controllerUsedInInput: _priceController,
                  ),
                ),
                const SizedBox(height: 12),
              ]),
            )),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text('Step 3 : Upload Your Images Here'),
            content: GestureDetector(
              onTap: () async {
                final results = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                );

                if (results == null) {
                  ScaffoldMessenger.of(context as BuildContext)
                      .showSnackBar(const SnackBar(
                    content: Text('noFile'),
                  ));
                  return;
                }

                final path = results.files.single.path;


                setState(() {
                  image = File(path!);
                });

                storage.uploadFile(path!, fileName, currentUserUid!);
              },
              child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(ConstantColors.KGreyColor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38.0, vertical: 22),
                    child: Center(
                      child: Column(children: [
                        const Icon(Icons.image),
                        const Text('Upload your images here'),
                        const SizedBox(height: 12),
                        Text(
                          fileName,

                        ),
                      ]),
                    ),
                  )),
            ))
      ];

}
