import 'package:flutter/material.dart';
import 'package:pfs/screens/guestPages/events/budget/addBudget.dart';

import '../../../../extensions/constants.dart';
import '../chickList/MyChickList.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('My Budget'),
            ),
            leading: IconButton(
              onPressed: () {
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyCheckingList(),
                      ));
                });
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

          body: SingleChildScrollView(
            child: Center(
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
                    const SizedBox(height: 15),
                    const Text("Today",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    MainCard(),
                    const Text("Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),

                    detailsCard("traiteur", '10000 DH', Icons.delete),
                    detailsCard("salle", "10000 DH", Icons.delete),
                    detailsCard("Nagafa", "10000 DH", Icons.delete),
                    detailsCard("Robe", "10000 DH", Icons.delete),
                    detailsCard("traiteur", "10000 DH", Icons.delete),
                    const SizedBox(height: 15),

                    Container(
                      decoration: const BoxDecoration(
                          color: Color(ConstantColors.KPinkColor),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            primary: const Color.fromARGB(255, 255, 255, 255)),
                        onPressed: () {
                          WidgetsBinding.instance?.addPostFrameCallback((_) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddBudget(),
                                ));
                          });
                        },
                        child: Container(
                          width: 200,
                          child: Row(
                            children: const [
                              Icon(Icons.add),
                              SizedBox(width: 15),
                              Text('Add Detail',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )

                    //),
                  ],
                ),
              ),
            ),
          ),
          ////////////////////////SafeArea
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: 0,
          //   type: BottomNavigationBarType.shifting,//we can fixed
          //   backgroundColor: Colors.black,
          //   items: const [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home, color: Color(ConstantColors.KPinkColor),),
          //       label: "home",
          //       //title :Text('home'),
          //       backgroundColor: Color.fromARGB(255, 248, 244, 244),),
          //
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.article_outlined, color: Color.fromARGB(255, 0, 0, 0),),
          //       label: "checkList",
          //       //title :Text('home'),
          //       backgroundColor: Color.fromARGB(255, 248, 244, 244),),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0),),
          //       label: "search",
          //       //title :Text('home'),
          //       backgroundColor: Color.fromARGB(255, 248, 244, 244),),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.account_balance, color: Color.fromARGB(255, 0, 0, 0),),
          //       label: "budget",
          //       //title :Text('home'),
          //       backgroundColor: Color.fromARGB(255, 248, 244, 244),),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.person, color: Color.fromARGB(255, 0, 0, 0),),
          //       label: "profile",
          //       //title :Text('home'),
          //       backgroundColor: Color.fromARGB(255, 248, 244, 244),
          //
          //     ),
          //
          //
          //   ],
          //   onTap: (index) {
          //
          //     if(index == 1){
          //       WidgetsBinding.instance?.addPostFrameCallback((_) { Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) =>  Setting(), )) ;});
          //     }
          //   },
          // ),
        ));
  }

  Padding detailsCard(String title, String Budget, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 206, 203, 203),
          border: Border(
            bottom: BorderSide(width: 1.0, color: Color(0x34000000)),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title,
              style: const TextStyle(
                fontSize: 20,
              )),
          Text(
            Budget,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0x34000000),
            ),
          ),
          Icon(icon, color: const Color(ConstantColors.KPinkColor), size: 30),
        ]),
      ),
    );
  }
// SwitchSettingsTile
}

Padding CheckingCard(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    child: Container(
      width: 170,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 248, 244, 244),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            offset: Offset(
              3,
              3,
            ),
          ),
        ],
      ),
      child: Container(
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
                ),
                subtitle: Text('0/100'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Padding MainCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                CheckingCard("My current budget", Icons.account_balance),
                CheckingCard("Total", Icons.account_balance),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
