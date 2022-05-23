import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget  {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  Setting({Key? key}) : super(key: key);

  onChangeFunction1(bool newVAlue1){

    valNotify1 = newVAlue1;
  }
  onChangeFunction2(bool newVAlue2){

    valNotify2 = newVAlue2;
  }
  onChangeFunction3(bool newVAlue3){

    valNotify3 = newVAlue3;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('My Settings'),

          ),
          leading: IconButton(
            onPressed: () {},
            color: Colors.black, icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 0, 107),
        ),
        // backgroundColor: Color.fromARGB(255, 198, 127, 121),
        body: Container(

          padding:EdgeInsets.all(10),
          child:ListView(
            children:  [
              const SizedBox(height: 40,),

              Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.add_moderator,color: Colors.black,),
                      SizedBox(width: 10,),
                      Text('Privacy Settings',style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold ),),
                      SizedBox(width: 160,),
                      Icon(Icons.arrow_downward),
                    ],
                  ),
                  const Divider(height: 20,thickness: 1.5,color: Colors.black,),
                  const SizedBox(height: 20,),


                  const SizedBox(height: 10,),
                  buildNotificationOption("Show Profile To Others",valNotify1,onChangeFunction1),
                  buildNotificationOption("Allow Recommendations",valNotify2,onChangeFunction2),
                  buildNotificationOption("Show Profile To others",valNotify3,onChangeFunction3),
                  const SizedBox(height: 40,),

// others Settings
                  Row(
                    children: const [
                      Icon(Icons.add_moderator,color: Colors.black,),
                      SizedBox(width: 10,),
                      Text('Others Settings',style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold ),),
                      SizedBox(width: 160,),
                      Icon(Icons.arrow_downward),
                    ],
                  ),
                  const Divider(height: 20,thickness: 1.5,color: Colors.black,),
                  buildNotificationOption("Show Profile To Others",valNotify1,onChangeFunction1),
                  buildNotificationOption("Allow Recommendations",valNotify2,onChangeFunction2),
                  buildNotificationOption("Show Profile To others",valNotify3,onChangeFunction3),

                  const SizedBox(height: 20,),



                ],
              )
            ],
          ),

        ),// SafeArea



      ),


    );


  }
// SwitchSettingsTile
}

Padding buildNotificationOption(String title,bool value,Function onCangeMethode){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.person,),
          Text(title,style: const TextStyle(

            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: const Color.fromARGB(255, 0, 205, 76),
              trackColor: const Color.fromARGB(255, 255, 0, 107),
              value: value,
              onChanged: (bool newValue){
                onCangeMethode(newValue);
              },
            ),
          )
        ],
      ),
    ),



  );


}
