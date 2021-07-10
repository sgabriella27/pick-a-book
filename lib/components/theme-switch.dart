import 'package:flutter/material.dart';

class ThemeSwitch extends StatefulWidget {
  dynamic themeSwitch;
  ThemeSwitch(this.themeSwitch);

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState(themeSwitch);
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  var darkTheme = false;
  dynamic themeSwitch;
  _ThemeSwitchState(this.themeSwitch);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: darkTheme,
      onChanged: (value) {
        themeSwitch();
        setState(() {
          darkTheme = !darkTheme;
        });
      },
      title: Text("Change Theme"),
      secondary: Icon(Icons.dark_mode),
    );
  }
}
