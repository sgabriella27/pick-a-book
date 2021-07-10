import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:qualif_flutter_ga/components/theme-switch.dart';
import 'package:qualif_flutter_ga/views/pages/login.dart';

import 'item.dart';

class homePage extends StatefulWidget {
  dynamic switchTheme;
  var username;
  homePage(this.switchTheme, this.username);

  @override
  _homePageState createState() => _homePageState(switchTheme, username);
}

class _homePageState extends State<homePage> {
  dynamic switchTheme;
  var username;
  _homePageState(this.switchTheme, this.username);

  var darkTheme = false;
  var novels = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg'
  ];

  void logoutPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPage(switchTheme);
    }));
  }

  void itemPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ItemPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CarouselSlider(
              items: [
                Image(
                  image: AssetImage(novels[0]),
                ),
                Image(
                  image: AssetImage(novels[1]),
                ),
                Image(
                  image: AssetImage(novels[2]),
                ),
                Image(
                  image: AssetImage(novels[3]),
                ),
                Image(
                  image: AssetImage(novels[4]),
                ),
              ],
              options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2)),
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              "Pick-a-Book is an online book store that sells many types of books.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            )
          ]),
        ),
      ),
      appBar: AppBar(
        title: Center(child: Text(username)),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.settings),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: ThemeSwitch(switchTheme),
                  )
                ];
              })
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: TextButton.icon(
                  onPressed: itemPressed,
                  icon: Icon(Icons.book),
                  label: Text("Books")),
            ),
            ListTile(
              title: TextButton.icon(
                  onPressed: logoutPressed,
                  icon: Icon(Icons.logout),
                  label: Text("Logout")),
            )
          ],
        ),
      ),
    );
  }
}
