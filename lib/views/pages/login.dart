import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualif_flutter_ga/views/pages/home.dart';
import 'package:qualif_flutter_ga/global.dart' as global;

class LoginPage extends StatefulWidget {
  dynamic switchTheme;
  LoginPage(this.switchTheme);

  @override
  State<StatefulWidget> createState() {
    return LoginState(switchTheme);
  }
}

class LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var usernameCtrl = TextEditingController();
  dynamic switchTheme;
  LoginState(this.switchTheme);

  void onPressed() {
    global.username = usernameCtrl.text;
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return homePage(switchTheme, usernameCtrl.text);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/logo.png'),
              SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  hintText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return "Username must be filled!";
                  }
                  if (value[0].toUpperCase() != value[0]) {
                    return "Username must start with uppercase character";
                  }
                  return null;
                },
                controller: usernameCtrl,
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return "Password must be filled";
                  }
                  if (value.length < 8) {
                    return "Password length must be more than 8 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: onPressed, child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
