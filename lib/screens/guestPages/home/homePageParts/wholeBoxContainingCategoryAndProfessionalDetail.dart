import 'package:flutter/material.dart';
import 'package:pfs/Models/Service.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalBoxInHomePage.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalSlider.dart';
import 'package:provider/provider.dart';

import '../../../../Models/Professional.dart';
import '../../../../services/guestService.dart';
import '../../../../services/professionalDbService.dart';
import '../../../professionalPages/parametersPages/services/servicesPageParts/noDataFound.dart';
import '../../../professionalPages/parametersPages/services/servicesPageParts/serviceDetailsBox.dart';
import 'CategoryNameAndViewAllRow.dart';

class WholeBoxContainingCategoryAndProfessionalDetail extends StatelessWidget {
  const WholeBoxContainingCategoryAndProfessionalDetail(
      {Key? key, required this.userId})
      : super(key: key);
  final String? userId;

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
              return const NoDataFound();
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
                        CategoryNameAndViewAllRow(
                            firstName: firstName, lastName: lastName),
                        const SizedBox(height: 15),
                        ProfessionalSlider(
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
