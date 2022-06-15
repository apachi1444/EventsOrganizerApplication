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
  final String? userId = AuthService().getCurrentIdUser();
  @override
  Widget build(BuildContext context) {
    final guestService = GuestService(guestUid: userId);

    return StreamBuilder(
        stream: guestService.getAllProfessionalsInOutDb(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Text('there is no data for the moment in our stream');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.data.length == 0) {
              return Container();
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    String firstName = snapshot.data[index].getFirstName();
                    String lastName = snapshot.data[index].getLastName();
                    String uid = snapshot.data[index].getUid();
                    return Column(
                      children: [
                        const SizedBox(height: 15),
                        ProfessionalSlider(category : category,
                            guestUid: userId, professionalUid: uid),
                        const SizedBox(height: 15),
                      ],
                    );
                  });
            }
          }
        });
  }
}
