import 'package:flutter/material.dart';

class GuestList {
  //late DateTime createdTime;
  late String name;
  late String id;
  bool isDone;

//Constructor
  GuestList({
    //required this.createdTime ,
    this.id = '',
    required this.name,
    this.isDone = false,
  });

//to save this data we need to convert it to a mapp

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone,
    };
  }

  static GuestList fromJson(Map<String, dynamic> json) => GuestList(
        id: json['id'],
        name: json['name'],
        isDone: json['isDone'],
      );
}
