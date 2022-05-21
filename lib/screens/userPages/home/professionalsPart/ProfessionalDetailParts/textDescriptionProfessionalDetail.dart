import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/constant_colors.dart';

class TextDescriptionProfessionalDetailPage extends StatelessWidget {
  const TextDescriptionProfessionalDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Description',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 15),
          const Text(
              'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum last_name SingleTickerProviderStateMixin _lastNameController last_name last_namev last_namev hqhhqhqhdsfqskdfhkjsqdfhkjsqdhfkjsqdhfkj sjkdqfhqskjd fhjksqdhfjksldhf',
              style: TextStyle(
                  fontWeight: FontWeight.w100, color: Colors.blueGrey)),

          const SizedBox(height: 20),
          // this is for the price of the professionalDetail

          Row(
            children: const [
              Icon(Icons.monetization_on,
                  color: Color(ConstantColors.KPinkColor), size: 25),
              SizedBox(width: 10),
              Text('200 £',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),

          const SizedBox(height: 20),

          // this is the for the line of the add to list and the call button

          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(ConstantColors.KPinkColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  icon: const Icon(
                    // <-- Icon
                    Icons.add_box_outlined,
                    size: 24.0,
                  ),
                  label: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Add To List'),
                  ), // <-- Text
                ),
              ),
              const SizedBox(width: 15),
              Ink(
                decoration: const ShapeDecoration(
                  color: Color(ConstantColors.KPinkColor),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  onPressed: () {
                    // You enter here what you want the button to do once the user interacts with it
                  },
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  iconSize: 20.0,
                ),
              ), // Ink
            ],
          )
        ],
      ),
    );
  }
}
