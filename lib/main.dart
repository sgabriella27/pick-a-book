import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualif_flutter_ga/views/pages/login.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(() {
        setState(() {
          darkTheme = !darkTheme;
        });
      }),
      theme:
          darkTheme ? ThemeData.dark() : ThemeData(primaryColor: Colors.white),
    );
  }
}
