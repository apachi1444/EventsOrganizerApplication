import 'package:flutter/material.dart';

class Budget {
  //late DateTime createdTime;
  late String title;
  late String id;
  late String prix;
  late bool isDone;

//Constructor
  Budget({
    //required this.createdTime ,
    required this.title,
    this.prix = '',
    this.id = '',
    this.isDone = false,
  });

//to save this data we need to convert it to a mapp

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": prix,
    };
  }

  static Budget fromJson(Map<String, dynamic> json) => Budget(
    id: json['id'],
    title: json['title'],
    prix: json['description'],
  );
}
