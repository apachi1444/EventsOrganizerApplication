import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalSlider.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/wholeBoxContainingCategoryAndProfessionalDetail.dart';
import 'package:pfs/screens/professionalPages/parametersPages/editProfile/editProfileParts/wholeContainerOfUpdatingDataProfessional.dart';

import '../../../../extensions/listOfCategories.dart';
import 'CategoryNameAndViewAllRow.dart';

class ShowAllListOfCategories extends StatelessWidget {
  ShowAllListOfCategories({Key? key}) : super(key: key);
  final listCategories = categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: listCategories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 15),
              CategoryNameAndViewAllRow(
                  title: listCategories[index],
                  ),
              const SizedBox(height: 15),
              WholeBoxContainingCategoryAndProfessionalDetail(
                  category: listCategories[index]),
              const SizedBox(height: 15),
            ],
          );
        });
  }
}
