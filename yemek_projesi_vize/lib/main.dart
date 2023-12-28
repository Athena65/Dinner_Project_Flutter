import 'package:flutter/material.dart';
import 'package:yemek_projesi_vize/Models/database.dart';
import 'package:yemek_projesi_vize/Screens/LoginPage.dart';
import 'package:yemek_projesi_vize/Screens/homescreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MealBigDatabase.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}
