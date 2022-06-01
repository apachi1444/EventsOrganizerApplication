import 'package:flutter/cupertino.dart';

import 'oneButtonServicePage.dart';

class TwoButttonPartServicesAndArchives extends StatelessWidget {
  const TwoButttonPartServicesAndArchives({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        OneButtonServicePage(text: 'My Services', isClicked: false),
        SizedBox(width: 15),
        OneButtonServicePage(text: "Archivés", isClicked: true),
      ],
    );
  }
}
