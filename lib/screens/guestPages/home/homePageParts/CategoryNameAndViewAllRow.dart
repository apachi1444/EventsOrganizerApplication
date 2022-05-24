import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryNameAndViewAllRow extends StatelessWidget {
  const CategoryNameAndViewAllRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('DJ Category',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          Text('View All', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
