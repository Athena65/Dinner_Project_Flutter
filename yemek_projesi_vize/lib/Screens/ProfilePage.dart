import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemek_projesi_vize/Models/User1.dart';
import 'package:yemek_projesi_vize/Screens/homescreen.dart';
import 'package:yemek_projesi_vize/Utilities/colors.dart';
import 'package:yemek_projesi_vize/Utilities/profile_widget.dart';

final Uri _url = Uri.parse("https://buraktamince.net.tr");

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user1 = Users[0];

    return Scaffold(
      backgroundColor: backgroundclr,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        children: [
          ProfileWidget(
            imagePath: "https://avatars.githubusercontent.com/u/41066333?v=4",
            onClicked: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          const SizedBox(height: 24),
          buildName(user1),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget buildName(User1 user) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Text(
          user.username,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: primaryclr,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Center(
        child: Text(
          user.email,
          style: TextStyle(
            color: messageclr,
            fontSize: 16,
          ),
        ),
      ),
      Text("About ",style: TextStyle(color: primaryclr,fontSize: 20),),
      const SizedBox(height: 8),
      Center(
        child: Column(
          children: [
            Text(
              user.about,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text("WebSite ",style: TextStyle(color: primaryclr,fontSize: 20),),
      ElevatedButton(onPressed: _launchUrl, child: Text("${user.username} Web Sitesi"),
      style: ElevatedButton.styleFrom(
        backgroundColor: messageclr,
        foregroundColor:whiteclr,
        shape:RoundedRectangleBorder(//koseleri yuvarlak yapma
          borderRadius: BorderRadius.circular(30.0)
        ),
        minimumSize: Size(500, 40), //width,height

      ),),
      SizedBox(
        height: 100,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Cüzdan Kayıtlı",
              style: TextStyle(
                color: messageclr,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/"
                  "thumb/b/b2/Apple_Wallet_Icon.svg/1125px-Apple_Wallet_Icon.svg.png",
              width: 120,
              height: 120,
            )
          ],
        ),
      )
    ],
  );
  _launchUrl() async//url'i acma
  {
    if(!await launchUrl(_url))
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$_url acilamiyor")));
      }
    await launchUrl(_url);
  }
}
