import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/services/authService.dart';

import '../Models/Service.dart';

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

  Future addTaskToEventToDoList(String title, String description) async {
    return await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('todoList')
        .add({'title': title, 'description': description});
  }

  Future addBudgetToEventBudget(String title, String price) async {
    return await guestsCollection
        .doc(guestUid)
        .collection('events')
        .doc(eventUid)
        .collection('budget')
        .add({'title': title});
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
