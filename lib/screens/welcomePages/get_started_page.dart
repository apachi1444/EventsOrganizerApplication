import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pfs/screens/welcomePages/welcome_page_one.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isDark = Provider.of<CounterModel>(context , listen : false).toggle();
    // print('this is the value of our state in the provider ' + isDark );
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFF8),
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
                    'assets/welcome.svg',
                    //fit: B,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.1,
                  ),
                ),

                const SizedBox(height : 30),

                const Text(
                    'Who Are We',
                    style : TextStyle(
                      color : Color(0XFFFF006B),
                      fontSize :40,
                    )
                ),

                const SizedBox(height :20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal : 35),
                  child: Container(
                    child: const Text(
                      'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
                      style : TextStyle(
                        color : Colors.black,
                        fontFamily : 'roboto',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height : 90),

                Padding(
                    padding : const EdgeInsets.symmetric(horizontal : 20),
                    child : Container(
                      width : MediaQuery.of(context).size.width  * 0.7,
                      padding : const EdgeInsets.all(20),
                      decoration : BoxDecoration(
                          color :  const Color(0XFFF8F4F4),
                          borderRadius:BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            )
                          ]
                      ),

                      child : GestureDetector(
                        onTap : (){
                          Navigator.push(context , MaterialPageRoute(builder:
                              (context){
                            return const WelcomePageOne();
                          }
                          )
                          );
                        },
                        child: const Center(
                          child:  Text(
                              'Get Started',
                              style : TextStyle(
                                color : Colors.black ,
                                fontWeight : FontWeight.bold,
                                fontSize : 17
                              )
                          ),
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
