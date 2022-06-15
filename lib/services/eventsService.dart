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

  // --------------------------------- //
  // this part for the guests //

  Future addGuestToEventGuestList(String title) async {
    return await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('guestsList')
        .add({'title': title, 'uid': DateTime.now().toString()}).then(
            (element) => guestsCollection
                .doc(guestUid)
                .collection('events')
                .doc(eventUid)
                .collection('guestsList')
                .doc(element.id)
                .update({'uid': element.id}));
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

  Stream<QuerySnapshot> guestsStream() {
    return guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('guestsList')
        .snapshots();
  }

  // --------------------------------- //
  // this part for the guests //

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

  Future finishedOrNotTask(String taskUid, bool isChecked) async {
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

  // --------------------------------- //
  // this part for the budget //
  Future addBudgetToEventBudget(String title, String price) async {
    return await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('budget')
        .add({
      'title': title,
      'price': price,
      'uid': DateTime.now().toString()
    }).then((value) => guestsCollection
            .doc(guestUid)
            .collection('events')
            .doc(eventUid)
            .collection('budget')
            .doc(value.id)
            .update({'uid': value.id}));
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

  Stream<QuerySnapshot> budgetStream() {
    return guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('budget')
        .snapshots();
  }

// --------------------------------- //
// this part for the budget //

// --------------------------------- //
// this part for the professionals //

  Future addProfessionalServiceToEvent(Service service) async {
    // return await guestsCollection
    //     .doc(guestUid)
    //     .collection('events')
    //     .doc(eventUid)
    //     .collection('servicesWanted')
    //     .add();
  }

// --------------------------------- //
// this part for the professionals //

}
