import 'package:flutter/material.dart';
import 'package:pfs/Models/Service.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalBoxInHomePage.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalSlider.dart';
import 'package:provider/provider.dart';

import '../../../../Models/Professional.dart';
import '../../../../services/guestService.dart';
import 'CategoryNameAndViewAllRow.dart';

class WholeBoxContainingCategoryAndProfessionalDetail extends StatelessWidget {
  const WholeBoxContainingCategoryAndProfessionalDetail({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GuestService(guestUid: '').getAll(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Expanded(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      print(snapshot.data);
                      return const Text("Yessine");
                    }));
          }

          return const Text('this is the end ');
        });
  }
}
