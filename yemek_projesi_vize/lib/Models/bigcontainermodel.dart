class DispInfo2 {
  String name;
  String image;
  String time;
  String ratting;
  DispInfo2(
      {required this.name,
        required this.ratting,
        required this.time,
        required this.image});
}

List BigCon = [
  DispInfo2(
      name: "Sokak Döner",
      ratting: " 3/5 İyi (50)",
      time: " 35-40 dakika",
      image:
      "https://images.deliveryhero.io/image/fd-tr/LH/c9ay-hero.jpg"),
  DispInfo2(
      name: "Ortaköy Kumpir",
      ratting: " 4/5 Çok İyi (65)",
      time: " 20-40 dakika",
      image:
      "https://tarifpaylasimlari.com/wp-content/uploads/2019/02/kumpir-1.jpg"),
  DispInfo2(
      name: "Çiğköfte Evreni",
      ratting: " 5/5 Süper (103)",
      time: " 10-20 dakika",
      image:
      "https://cdn.yemek.com/mnresize/1250/833/uploads/2022/01/etsiz-cig-kofte-fatma.jpg"),
  DispInfo2(
      name: "Pitza",
      ratting: " 2/5 Normal (202)",
      time: " 35-50 dakika",
      image:
      "https://cdn.loveandlemons.com/wp-content/uploads/2023/02/vegetarian-pizza.jpg"),
];
