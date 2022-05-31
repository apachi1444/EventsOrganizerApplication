import 'package:flutter/material.dart';

class ImageAboveTheContainer extends StatelessWidget {
  const ImageAboveTheContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration());
  }
}
