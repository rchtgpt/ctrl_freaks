import "dart:typed_data";

import "package:flutter/material.dart";

class Test extends StatelessWidget {
  // const Test({Key? key}) : super(key: key);
  static const id = "test";
  final Uint8List? pngBytes;

  Test(this.pngBytes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.memory(pngBytes!)
    );
  }
}
