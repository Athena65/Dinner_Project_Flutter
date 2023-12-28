import 'package:flutter/material.dart';
import 'package:yemek_projesi_vize/Models/User1.dart';
import 'package:yemek_projesi_vize/Screens/homescreen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  String title = "Yemek Uygulaması";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User1 user= Users[0];
  TextEditingController ad = TextEditingController();
  TextEditingController parola = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Uygulamaya Hoşgeldin ${user.username}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: ad,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "aaa@aaa.com",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: parola,
              decoration: InputDecoration(
                labelText: "Parola",
                hintText: "Parolanızı girin",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    bool isAuthenticated = false;

                    for (User1 user in Users) {
                      if (ad.text.toString() == user.email &&
                          parola.text.toString() == user.password) {
                        isAuthenticated = true;
                        break;
                      }
                    }

                    if (isAuthenticated) {
                      String sonuc = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(sonuc)),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Parola veya Kullanıcı adı hatalıdır"),
                        ),
                      );
                    }
                  },
                  child: Text("Giriş"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
