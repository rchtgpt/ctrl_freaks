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
              child: HomeHeaderCard(),
            ),
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
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  side: BorderSide(
                    color: Colors.black,
                    width: 1,
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("📸 Capture a pose",
                      style: TextStyle(
                          fontSize: 22,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("To see your muscle progress gradually, we recommend you take pictures after every workout"),
                    FilledButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Text('Take Picture'),
                          Icon(Icons.arrow_right_alt_sharp)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: Spacer(flex: 1,)),
            Expanded(
              flex: 8,
              child: Card(
                child: Center(child: Text('Elevated Card')),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

