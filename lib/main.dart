import 'package:ctrl_freaks/pages/capture.dart';
import 'package:ctrl_freaks/pages/home.dart';
import 'package:ctrl_freaks/pages/progress.dart';
import 'package:ctrl_freaks/pages/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: "Inter"),
    debugShowCheckedModeBanner: false,
    initialRoute: MyApp.id,
    routes: {
      MyApp.id: (context) => MyHomePage(title: "hi"),
      Home.id: (context) => Home(),
      Capture.id: (context) => Capture(),
      Progress.id: (context) => Progress(),
      Settings.id: (context) => Settings()
    },
  ));
}

class MyApp extends StatelessWidget {
  static const id = "my_app";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Control Freaks'),
      title: 'Ctrl Freaks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
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
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() => _currentIndex = value);
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
      body: screens[_currentIndex],
    );
  }
}
