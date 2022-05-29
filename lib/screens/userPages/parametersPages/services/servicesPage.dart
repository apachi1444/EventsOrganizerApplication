import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/userPages/parametersPages/services/servicesPageParts/navbarItem.dart';
import 'package:pfs/screens/userPages/parametersPages/services/servicesPageParts/plusButton.dart';
import 'package:pfs/screens/userPages/parametersPages/services/servicesPageParts/serviceDetailsBox.dart';
import 'package:pfs/screens/userPages/parametersPages/services/servicesPageParts/twoButttonPartServicesAndArchives.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: const [
            NavBarItem(),
            TwoButttonPartServicesAndArchives(),
            ServiceDetailsBox(),
            PlusButton(),
          ],
        ),
      ),
    )));
  }
}
