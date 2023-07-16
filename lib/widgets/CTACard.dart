import 'package:ctrl_freaks/main.dart';
import 'package:flutter/material.dart';

Widget CTACard(String CTATitle, String CTADescription, String CTAButtonLabel, String CTADestination) {
  return Builder(
    builder: (context) {
      return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: BorderSide(
              color: Colors.black,
              width: 1,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(CTATitle,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(CTADescription,
                style: TextStyle(fontSize: 14),),
              SizedBox(
                width: 165,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CTADestination);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFEC20B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(CTAButtonLabel, style: TextStyle(color: Colors.black, fontSize: 12),),
                      Icon(Icons.arrow_right_alt_sharp, color: Colors.black,size: 24,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  );
}