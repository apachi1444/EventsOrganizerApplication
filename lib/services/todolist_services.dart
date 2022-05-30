import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/Task.dart';

class TodoServices {
  Future addTask({required String title, required String description}) async {
    final taskCollection = FirebaseFirestore.instance.collection('tasks').doc();

    final task = Task(
      id: taskCollection.id,
      title: title,
      description: description,
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
