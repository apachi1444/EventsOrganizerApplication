import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Models/Service.dart';
import '../../../../../services/authService.dart';

class ListOfProfessionalServices extends StatelessWidget {
  const ListOfProfessionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = Provider.of<List<Service?>>(context);
    print(services);
    String? uid = AuthService().getCurrentIdUser();
    print(uid);
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
    return Scaffold();
  }
}
