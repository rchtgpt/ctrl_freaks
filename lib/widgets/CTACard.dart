import 'package:flutter/material.dart';

Widget CTACard(String CTATitle, String CTADescription, String CTAButtonLabel) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
        side: BorderSide(
          color: Colors.black,
          width: 1,
        )
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            width: 170,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFEC20B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(CTAButtonLabel, style: TextStyle(color: Colors.black, fontSize: 14),),
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