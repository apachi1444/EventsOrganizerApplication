import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/constants.dart';
import '../../../../services/eventsService.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key, this.eventUid}) : super(key: key);
  final String? eventUid;

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  TextEditingController budgetTitleController = TextEditingController();
  TextEditingController budgetDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _eventsService = EventsService(eventUid: widget.eventUid);
    final budgetStream = _eventsService.budgetStream();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('My Budget'),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 0, 107),
          ),
          // backgroundColor: Color.fromARGB(255, 198, 127, 121),

          body: StreamBuilder<QuerySnapshot>(
              stream: budgetStream,
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading');
                }


                return Center(
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
                        const Text('Today',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        MainCard(),
                        const Text('Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  snapshot.data!.docs[index];
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: detailsCard(
                                    _eventsService,
                                    documentSnapshot['title'],
                                    documentSnapshot['price'],
                                    Icons.delete,
                                    documentSnapshot),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 15),

                        Container(
                          margin : const EdgeInsets.all(30),
                          decoration: const BoxDecoration(
                              color: Color(ConstantColors.KPinkColor),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              )),
                          child: SingleChildScrollView(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 20),
                                    title: Row(children: [
                                      const Text(
                                        'Add New Detail',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(Icons.cancel,
                                            color: Colors.grey),
                                      ),
                                    ]),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8),
                                        TextFormField(
                                          controller: budgetTitleController,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            //height: 1.5,

                                            //color: Color.fromARGB(255, 95, 18, 119),
                                          ),
                                          decoration: const InputDecoration(
                                            hintText: 'Title',
                                            hintStyle: TextStyle(
                                              color:
                                                  Color.fromARGB(179, 63, 60, 60),
                                            ),
                                            //border: UnderlineInputBorder(),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        TextFormField(
                                          controller: budgetDescriptionController,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            // height: 1,
                                            //color: Color.fromARGB(255, 216, 81, 81),
                                          ),
                                          decoration: const InputDecoration(
                                            hintText: 'Prix',
                                            hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    179, 63, 60, 60)),
//                border: UnderlineInputBorder(),
                                          ),
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          final title =
                                              budgetTitleController.text;
                                          final description =
                                              budgetDescriptionController.text;
                                          EventsService(eventUid: widget.eventUid)
                                              .addBudgetToEventBudget(
                                                  title, description);
                                          budgetDescriptionController.clear();
                                          budgetTitleController.clear();
                                          Navigator.pop(context, 'add');
                                        },
                                        child: const Center(child: Text('add')),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.add),
                                    SizedBox(width: 15),
                                    Center(
                                      child: Text('Add Detail',
                                          style: TextStyle(
                                            fontSize: 20,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )

                        //),
                      ],
                    ),
                  ),
                );
              })),
    );
  }

  Padding detailsCard(EventsService eventsService, String title, String budget,
      IconData icon, DocumentSnapshot fct) {
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
            budget,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0x34000000),
            ),
          ),
          IconButton(
              onPressed: () {
                eventsService.deleteSpecificBudgetFromEventBudget(fct.id);
              },
              icon: Icon(icon,
                  color: const Color(ConstantColors.KPinkColor), size: 30))
        ]),
      ),
    );
  }
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
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          Icon(
            icon,
            size: 40,
            color: const Color(ConstantColors.KPinkColor),
          ),
          const SizedBox(height : 15),
          Text(title , style : const TextStyle(
            fontSize:  16, color: Color(ConstantColors.KPinkColor)
          )),
          const SizedBox(height : 13),
          // const Text('0/100' , style: TextStyle(
          //   fontSize: 20
          // ),),
        ],
      ),
    ),
  );
}

Padding MainCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              CheckingCard('My current budget', Icons.account_balance),
              CheckingCard('Total', Icons.account_balance),
            ],
          ),
        ],
      ),
    ),
  );
}
