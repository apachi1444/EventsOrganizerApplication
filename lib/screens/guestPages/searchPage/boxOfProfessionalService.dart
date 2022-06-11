import 'package:flutter/material.dart';

import '../../../extensions/constants.dart';
import '../professional/professionalDetail.dart';

class BoxOfProfessionalService extends StatelessWidget {
  const BoxOfProfessionalService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(ConstantColors.KPinkColor),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
            tileColor: Colors.white,
            leading: const Image(
              image: NetworkImage(
                  'https://jardin-secrets.com/image.php?/12435/photo-dracaena-fragrans_krzysztof-ziarnek.jpg'),
            ),
            title: const Text('DJ Category'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 6),
                Text('Yessine Jaoua'),
                SizedBox(height: 6),
                Text('Price : 200'),
              ],
            ),
            isThreeLine: true,
            trailing: GestureDetector(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ProfessionalDetail(
              //             description: description,
              //             price: price,
              //             image: image,
              //             dateTime: dateTime)),
              //   );
              // },
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: const Color(ConstantColors.KPinkColor),
                  // Background color
                  onPrimary: Colors.white, // Text Color (Foreground color)
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ProfessionalDetail()),
                  // );
                },

                icon: const Icon(
                  Icons.remove_red_eye_sharp,
                  size: 15.0,
                ),
                label: const Text('See More'), // <-- Text
              ),
            )),
      ),
    );
    ;
  }
}
