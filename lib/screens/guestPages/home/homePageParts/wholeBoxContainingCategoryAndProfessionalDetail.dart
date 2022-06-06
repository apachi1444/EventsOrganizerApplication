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

    return StreamBuilder(
        stream: GuestService(guestUid: '')
            .listProfessionalsWithSameCity('Marrakech'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return Expanded(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      print("jlkqdsjf");
                      print(snapshot.data);
                      return Container();
                    }));
          }

          return const Text('this is the end ');
        });
  }
}
