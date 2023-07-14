import 'package:flutter/material.dart';

Widget ProgressCard(BuildContext context, int progressCount, String progressLabel) {
  return Card(
      color: Color(0xFFFEE085),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
              progressCount.toString(),
            style: TextStyle(fontSize: 55, fontWeight: FontWeight.w900),
          ),
          Text(
              progressLabel,
            style: TextStyle(fontSize: 15),
          )
        ],
      )
  );
}