import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  static const id = "progress";
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Progress"),),
    );
  }
}
