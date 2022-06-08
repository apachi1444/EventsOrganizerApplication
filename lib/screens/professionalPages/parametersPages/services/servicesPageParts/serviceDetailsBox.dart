import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Models/Storage.dart';
import '../../../../../extensions/constants.dart';
import '../../../../../services/authService.dart';
import '../../../../../services/professionalServiceService.dart';
import '../../../../../sharedPreferences/ProfessionalPreferences.dart';

class ServiceDetailsBox extends StatelessWidget {
  const ServiceDetailsBox(
      {Key? key,
      required this.category,
      required this.date,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);
  final String image;
  final String category;
  final String date;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    String? uid = AuthService().getCurrentIdUser();
    var size = MediaQuery.of(context).size;
    void _deleteService() {
      print('deleted button selected');
      ProfessionalServiceService(professionalUid: uid!).deleteService(uid!);
    }

    return Container(
        margin: EdgeInsets.only(bottom: size.height * 0.02),
        decoration: BoxDecoration(
            color: const Color(ConstantColors.KPinkColor),
            borderRadius: BorderRadius.circular(25)),

        // this is for fixing the flex problem in the our container

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              FutureBuilder(
                  future :Storage().listFiles(ProfessionalPreferences.getUid()),
                  builder: (context , AsyncSnapshot<ListResult> snapshot){
                    if(  snapshot.connectionState== ConnectionState.done &&
                        snapshot.hasData){
                      // return Expanded(
                      //   child: ListView.builder(
                      //     itemCount : 4,
                      //     itemBuilder: (BuildContext context , int index){
                      //       return Text("ahaha");
                      //     },
                      //   ),
                      // );
                      return Text("Yessine Jaoua");
                    }
                    return const Text("there is no data");
    }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(category ?? '', style: const TextStyle(color: Colors.white , fontSize : 20)),
                  Row(children: [
                    GestureDetector(
                        onTap: () {
                          ProfessionalServiceService(professionalUid: uid!)
                              .getIdCurrentServiceProfessional(date);
                          _deleteService();
                        },
                        child: const Icon(Icons.delete_forever)),
                    // const Icon(Icons.update_disabled),
                  ]),
                ],
              ),
              const SizedBox(height : 10),
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/250?image=9'),
                    ),
                  ),
                  SizedBox(width: 7),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundImage: AssetImage('assets/googleIcon.png'),
                    ),
                  ),
                  SizedBox(width: 7),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundImage: AssetImage('assets/googleIcon.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('description :' ?? '' , style: TextStyle(color: Colors.white , fontSize : 16)),
                  const SizedBox(width:7),
                  Text(description ?? ''),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('price :' ?? '' , style: TextStyle(color: Colors.white , fontSize : 16)),
                  const SizedBox(width:7),
                  Text(price ?? ''),
                  const SizedBox(width:3),
                  const Text( '\$'),
                ],
              ),

              const SizedBox(height: 9),
              // this is for the bottom part of the sized box

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // this is for the date
                  Row(children: [
                    const Icon(Icons.date_range_outlined),
                    const SizedBox(width: 4),
                    Text(date ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
