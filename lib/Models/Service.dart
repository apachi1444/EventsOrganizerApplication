import 'dart:core';

class Service {
  final String title;
  final String dateTime;
  final String description;
  final String price;
  final String uidProfessional;
  final String image;

  // final List<String> images;

  Service(
      {required this.image,required this.dateTime,
      required this.title,
      required this.description,
      required this.price,required this.uidProfessional});

  static Service fromJson(Map<String, dynamic> json) => Service(
        image: json['image'],
        dateTime: json['dateTime'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        uidProfessional : json['uidProfessional'],
      );

  Map<String, dynamic> toJson() =>
      {'first_name': title, 'last_name': description, 'age': price};

   String  getDateTime(){
    return dateTime;
  }

  String getDescription(){
    return description;
  }

  String getPrice(){
    return price;
  }

  String getTitle(){
    return title;
  }

  String getUidProfessional(){
    return uidProfessional;
  }

  String getImage(){
    return image;
  }

}
