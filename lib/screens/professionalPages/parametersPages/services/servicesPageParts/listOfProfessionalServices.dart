import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/noDataFound.dart';
import 'package:pfs/screens/professionalPages/parametersPages/services/servicesPageParts/serviceDetailsBox.dart';

import '../../../../../services/authService.dart';
import '../../../../../services/professionalServiceService.dart';

class ListOfProfessionalServices extends StatelessWidget {
  const ListOfProfessionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // here we will call the provider who will give us the professional uid
    String? user = AuthService().getCurrentIdUser();
    return StreamBuilder(
        stream: ProfessionalServiceService(professionalUid: user)
            .getStreamOfServicesOfParticularProfessional(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Text('there is no data for the moment in our stream');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(
                'there is waiting data for the moment in our stream');
          } else {
            var allDocs = snapshot.data.docs;

            if (snapshot.data.docs.length == 0) {
              return const NoDataFound();
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var ourLastElement = allDocs[index].data();
                      String description = ourLastElement['description'];
                      String price = ourLastElement['price'];
                      String category = ourLastElement['title'];
                      String date = ourLastElement['dateTime'];
                      String image = ourLastElement['image'];
                      return ServiceDetailsBox(
                        // uid : serviceUid,
                        networkImage: image,
                        image: image,
                        description: description,
                        price: price,
                        category: category,
                        date: date,
                      );
                    }),
              );
            }
          }
        });

  }
}
