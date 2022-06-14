import 'package:flutter/material.dart';

class Event {
  //late DateTime createdTime;
  late String title;
  late String id;
  late String dateTime;
  late bool isDone;

//Constructor
  Event({
    //required this.createdTime ,
    required this.title,
    this.dateTime = '',
    this.id = '',
    this.isDone = false,
  });

//to save this data we need to convert it to a mapp

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': dateTime,
      'isDone': isDone,
    };
  }

  static Event fromJson(Map<String, dynamic> json) => Event(
    id: json['id'],
    title: json['title'],
    dateTime: json['description'],
    isDone: json['isDone'],
  );
}
