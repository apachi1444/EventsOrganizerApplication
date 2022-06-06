import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/Task.dart';

class TodoServices {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  Future addTask({required String title, required String description}) async {
    final taskCollection = tasks.doc();

    final task = Task(
      id: taskCollection.id,
      title: title,
      description: description,
    );

    final json = task.toJson();
    await taskCollection.set(json);
  }

  Future<void> deleteTask(String taskId) async {
    await tasks.doc(taskId).delete();
  }

  Stream<List<Task>> readTasks() {
    return FirebaseFirestore.instance.collection('tasks').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => (Task.fromJson(doc.data()))).toList());
  }
}
