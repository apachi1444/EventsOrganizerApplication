class Userr {
  final String uid;

  Userr({required this.uid});
}

class UserData {
  final String uid;
  final String first_name;
  final String last_name;
  final int age;
  final String localisation;

  UserData(
      {required this.localisation,
      required this.uid,
      required this.first_name,
      required this.last_name,
      required this.age});

  String get firstName {
    return first_name;
  }
}
