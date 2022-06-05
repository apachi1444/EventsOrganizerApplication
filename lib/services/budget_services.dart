import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/Budget.dart';

class BudgetServices {
  Future addBudget({required String title, required String prix}) async {
    final taskCollection = FirebaseFirestore.instance.collection('budget').doc();

    final task = Budget(
      id: taskCollection.id,
      title: title,
      prix: prix,
    );

    final json = task.toJson();
    await taskCollection.set(json);
  }

// Stream<List<Task>> readTasks() {
//   return FirebaseFirestore.instance
//       .collection('tasks')
//       .snapshots() //to get docs
//       .map((doc) => Task.fromJson(doc.data()).toL);
// }
}
