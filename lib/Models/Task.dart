import 'package:flutter/material.dart';

class Task {
  //late DateTime createdTime;
  late String title;
  late String id;
  late String description;
  late bool isDone;

//Constructor
  Task({
    //required this.createdTime ,
    required this.title,
    this.description = '',
    this.id = '',
    this.isDone = false,
  });

//to save this data we need to convert it to a mapp

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
    };
  }

  static Task fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );
}
