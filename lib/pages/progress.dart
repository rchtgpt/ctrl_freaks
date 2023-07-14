import 'package:intl/intl.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);
  static const String id = "progress";

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.only(left: 36.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                              "📽️ Export Transformation Reel",
                              style: TextStyle(color: Color(0xff000000)),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffffffff),
                            side: BorderSide(
                              width: 2.0,
                              color: Color(0xff000000),
                            ),
                            elevation: 7.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                      ),
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
                const BottomSlider()
              ],
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

  static Color bgColor = Color(0xffFFDC73);
  static bool pressed = false;

  void selectBtn() {
    setState(() {
      pressed = !pressed;
      if (pressed) {
        bgColor = Color(0xffFEC20B);
      } else {
        bgColor = Color(0xffFFDC73);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: bgColor,
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
              minimumSize: Size.zero
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

  double _currentValue = 0;
  String cimg = "flex";
  List<String> imgs = ["flex-2", "flex-2", "flex-2", "flex-2", "flex-2", "flex-2", "flex-2", "flex-2", "flex-2", "flex-2"];
  List dates = [DateTime(2023, 01, 01), DateTime(2023, 01, 22), DateTime(2023, 04, 11), DateTime(2023, 06, 17), DateTime(2023, 06, 17), DateTime(2023, 06, 17), DateTime(2023, 06, 17), DateTime(2023, 06, 17), DateTime(2023, 06, 17), DateTime(2023, 06, 17)];

  CarouselController controller = CarouselController();

  String formatDate(DateTime date) => new DateFormat("MMMM d").format(date);

  void changeImg(value) {
    controller.animateToPage(value.toInt());
    setState(() {
      _currentValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: CarouselSlider(
            options: CarouselOptions(
                height: 300.0,
                viewportFraction: 0.5,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                initialPage: 0
            ),
            carouselController: controller,
            items: imgs.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage('static/images/$i.jpg'),
                      height: 300.0
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 50.0, right: 50.0),
          child: Slider(
            activeColor: Color(0xffFEC20B),
            inactiveColor: Color(0xffFEC20B),
            value: _currentValue,
            max: imgs.length.toDouble() - 1,
            divisions: imgs.length - 1,
            label: formatDate(dates[_currentValue.toInt()]),
            onChanged: (double value) => changeImg(value)
          ),
        ),
      ],
    );
  }
}
