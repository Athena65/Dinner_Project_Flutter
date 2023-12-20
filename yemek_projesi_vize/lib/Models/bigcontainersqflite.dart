import 'dart:convert';

class BigMeal {
  int id;
  String name;
  String image;
  String time;
  String ratting;
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

/*List BigCon = [
  DispInfo2(
      id: 1,
      name: "Sokak Döner",
      ratting: " 3/5 İyi (50)",
      time: " 35-40 dakika",
      image: "https://images.deliveryhero.io/image/fd-tr/LH/c9ay-hero.jpg"),
  DispInfo2(
      id: 2,
      name: "Ortaköy Kumpir",
      ratting: " 4/5 Çok İyi (65)",
      time: " 20-40 dakika",
      image:
      "https://tarifpaylasimlari.com/wp-content/uploads/2019/02/kumpir-1.jpg"),
  DispInfo2(
      id: 3,
      name: "Çiğköfte Evreni",
      ratting: " 5/5 Süper (103)",
      time: " 10-20 dakika",
      image:
      "https://cdn.yemek.com/mnresize/1250/833/uploads/2022/01/etsiz-cig-kofte-fatma.jpg"),
  DispInfo2(
      id: 4,
      name: "Pitza",
      ratting: " 2/5 Normal (202)",
      time: " 35-50 dakika",
      image:
      "https://cdn.loveandlemons.com/wp-content/uploads/2023/02/vegetarian-pizza.jpg"),
];
*/