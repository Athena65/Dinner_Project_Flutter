class DistInfo {
  final String name;
  final String name2;
  final String image;
  final String description;
  final String price;
  int id;
  int totalPrice;
  String ratting;
  DistInfo({
    required this.name,
    required this.price,
    required this.totalPrice,
    required this.description,
    required this.name2,
    required this.image,
    required this.ratting,
    required this.id,
  });
}

List smallcon = [
  DistInfo(
      id: 3,
      description:
          "Tadına Doyulmaz Doritos'lu Mega Çiğ Köfte Dürüm ve Salata Menü.",
      price: "${150} TL",
      totalPrice: 150,
      name: "Çiğköfte",
      name2: "Doritoslu Çiğköfte Menü",
      ratting: " 5/5 Süper (103)",
      image:
          "https://serincecigkofte.com/images/haberler/doritoslu-cigkofte-nasil-kesfedildi-671963.jpg"),
  DistInfo(
      id: 2,
      description:
          "Fırınlanmış patates içinin çeşitli mezeler ve soslarla harmanlanması ile ortaya çıkan lezzeti şahane, oldukça doyurucu ve "
          "kalorisi yüksek kumpir.",
      price: "${125} TL",
      totalPrice: 125,
      name: "Kumpir",
      name2: " 3 Malzemeli Kumpir",
      ratting: " 4/5 Çok İyi (65)",
      image:
          "https://www.mutfagimdantarifler.com/wp-content/uploads/2017/04/kumpir.jpg"),
  DistInfo(
      id: 1,
      description: "Sokak lezzetleri denildiğinde ilk akla gelen tavuk döner.",
      name: "Döner",
      price: "${45} TL",
      totalPrice: 45,
      name2: "Tavuk Döner 100g",
      ratting: " 3/5 İyi (50)",
      image:
          "https://i.lezzet.com.tr/images-xxlarge-recipe/tavuk-doner-d35e16f6-d541-4a18-a766-1ab3e5368e86.jpg"),
  DistInfo(
      id: 4,
      name: "Pizza",
      description:
          "Orta boy Süperix ve Bol Etli ikilisi, Efsane Tadıyla Sizlerle.",
      price: "${200} TL",
      totalPrice: 200,
      name2: " Orta Boy 2li Pizza",
      ratting: " 2/5 Normal (202)",
      image:
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/23/6c/94/5a/antique-pizzeria.jpg?w=600&h=-1&s=1  "),
];
