import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pfs/extensions/constant_colors.dart';
import 'package:pfs/screens/guestPages/events/budget/BudgetPage.dart';
import 'package:pfs/screens/guestPages/events/chickList/addEvenet.dart';
import 'package:pfs/screens/guestPages/events/event/todoList_page.dart';
import 'package:pfs/screens/guestPages/events/guest/guestPage.dart';

import '../../../professionalPages/parametersPages/settings/settings_page.dart';
class MyCheckingList extends StatelessWidget {
  const MyCheckingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCheckList(),
    );
  }
}

class MyCheckList extends StatefulWidget {
  const MyCheckList({Key? key}) : super(key: key);

  @override
  State<MyCheckList> createState() => MyCheckListState();
}

class MyCheckListState extends State<MyCheckList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Container(
              child: const Center(
                child: Text('My Checking List'),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) =>  const Setting(), )) ;});

              },
              color: Colors.black,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 0, 107),
          ),
          // backgroundColor: Color.fromARGB(255, 198, 127, 121),

          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                // color: Color.fromARGB(255, 231, 178, 204),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),

              child: Column(
                children: [
                  //GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10),

                  // MainCard("My check List"),
                  //
                  // MainCard("My Plannning"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 252, 252, 252),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Container(
                        child: Center(
                          child: Column(
                            children: [
                              const Text("My check List",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              const SizedBox(height: 15),
                              Center(
                                child: Row(
                                  children: [

                                TextButton(
                                    style: TextButton.styleFrom(
                                    primary: const Color.fromARGB(255, 0, 0, 0)),
                                    onPressed: () {
                                            WidgetsBinding.instance?.addPostFrameCallback((_) { Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => const Guest(), )) ;});
                                    },
                                    child:CheckingCard("Guest", Icons.account_balance),
                                ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                          primary: const Color.fromARGB(255, 0, 0, 0)),
                                      onPressed: () {
                                        WidgetsBinding.instance?.addPostFrameCallback((_) { Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => const TodoList(), )) ;});
                                      },
                                      child:CheckingCard("To Do List", Icons.article),
                                    ),
                                  ],
                                ),
                              ),
                                  Row(
                                    children: [
                                      CheckingCard("Proffitionnel", Icons.wallet_travel),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            primary: const Color.fromARGB(255, 0, 0, 0)),
                                        onPressed: () {
                                          WidgetsBinding.instance?.addPostFrameCallback((_) { Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => const BudgetPage(), )) ;});
                                        },
                                      child:CheckingCard("Budget", Icons.wallet_travel),
                                      ),
                                    ],
                                  )

                            ],
                          ),

                        ),
                      ),
                    ),
                  ),

                ],
              ),

              // child: Container(
              //    child : const Text("My checklist asmae ",style: TextStyle(fontSize: 18),),
              //
              //
              //
              //   decoration: BoxDecoration(
              //
              //     border: Border.all(
              //         color: const Color(0xFF000000),
              //         width: 2.0,
              //         style: BorderStyle.values.first,), //Border.all
              //     /* The BorderRadius widget  is here */
              //     borderRadius: const BorderRadius.all(
              //       Radius.circular(20),
              //     ), //BorderRadius.all
              //   ), //BoxDecoration
              // ),
            ),
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            Navigator.pushReplacement( context,
                MaterialPageRoute( builder: (context) =>  const AddEvent(), )) ;});
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Event'),
        backgroundColor: const Color(ConstantColors.KPinkColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        );


  }
// SwitchSettingsTile
}

Padding CheckingCard(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Center(
      child: Container(
        width: 120,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 248, 244, 244),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              offset: Offset(
                5,
                5,
              ),
            ),
          ],
        ),
        //child: GestureDetector(
        //   onTap:
        //   () {
        //     // { Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => const BudgetPage(), )) ;};
        //   },
        //

        child:Container(
          child: Column(
            //mainAxisSize: MainAxisSize.min,

            children: [
              SizedBox(height: 15),
              Icon(
                icon,
                size: 40,
              ), //text=Icons.account_balance
              Align(
                alignment: Alignment.topRight,
                child: ListTile(
                  title: Text(
                    title,
                    style: TextStyle(fontSize: 13),
                  ),
                  subtitle: Text('0/100'),
                ),
              ),
            ],
          ),
        ),

      ),
    ),
  );
}

Padding MainCard(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 252, 252, 252),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Container(
        child: Column(
          children: [
            Text(title,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 15),
            Row(
              children: [
                CheckingCard("Guist", Icons.account_balance),
                CheckingCard("To Do List", Icons.article),
                CheckingCard("Proffitionnel", Icons.wallet_travel),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}