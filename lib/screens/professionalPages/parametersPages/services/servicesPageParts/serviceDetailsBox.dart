import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../services/authService.dart';
import '../../../../../services/professionalServiceService.dart';

class ServiceDetailsBox extends StatelessWidget {
  const ServiceDetailsBox(
      {Key? key,
      required this.category,
      required this.date,
      required this.description,
      required this.price})
      : super(key: key);
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
            color: Colors.red, borderRadius: BorderRadius.circular(25)),

        // this is for fixing the flex problem in the our container

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(category ?? ''),
                  Row(children: [
                    GestureDetector(
                        onTap: () {
                          ProfessionalServiceService(professionalUid: uid!)
                              .getIdCurrentServiceProfessional(date);
                          _deleteService();
                        },
                        child: const Icon(Icons.delete_forever)),
                    const Icon(Icons.update_disabled),
                  ]),
                ],
              ),

              Row(
                children: const [
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
                  Text(description ?? ''),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(price ?? ''),
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
