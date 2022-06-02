import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/listOfProfessionalServices.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/navbarItem.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/plusButton.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/twoButttonPartServicesAndArchives.dart';
import 'package:provider/provider.dart';

import '../../../../Models/Service.dart';
import '../../../../StateNotifier/ProfessionalPreferences.dart';
import '../../../../services/authService.dart';
import '../../../../services/professionalServiceService.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    String? user = AuthService().getCurrentIdUser();
    String? firstName = ProfessionalPreferences.getFirstName();
    String? lastName = ProfessionalPreferences.getLastName();
    return SafeArea(
        child: Scaffold(
            body: StreamProvider<List<Service?>>.value(
      value: ProfessionalServiceService(professionalUid: user)
          .getAllServicesOfProfessional(),
      builder: (context, snapshot) {
        print(null);
        print(user);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            children: [
              NavBarItem(lastName: lastName!, name: firstName!),
              const SizedBox(height: 15),
              const TwoButttonPartServicesAndArchives(),
              const SizedBox(height: 15),
              const ListOfProfessionalServices(),
              const PlusButton(),
            ],
          ),
        );
      },
      initialData: [],
    )));
  }
}
