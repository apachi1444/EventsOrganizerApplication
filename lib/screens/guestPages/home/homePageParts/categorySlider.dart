import 'package:flutter/cupertino.dart';
import 'package:pfs/screens/guestPages/home/homePageParts/professionalBoxInHomePage.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            ProfessionalBoxInHomePage(),
            ProfessionalBoxInHomePage(),
            Text("This is the third element")
          ],
        ));
  }
}
