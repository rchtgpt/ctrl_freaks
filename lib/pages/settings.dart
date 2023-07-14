import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const id = "settings";
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Settings")),
    );
  }
}
