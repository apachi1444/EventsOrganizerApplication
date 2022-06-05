class Guest {
  final String name;
  final String localisation;

  Guest({required this.name, required this.localisation});

  static Guest fromJson(Map<String, dynamic> json) => Guest(
        localisation: json['localisation'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {'localisation': localisation, 'name': name};
}

class GuestData{

}
