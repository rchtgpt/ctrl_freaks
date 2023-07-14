import 'package:flutter/material.dart';

Widget HomeHeaderCard() {
  return Card(
    color: Color(0xFFFEC20B),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.0),
    ),
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Control your body.\nBe a ctrl_freak.",
        style: TextStyle(
            fontSize: 25,
        )
        ,
      ),
    ),
  );
}