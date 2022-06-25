import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pfs/Models/Service.dart';
import 'package:pfs/extensions/listOfCategories.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/noDataFoundForThatCategory.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalBoxInHomePage.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalSlider.dart';
import 'package:provider/provider.dart';

import '../../../../Models/Professional.dart';
import '../../../../services/authService.dart';
import '../../../../services/guestService.dart';
import '../../../../services/professionalDbService.dart';
import '../../../professionalPages/parametersPages/services/servicesPageParts/noDataFound.dart';
import '../../../professionalPages/parametersPages/services/servicesPageParts/serviceDetailsBox.dart';
import 'CategoryNameAndViewAllRow.dart';

class WholeBoxContainingCategoryAndProfessionalDetail extends StatelessWidget {
  WholeBoxContainingCategoryAndProfessionalDetail(
      {Key? key, required this.category})
      : super(key: key);
  final String? category;
  final String? guestUid = AuthService().getCurrentIdUser();

  @override
  Widget build(BuildContext context) {
    final guestService = GuestService(guestUid: guestUid);
    

//     return StreamBuilder(
//       stream : guestService.getAllProfessionalsInOutDb(),
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           return       ListView.builder(
//               shrinkWrap: true,
//               physics: const ScrollPhysics(),
//               itemCount: listProfessionals.length,
//               itemBuilder: (context, index) {
//                 String firstName = listProfessionals[index].getFirstName();
//                 String lastName = listProfessionals[index].getLastName();
//                 String uid = listProfessionals[index].getUid();
//                 return StreamBuilder(
//                     stream: guestService.getAllServicesOfParticularProfessional(uid),
//                     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Text('still waiting');
//                       } else {
//                         return ProfessionalSlider(guestUid: guestUid, category: category);
//                       }
//                     });
//               })
//       },
// ,
//     );

    return ProfessionalSlider(
      guestUid: guestUid,
      category: category,
    );
  }
}
