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
    print("this is the user");
    print(user);
    return StreamBuilder(
        stream: ProfessionalServiceService(professionalUid: user)
            .getStreamOfServicesOfParticularProfessional(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.none) {
            return const Text('there is no data for the moment in our stream');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(
                'there is waiting data for the moment in our stream');
          } else {
            var allDocs = snapshot.data.docs;
            print("this is the value of all docs");
            print(allDocs);
            if (snapshot.data.docs.length == 0) {
              return const NoDataFound();
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var ourLastElement = allDocs[index].data();
                      print(allDocs[index]);
                      String description = ourLastElement['description'];
                      String price = ourLastElement['price'];
                      String category = ourLastElement['category'];
                      String date = ourLastElement['dateTime'];
                      return ServiceDetailsBox(
                        // uid : serviceUid,
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
    // return Scaffold(
    //   body: StreamBuilder<List<Service?>>(
    //     stream: ProfessionalServiceService(professionalUid: uid)
    //         .getAllServicesOfProfessional(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return const Text('This is An error');
    //       } else if (snapshot.hasData) {
    //         final services = snapshot.data!;
    //         return ListView.separated(
    //             separatorBuilder: (context, index) =>
    //                 const Divider(color: Colors.black),
    //             itemCount: services.length,
    //             itemBuilder: (BuildContext context, int index) {
    //               return ListTile(title: Text('$index'));
    //             });
    //       } else {
    //         print("errororooror");
    //         return const CircularProgressIndicator();
    //       }
    //     },
    //   ),
    // );
  }
}
