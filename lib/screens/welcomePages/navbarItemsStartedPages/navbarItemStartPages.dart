import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class NavBarItemStartPages extends StatelessWidget {
  const NavBarItemStartPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(70),
            bottomLeft: Radius.circular(70)),
        color: Color(0XFFFF006B),
      ),
      padding: const EdgeInsets.all(25),
      child: SvgPicture.asset(
        'assets/welcome.svg',
        //fit: B,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.height * 0.1,
      ),
    );
  }
}
