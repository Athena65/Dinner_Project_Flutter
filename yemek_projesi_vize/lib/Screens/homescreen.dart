import 'package:flutter/material.dart';
import 'package:yemek_projesi_vize/Models/bigcontainersqflite.dart';
import 'package:yemek_projesi_vize/Models/database.dart';
import 'package:yemek_projesi_vize/Models/smallcontainermodel.dart';
import 'package:yemek_projesi_vize/Screens/LoginPage.dart';
import 'package:yemek_projesi_vize/Screens/ProfilePage.dart';
import 'package:yemek_projesi_vize/Screens/detailscreen.dart';
import 'package:yemek_projesi_vize/Utilities/colors.dart';
import 'package:yemek_projesi_vize/Utilities/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _iconColor = whiteclr;
  String sonuc = "";
  var items = <BigMeal>[];
  late List<BigMeal> filteredItems = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      final meals = await MealBigDatabase.instance.readAll();
      setState(() {
        items = meals;
        filteredItems = List.from(meals);
      });
    } catch (e) {
      print("Veri tabanina ulaşmada ve verileri almada hata: $e");
    }
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredItems = items;
      });
    } else {
      setState(() {
        filteredItems = items
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: backgroundclr,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      LoginPage()));
                    }, icon: Icon(Icons.exit_to_app)),
                    Container(
                      height: screenSize.height * 0.065,
                      width: screenSize.width * 0.005,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Şuraya Teslim et",
                          style: TextStyle(
                              color: whiteclr,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.002,
                        ),
                        const Text(
                          "34930 Şen Cad. No:20",
                          style: TextStyle(
                            color: primaryclr,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));

                      },
                      child: Container(
                        height: screenSize.height * 0.065,
                        width: screenSize.width * 0.115,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/myProfilePhoto.jpeg"),
                      
                              /*image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREGaDqIaSQ4WWpyyPYM-o2Jv0OjwGn8a00cryWnI1o3uPGfSvTekNrMXwBUuWq1WSTjfo&usqp=CAU")*/
                            ),
                            color: lbackgroundclr,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                const Text(
                  "   Ne Sipariş vermek istersiniz?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: whiteclr,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.027,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.065,
                      width: screenSize.width * 0.941,
                      child: TextFormField(
                        onChanged: (value) {
                          print("Search text changed: $value");
                          filterSearchResults(value);
                        },
                        controller: _searchController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              filterSearchResults("");
                            },
                          ),
                          hintText: "Restorant veya yemek bul...",
                          hintStyle: const TextStyle(color: Colors.grey),
                          fillColor: lbackgroundclr,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.027,
                ),
                SizedBox(
                  height: screenSize.height * 0.185,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: smallcon.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (() async {
                            sonuc = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => DetailScreen(
                                      details: smallcon[index],
                                      detail: items[index],
                                      selectedItemId: filteredItems[index].id,
                                    )),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(SnackBar(content: Text(sonuc)));
                          }),
                          child: Container(
                            width: screenSize.width * 0.22,
                            decoration: BoxDecoration(
                              color: lbackgroundclr,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenSize.height * 0.1,
                                    width: screenSize.width * 0.2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                smallcon[index].image)),
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  Text(
                                    smallcon[index].name,
                                    style: const TextStyle(color: whiteclr),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.015,
                ),
                const Text(
                  "Restorantlar",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: whiteclr,
                    fontSize: 21,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.020,
                ),
                SizedBox(
                  height: screenSize.height * 0.357,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredItems.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: (() async {
                                sonuc = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => DetailScreen(
                                          details: smallcon[index],
                                          detail: filteredItems[index],
                                          selectedItemId: filteredItems[index].id,
                                        )),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(
                                      SnackBar(content: Text(sonuc)));
                              }),
                              child: Container(
                                width: screenSize.width * 0.65,
                                decoration: BoxDecoration(
                                  color: lbackgroundclr,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: screenSize.height * 0.19,
                                      width: screenSize.width * 0.65,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              filteredItems[index].image),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                filteredItems[index].name,
                                                style: const TextStyle(
                                                    color: whiteclr,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.alarm,
                                                    size: 16,
                                                    color: Color(
                                                      0xff513330,
                                                    ),
                                                  ),
                                                  Text(
                                                    filteredItems[index].time,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: whiteclr),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.005,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Color(0xffFCD506),
                                                size: 16,
                                              ),
                                              Text(
                                                filteredItems[index].ratting,
                                                style: const TextStyle(
                                                    fontSize: 14.5,
                                                    color: whiteclr),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.009,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: const Color(
                                                        0xff40404B)),
                                                height:
                                                    screenSize.height * 0.045,
                                                width: screenSize.width * 0.18,
                                                child: const Center(
                                                  child: Text(
                                                    "Fast food",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: whiteclr),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width * 0.025,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: const Color(
                                                        0xff40404B)),
                                                height:
                                                    screenSize.height * 0.045,
                                                width: screenSize.width * 0.18,
                                                child: const Center(
                                                  child: Text(
                                                    "Ücretsiz",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: whiteclr),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width * 0.025,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: const Color(
                                                        0xff40404B)),
                                                height:
                                                    screenSize.height * 0.045,
                                                width: screenSize.width * 0.18,
                                                child: const Center(
                                                  child: Text(
                                                    "Popüler",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: whiteclr),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (_iconColor == whiteclr) {
                                                _iconColor = Colors.red;
                                                ScaffoldMessenger.of(context)
                                                  ..removeCurrentSnackBar()
                                                  ..showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Ürün Favoriye Eklendi")));
                                              } else {
                                                _iconColor = whiteclr;
                                                ScaffoldMessenger.of(context)
                                                  ..removeCurrentSnackBar()
                                                  ..showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Ürün Favoriden Çıkarıldı")));
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.favorite_rounded,
                                            size: 25,
                                            color: _iconColor,
                                          )),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
