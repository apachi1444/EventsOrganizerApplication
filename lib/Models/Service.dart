import 'dart:core';

class Service {
  final String title;
  final String description;
  final int price;
  // final List<String> images;

  Service(
      {required this.title, required this.description, required this.price});

  static Service fromJson(Map<String, dynamic> json) => Service(
        title: json['title'],
        description: json['description'],
        price: json['price'],
      );
  Map<String, dynamic> toJson() =>
      {'first_name': title, 'last_name': description, 'age': price};
}