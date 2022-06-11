import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryNameAndViewAllRow extends StatelessWidget {
  const CategoryNameAndViewAllRow({Key? key, required this.lastName, required this.firstName}) : super(key: key);
  final String lastName;
  final String firstName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text('$firstName $lastName ',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const Text('View All', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
