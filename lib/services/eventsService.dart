import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/services/authService.dart';

import '../Models/Service.dart';

class EventsService {
  String? eventUid;
  String? guestUid = AuthService().getCurrentIdUser();

  EventsService({required this.eventUid});

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

  Future<int> getLengthOfTasksInEvent() {
    return guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('budget')
        .snapshots()
        .length;
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

  Future<int> getLengthOfBudgetInEvent() {
    return guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('budget')
        .snapshots()
        .length;
  }

// --------------------------------- //
// this part for the budget //

// --------------------------------- //
// this part for the professionals //

  Future addProfessionalServiceToEvent(
      String title,
      String imageCategory,
      String professionalFirstName,
      String professionalLastName,
      String price,
      String description) async {
    return await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('professionals')
        .add({
      'title': title,
      'imageCategory': imageCategory,
      'professionalLastName': professionalLastName,
      'professionalFirstName': professionalFirstName,
      'price': price,
      'description': description,
      'uid': DateTime.now().toString()
    }).then((value) => guestsCollection
            .doc(guestUid)
            .collection('events')
            .doc(eventUid)
            .collection('professionals')
            .doc(value.id)
            .update({'uid': value.id}));
  }

  Future<void> deleteSpecificProfessionalFromEventBudget(
      String professionalUid) async {
    await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('professionals')
        .doc(professionalUid)
        .delete();
  }

  Stream<QuerySnapshot> professionalStream() {
    return guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('professionals')
        .snapshots();
  }

  Future<QuerySnapshot> professionalFutureList() {
    return guestsCollection.doc(guestUid).collection('professionals').get();
  }

  Future<int> getLengthOfProfessionalInEvent() {
    return guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('professionals')
        .snapshots()
        .length;
  }

// --------------------------------- //
// this part for the professionals //

// this part for all lengths of services //
// ------------------------------------ //

  Future<List<int>> getLengthOfAllElementsInEvent() async {
    int lengthProfessional = await getLengthOfProfessionalInEvent();
    int lengthTasks = await getLengthOfTasksInEvent();
    print(
        "this is the length of professionals " + lengthProfessional.toString());

    Future<QuerySnapshot> allProfessionals = professionalFutureList();
    print("this is the future of all professionals " + allProfessionals.toString());

    List<int> allLengths = [];
    allLengths.add(lengthProfessional);
    allLengths.add(lengthTasks);

    return allLengths;
  }

// this part for all lengths of services //
// ------------------------------------ //

}
