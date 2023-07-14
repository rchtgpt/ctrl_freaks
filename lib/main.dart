import 'package:ctrl_freaks/pages/capture.dart';
import 'package:ctrl_freaks/pages/home.dart';
import 'package:ctrl_freaks/pages/progress.dart';
import 'package:ctrl_freaks/pages/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: MyApp.id,
    routes: {
      MyApp.id: (context) => MyHomePage(title: "hi", currentIndex: 0,),
      MyApp.id1: (context) => MyHomePage(title: "hi", currentIndex: 1,),
      MyApp.id2: (context) => MyHomePage(title: "hi", currentIndex: 2,),
      MyApp.id3: (context) => MyHomePage(title: "hi", currentIndex: 3,),
      Home.id: (context) => Home(),
      Capture.id: (context) => Capture(),
      Progress.id: (context) => Progress(),
      Settings.id: (context) => Settings()
    },
  ));
}

class MyApp extends StatelessWidget {
  static const id = "my_app";
  static const id1 = "my_app1";
  static const id2 = "my_app2";
  static const id3 = "my_app3";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Control Freaks', currentIndex: 0),
      title: 'Ctrl Freaks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.currentIndex}) : super(key: key);
  final String title;
  int currentIndex = 0;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final screens = [Home(), Capture(), Progress(), Settings()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(.90),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: widget.currentIndex,
          onTap: (value) {
            setState(() => widget.currentIndex = value);
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Capture',
              icon: Icon(Icons.camera_alt),
            ),
            BottomNavigationBarItem(
              label: 'Progress',
              icon: Icon(Icons.accessibility_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: screens[widget.currentIndex],// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

