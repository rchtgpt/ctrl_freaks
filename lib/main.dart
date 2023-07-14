import "package:flutter/material.dart";

import "pages/progress.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          Progress.id: (context) => const Progress()
        },
        home: Builder(
            builder: (context) {
              return Scaffold(
                  appBar: AppBar(title: Text("Fitness app")),
                  body: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 25.0),
                        child: const Text(
                          "Let's get bigger",
                          style: TextStyle(fontSize: 22, fontFamily: "Inter"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(onPressed: () => Navigator.pushNamed(context, Progress.id), child: const Text("Progress"))
                    ],
                  )
              );
            }
        )
    );
  }
}

