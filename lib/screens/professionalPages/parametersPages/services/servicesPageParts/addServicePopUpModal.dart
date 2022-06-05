import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/stepsWhenPlusButton/chooseSuccesOrFailure.dart';
import 'package:pfs/services/professionalServiceService.dart';

import '../../../../../extensions/constants.dart';
import '../../../../../extensions/listOfCategories.dart';
import '../../../../../services/authService.dart';
import '../../../../authPages/inputTextWidget.dart';

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

  @override
  Widget build(BuildContext context) {
    ProfessionalServiceService professionalServiceService =
        ProfessionalServiceService(professionalUid: currentUserUid);
    return isCompleted
        ? ChooseSuccessOrFailure(
            isFailure: isFailure,
          )
        : Stepper(
            type: StepperType.vertical,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;

              if (isLastStep) {
                professionalServiceService.addServiceToProfessional(
                    DateTime.now().toString(),
                    selectedItem!,
                    _descriptionController.text.trim(),
                    _priceController.text.trim());

                setState(() {
                  isFailure = false;
                });
                print(isFailure);
                setState(() {
                  isCompleted = true;
                });
              } else {
                setState(() {
                  currentStep++;
                });
              }
            },
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
          );
  }

  Future pickImage() async {
    print('aha');

    try {
      image =
          (await ImagePicker().pickImage(source: ImageSource.camera)) as File?;

      if (image == null) {
        return;
      }

      final permanentImage = await saveImagePermanenetly(image!.path);

      final imageTemporary = File(image!.path);
      setState(() {
        image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('error in our pc');
    }
  }

  Future<File> saveImagePermanenetly(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  var list = categories;
  String? selectedItem = categories[0];

  List<Step> getSteps() => [
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
            content: Column(children: [
              InputTextWidget(
                isPassword: false,
                icon: Icons.description,
                inputHintText: 'Description Here !',
                controllerUsedInInput: _descriptionController,
              ),
              const SizedBox(height: 12),
              InputTextWidget(
                isPassword: false,
                icon: Icons.price_change,
                inputHintText: 'Price Here !',
                controllerUsedInInput: _priceController,
              ),
              const SizedBox(height: 12),
            ])),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text('Step 3 : Upload Your Images Here'),
            content: GestureDetector(
              onTap: () {
                pickImage();
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
                      child: Column(children: const [
                        Icon(Icons.image),
                        Text('Upload your images here'),
                        SizedBox(height: 12)
                      ]),
                    ),
                  )),
            ))
      ];
}