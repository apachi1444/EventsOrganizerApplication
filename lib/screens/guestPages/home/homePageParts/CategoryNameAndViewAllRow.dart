import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfs/extensions/utils.dart';

class CategoryNameAndViewAllRow extends StatelessWidget {
  const CategoryNameAndViewAllRow({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
           CircleAvatar(
            radius : 20,
            backgroundImage: AssetImage(Utils.returnImageCategory(title)),
          ),
          Text(title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const Text('View All', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
