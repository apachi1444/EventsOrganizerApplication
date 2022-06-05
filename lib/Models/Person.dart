// class Person {
//
//   final String first_name;
//   final String last_name;
//   final int age;
//
//   Person({required this.first_name, required this.last_name,required this.age});
//
//   static Person fromJson(Map<String , dynamic> json) =>
//     Person(
//         first_name: json['first_name'],
//         last_name: json['last_name'],
//         age : json['age'],
//     );
//   Map<String , dynamic> toJson() =>{
//     'first_name'  : first_name,
//     'last_name' : last_name,
//     'age' : age
//   };
// }