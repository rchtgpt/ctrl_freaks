import 'package:flutter/material.dart';

Widget muscleBtn(BuildContext context, String muscleLabel) {
  return Container(
    margin: const EdgeInsets.only(right: 10.0),
    child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: Color(0xffFEC20B),
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
            minimumSize: Size.zero
        ),
        onPressed: (){},
        child: Text(
          muscleLabel,
          style: const TextStyle(fontSize: 15, fontFamily: "Inter"),
        )
    ),
  );
}