import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfs/Models/Budget.dart';

class BudgetServices {
  final budgets = FirebaseFirestore.instance.collection('budget');
  Future addBudget({required String title, required String prix}) async {
    final budgetCollection = budgets.doc();

    final task = Budget(
      id: budgetCollection.id,
      title: title,
      prix: prix,
    );

    final json = task.toJson();
    await budgetCollection.set(json);
  }

  Future<void> deleteBudget(String guestId) async {
    await budgets.doc(guestId).delete();
  }

  Stream<List<Budget>> readguests() {
    return FirebaseFirestore.instance.collection('budget').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => (Budget.fromJson(doc.data()))).toList());
  }
}
