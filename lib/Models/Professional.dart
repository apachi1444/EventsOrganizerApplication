class Professional {
  final String uid;
  final String first_name;
  final String last_name;
  final String age;
  final String email;
  final String localisation;

  Professional(
      {required this.uid,
      required this.first_name,
      required this.last_name,
      required this.age,
      required this.email,
      required this.localisation});

  static Professional fromJson(Map<String, dynamic> json)
      {
        print(json);
        return Professional(
          uid: json['uid'],
          first_name: json['first_name'],
          last_name: json['last_name'],
          age: json['age'],
          localisation: json['localisation'],
          email: json['email'],
        );
      }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'first_name': first_name,
        'last_name': last_name,
        'age': age,
        'localisation': localisation,
        'email': email
      };

  String getLocalisation() {
    return localisation;
  }

  String getFirstName() {
    return first_name;
  }

  String getLastName() {
    return last_name;
  }

  String getEmail() {
    return email;
  }

  String getUid() {
    return uid;
  }
}
