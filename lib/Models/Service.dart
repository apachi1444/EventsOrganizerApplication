import 'dart:core';

class Service {
  final String title;
  final String dateTime;
  final String description;
  final int price;

  // final List<String> images;

  Service(
      {required this.dateTime,
      required this.title,
      required this.description,
      required this.price});

  static Service fromJson(Map<String, dynamic> json) => Service(
        dateTime: json['dateTime'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() =>
      {'first_name': title, 'last_name': description, 'age': price};

  String  getDateTime(){
    return dateTime;
  }
}
