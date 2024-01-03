import 'package:flutter/material.dart';
import 'package:yemek_projesi_vize/Models/User1.dart';
import 'package:yemek_projesi_vize/Screens/homescreen.dart';
import 'package:yemek_projesi_vize/Utilities/colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  String title = "Burak Best Yemek";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User1 user = Users[0];
  TextEditingController ad = TextEditingController();
  TextEditingController parola = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundclr,
      appBar: AppBar(
        backgroundColor: primaryclr,
        title: Text(widget.title),
        automaticallyImplyLeading: false, //geri tusunu kaldirir
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage(
                  "https://media.istockphoto.com/id/531725257/tr/foto%C4%9Fraf/fire-letter-on-black-background.jpg?s=612x612&w=0&k=20&c=1st0DEetK0nAgekj1DZnPDGNoaDW5xjrTl_2qOb8HUk="),
              width: 150,
              height: 150,
            ),
            Text(
              "Uygulamaya Hoşgeldin ${user.username}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: messageclr,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: ad,
              style: TextStyle(color: whiteclr),
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "aaa@aaa.com",
                hintStyle: TextStyle(color: whiteclr),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: parola,
              style: TextStyle(color: whiteclr),
              decoration: InputDecoration(
                labelText: "Parola",
                hintText: "Parolanızı girin",
                hintStyle: TextStyle(color: whiteclr),
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
                      } else if (ad.text.toString().trim() == "" ||
                          parola.text.toString().trim() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Parola veya Kullanıcı adı boş olamaz"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Parola veya Kullanıcı adı hatalıdır"),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Giriş",
                      style: TextStyle(color: messageclr),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryclr,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
