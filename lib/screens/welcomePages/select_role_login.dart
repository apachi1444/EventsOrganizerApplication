import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectRoleLogin extends StatelessWidget {
  const SelectRoleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFF8),
      body : Center(
          child : Column(
              children : <Widget>[
                Container(
                  height : MediaQuery.of(context).size.height * 0.55  ,
                  width : MediaQuery.of(context).size.width * 0.7,
                  decoration : const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        bottomRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70)
                    ),
                    color :  Color(0XFFFF006B),
                  ),
                  padding : const EdgeInsets.all(25),
                  child: SvgPicture.asset(
                    "assets/welcome.svg",
                    //fit: B,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.1,
                  ),
                ),

                SizedBox(height : 70),





                Padding(
                    padding : EdgeInsets.symmetric(horizontal : 20),
                    child : Container(
                      width : MediaQuery.of(context).size.width  * 0.7,
                      padding : EdgeInsets.all(20),
                      decoration : BoxDecoration(
                          color :  Color(0XFFF8F4F4),
                          borderRadius:BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),

                      child : const Center(
                        child:  Text(
                            "Join As a guest",
                            style : TextStyle(
                              color : Colors.black ,
                              fontWeight : FontWeight.bold,
                            )
                        ),
                      ) ,
                    )
                ),


                SizedBox(height : 20),

                Padding(
                    padding : EdgeInsets.symmetric(horizontal : 20),
                    child : Container(
                      width : MediaQuery.of(context).size.width  * 0.7,
                      padding : EdgeInsets.all(20),
                      decoration : BoxDecoration(
                          color :  Color(0XFFF8F4F4),
                          borderRadius:BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            )
                          ]
                      ),

                      child : const Center(
                        child:  Text(
                            "Join As U Progessional",
                            style : TextStyle(
                              color : Colors.black ,
                              fontWeight : FontWeight.bold,
                            )
                        ),
                      ) ,
                    )
                ),



              ]
          )
      ),
    );
  }
}
