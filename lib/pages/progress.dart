import "package:flutter/material.dart";

class Progress extends StatelessWidget {
  const Progress({Key? key}) : super(key: key);
  static const String id = "progress";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Inter"),
        home: Scaffold(
            appBar: AppBar(title: const Text("Fitness app")),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 51.0, left: 36.0),
                  child: const Text(
                    "See Muscle Progress",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 36.0, top: 12.0),
                  child: Row(
                    children: [
                      MuscleBtn("Back"),
                      MuscleBtn("Biceps")
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 51.0, left: 36.0),
                  child: const Text(
                    "👀 Look at that Bicep Growth",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: const Image(
                        image: AssetImage('static/images/flex-2.jpg'),
                        height: 300.0
                    ),
                  ),
                ),
                const BottomSlider()
              ],
            )
        )
    );
  }
}

class MuscleBtn extends StatefulWidget {
  final String muscle;
  const MuscleBtn(this.muscle);

  @override
  _MuscleBtnState createState() => _MuscleBtnState();
}

class _MuscleBtnState extends State<MuscleBtn> {

  static var bgColor = Colors.yellow;
  static bool pressed = false;

  void selectBtn() {
    setState(() {
      pressed = !pressed;
      if (pressed) {
        bgColor = Colors.amber;
      } else {
        bgColor = Colors.yellow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.0),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: bgColor
          ),
          onPressed: selectBtn,
          child: Text(
            widget.muscle,
            style: const TextStyle(fontSize: 15, fontFamily: "Inter"),
          )
      ),
    );
  }
}

class BottomSlider extends StatefulWidget {
  const BottomSlider({Key? key}) : super(key: key);

  @override
  _BottomSliderState createState() => _BottomSliderState();
}

class _BottomSliderState extends State<BottomSlider> {

  double _currentValue = 60;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentValue,
      max: 100,
      divisions: 100,
      label: _currentValue.toString(),
      onChanged: (double value) {
        setState(() {
          _currentValue = value;
        });
      },
    );
  }
}
