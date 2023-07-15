import 'package:ctrl_freaks/widgets/muscleBtn.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ctrl_freaks/firebase_options.dart';
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
  List imgs = [];
  List dates = [];

  @override
  void initState() {
    buildListOfImageURLs().then((result){
      setState(() => imgs.add(result));
      });
    buildListOfImageDates().then((result){
      setState(() => dates.add(result));
    });
  }

  Future<List> buildListOfImageURLs() async {
    List<String> imageURLs = <String>[];

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final storageRef = FirebaseStorage.instance.ref().child("images/");
    final listResult = await storageRef.listAll();

    for (var item in listResult.items) {
      var url = await item.getDownloadURL();
      imageURLs.add(url);
    }

    print(imageURLs);
    return imageURLs;
  }

  Future<List> buildListOfImageDates() async {
    List<String> imageDates = <String>[];

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final storageRef = FirebaseStorage.instance.ref().child("images/");
    final listResult = await storageRef.listAll();

    for (var item in listResult.items) {
      var date = await item.name;
      imageDates.add(date);
    }

    print("mihir bhai $imageDates");

    return imageDates;
  }

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
                Padding(
                  padding: EdgeInsets.only(left: 36.0, top: 12.0),
                  child: Row(
                    children: [
                      muscleBtn(context, "Back"),
                      muscleBtn(context, "Biceps"),
                      muscleBtn(context, "Chest"),
                      muscleBtn(context, "Triceps"),
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
                BottomSlider(imgs, dates)
              ],
            )
        );
  }
}

class BottomSlider extends StatefulWidget {
  final List imgs;
  final List dates;
  BottomSlider(this.imgs, this.dates);


  @override
  _BottomSliderState createState() => _BottomSliderState();
}

class _BottomSliderState extends State<BottomSlider> {

  double _currentValue = 0;

  CarouselController controller = CarouselController();

  String formatDate(String date) => new DateFormat("MMMM d").format(DateTime.parse(date));

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
            items: widget.imgs[0].map<Widget>((i) {
              return Builder(
                builder: (BuildContext context) {
                  print("${widget.dates}+++++ $i");
                  return Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: NetworkImage(i),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    elevation: 5,
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
            max: widget.imgs[0].length.toDouble(),
            divisions: widget.imgs[0].length - 1,
            label: formatDate(widget.dates[0][_currentValue.toInt()]),
            onChanged: (double value) => changeImg(value)
          ),
        ),
      ],
    );
  }
}