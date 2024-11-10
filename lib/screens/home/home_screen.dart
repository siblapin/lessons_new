import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/screens/home/counter_section.dart';
import 'package:alpha16/screens/home/database_section.dart';
import 'package:alpha16/screens/home/top_section.dart';
import 'package:flutter/material.dart';

//Домашняя страница

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool activity = true;

  void toggleActivity(bool toggle) {
    if (toggle != activity) {
      setState(() => activity = toggle);
    }
  }

  void mySetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyCustom,
        body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                  child: Column(
                children: [
                  SizedBox(height: 10),
                  TopSection(),
                  SizedBox(height: 20),
                  Visibility(visible: activity, child: CounterSection()),
                  SizedBox(height: 20),
                  SaveDhikr(mySetState),
                  SizedBox(height: 20),
                  DatabaseSection()
                ],
              )),
            )));
  }
}
