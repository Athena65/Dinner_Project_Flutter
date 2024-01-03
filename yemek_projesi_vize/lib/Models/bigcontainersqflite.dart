import 'dart:convert';

class BigMeal {
  final int id;
  final String name;
  final String image;
  final String time;
  final String ratting;
  BigMeal(
      {required this.id,
        required this.name,
        required this.ratting,
        required this.time,
        required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id':id,
      'name': name,
      'image': image,
      'time': time,
      'ratting': ratting
    };
  }
  factory BigMeal.fromMap(Map<String,dynamic>map)
  {
    return BigMeal(
      id:map['id'] as int,
      name:map['name'] as String,
      image:map['image'] as String,
      time:map['time'] as String,
      ratting:map['ratting'] as String,
    );
  }
  String toJson()=> json.encode(toMap());
  factory BigMeal.fromJson(String source) =>
      BigMeal.fromMap(json.decode(source) as Map<String,dynamic>);
}
