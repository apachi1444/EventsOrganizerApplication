import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/services/authService.dart';

import '../Models/Service.dart';
import '../screens/guestPages/events/event/event.dart';

class EventsService {
  String? eventUid;
  String? guestUid = AuthService().getCurrentIdUser();

  EventsService({required this.eventUid}) {}

  final guestsCollection = FirebaseFirestore.instance.collection('guests');
  final guestsCollectionOfParticularEvent =
      FirebaseFirestore.instance.collection('guestsList');
  final eventsCollection = FirebaseFirestore.instance.collection('events');

  Future addGuestToEventGuestList(String title) async {
    return await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('guestsList')
        .add({'title': title});
  }

  Future<void> deleteSpecificGuestFromEventGuests(String guestEventUid) async {
    await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('guestsList')
        .doc(guestEventUid)
        .delete();
  }

  // --------------------------------- //
  // this part for the tasks //

  Future addTaskToEventToDoList(String title, String description) async {
    guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('todoList')
        .add({
      'isDone': false,
      'title': title,
      'description': description,
      'uid': DateTime.now().toString()
    }).then((element) => guestsCollection
            .doc(guestUid)
            .collection('events')
            .doc(eventUid)
            .collection('todoList')
            .doc(element.id)
            .update({'uid': element.id}));
  }

  Future<void> deleteSpecificTaskFromEventTasks(String taskUid) async {
    await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('todoList')
        .doc(taskUid)
        .delete();
  }

  Stream<QuerySnapshot> tasksStream() {
    return guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('todoList')
        .snapshots();
  }

  Future finishedOrNotTask(String taskUid , bool isChecked) async {
    // var snapshot = await guestsCollection
    //     .doc(guestUid)
    //     .collection('events')
    //     .doc(eventUid)
    //     .collection('todoList')
    //     .doc(taskUid)
    //     .get();
    // var currentIsDoneValue = snapshot.data()!['isDone'];
    // print(currentIsDoneValue);
    guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('todoList')
        .doc(taskUid)
        .update({'isDone': isChecked ? true : false});
  }

  // --------------------------------- //
  // this part for the tasks //

  Future addBudgetToEventBudget(String title, String price) async {
    return await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('budget')
        .add({'title': title});
  }

  Future<void> deleteSpecificBudgetFromEventBudget(String budgetUid) async {
    await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('budget')
        .doc(budgetUid)
        .delete();
  }

// Future addProfessionalServiceToEvent(Service service) async{
//   return await guestsCollection
//       .doc(guestUid)
//       .collection('events')
//       .doc(eventUid)
//       .collection('servicesWanted')
//       .add(Service.fromJson(json));
// }

}
