import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/listOfProfessionalServices.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/navbarItem.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/plusButton.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/twoButttonPartServicesAndArchives.dart';
import 'package:pfs/services/getFileFirebase.dart';
import 'package:provider/provider.dart';

import '../../../../Models/Service.dart';
import '../../../../extensions/constants.dart';
import '../../../../services/authService.dart';
import '../../../../services/professionalServiceService.dart';
import '../../../../sharedPreferences/ProfessionalPreferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    var fileFirebase =
        GetFileFirebase(uidProfessional: ProfessionalPreferences.getUid());
    String? user = AuthService().getCurrentIdUser();
    String? firstName = ProfessionalPreferences.getFirstName();
    String? lastName = ProfessionalPreferences.getLastName();
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            children: [
              NavBarItem(lastName: lastName!, name: firstName!),
              const SizedBox(height: 15),
              const TwoButttonPartServicesAndArchives(),
              const SizedBox(height: 15),
              // FutureBuilder(
              //     future: fileFirebase.listFiles(),
              //     builder: (context,
              //         AsyncSnapshot<firebase_storage.ListResult> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done &&
              //           snapshot.hasData) {
              //         return Expanded(
              //           child: ListView.builder(
              //               scrollDirection: Axis.horizontal,
              //               shrinkWrap: true,
              //               itemCount: snapshot.data!.items.length,
              //               itemBuilder: (context, index) {
              //                 return ElevatedButton(
              //                     onPressed: () {},
              //                     // child : Text(snapshot.data!.items[index].name)
              //                     child: FutureBuilder(
              //                         future: fileFirebase.downloadURL(
              //                             snapshot.data!.items[index].name),
              //                         builder: (context,
              //                             AsyncSnapshot<String> snapshot) {
              //                           if (snapshot.connectionState ==
              //                                   ConnectionState.done &&
              //                               snapshot.hasData) {
              //                             return SizedBox(
              //                                 width: 300,
              //                                 height: 250,
              //                                 child: Image.network(
              //                                     snapshot.data!,
              //                                     fit: BoxFit.cover));
              //                           }
              //                           if (snapshot.connectionState ==
              //                                   ConnectionState.waiting ||
              //                               !snapshot.hasData) {
              //                             return const CircularProgressIndicator(
              //                               valueColor: AlwaysStoppedAnimation(
              //                                 Color(ConstantColors.KPinkColor),
              //                               ),
              //                             );
              //                           }
              //                           return Container();
              //                         }));
              //               }),
              //         );
              //       }
              //       if (snapshot.connectionState == ConnectionState.waiting ||
              //           !snapshot.hasData) {
              //         return const CircularProgressIndicator();
              //       }
              //       return Container();
              //     }),
              const ListOfProfessionalServices(),
              const PlusButton(),
            ],
          )),
    ));
  }
}
