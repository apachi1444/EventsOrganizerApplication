import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pfs/Models/Task.dart';

class TodoServices {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  Future addTask({
    required String title,
    required String description,
    bool isDone = false,
  }) async {
    final taskCollection = tasks.doc();

    final task = Task(
      id: taskCollection.id,
      title: title,
      description: description,
      isDone: isDone,
    );

    final json = task.toJson();
    await taskCollection.set(json);
  }

  Future<void> deleteTask(String taskId) async {
    await tasks.doc(taskId).delete();
  }

  Future completTask(uid) async {
    await tasks.doc(uid).update({'isDone': true});
  }


}
