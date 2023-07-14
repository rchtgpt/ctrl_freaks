import 'package:ctrl_freaks/main.dart';
import 'package:ctrl_freaks/widgets/CTACard.dart';
import 'package:ctrl_freaks/widgets/HomeHeaderCard.dart';
import 'package:ctrl_freaks/widgets/progressCard.dart';
import 'package:flutter/material.dart';
import 'package:ctrl_freaks/widgets/progressCard.dart';

class Home extends StatelessWidget {
  static const id = "home";
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: HomeHeaderCard(),),
            Expanded(child: Spacer(flex: 1,)),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: ProgressCard(context, 78, "Poses Captured"),
                  ),
                  Expanded(child: Spacer(flex: 1,)),
                  Expanded(
                    flex: 8,
                    child: ProgressCard(context, 45, "Days Consistent"),
                  ),
                ],
              ),
            ),
            Expanded(child: Spacer(flex: 1,)),
            Expanded(
              flex: 8,
              child: CTACard(
                  "📸 Capture a pose",
                  "To see your muscle progress gradually, we recommend you take pictures after every workout",
                  "TAKE PICTURE", MyApp.id1),
            ),
            Expanded(child: Spacer(flex: 1,)),
            Expanded(
              flex: 8,
              child: CTACard(
                  "👀 View your progress",
                  "To see your muscle progress gradually, we recommend you take pictures after every workout",
                  "VIEW PROGRESS", MyApp.id2),
            ),
          ],
        ),
      ),
    );
  }




}

