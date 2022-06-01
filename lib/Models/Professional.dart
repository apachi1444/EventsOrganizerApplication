class Professional {
  final String first_name;
  final String last_name;
  final int age;
  final String email;
  final String localisation;

  Professional(
      {required this.first_name,
      required this.last_name,
      required this.age,
      required this.email,
      required this.localisation});

  static Professional fromJson(Map<String, dynamic> json) => Professional(
        first_name: json['first_name'],
        last_name: json['last_name'],
        age: json['age'],
        localisation: json['localisation'],
        email: json['email'],
      );
  Map<String, dynamic> toJson() => {
        'first_name': first_name,
        'last_name': last_name,
        'age': age,
        'localisation': localisation,
        'email': email
      };
}
