import 'package:flutter/material.dart';

Widget HomeHeaderCard() {
  return Container(
    width: double.infinity,
    child: Card(
      color: Color(0xFFFEC20B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Text("Control your body.\nBe a ctrl_freak.",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(image: AssetImage("static/images/fitness.png"))
            ],
          )
        ],
      )
    ),
  );
}