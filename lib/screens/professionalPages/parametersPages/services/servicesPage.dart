import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/listOfProfessionalServices.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/navbarItem.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/plusButton.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/twoButttonPartServicesAndArchives.dart';
import 'package:provider/provider.dart';

import '../../../../Models/Service.dart';
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
            children: const [
              NavBarItem(lastName: 'Jaoua', name: 'Yessine'),
              SizedBox(height: 15),
              TwoButttonPartServicesAndArchives(),
              SizedBox(height: 15),
              ListOfProfessionalServices(),
              PlusButton(),
            ],
          ),
        );
      },
      initialData: [],
    )));
  }
}
