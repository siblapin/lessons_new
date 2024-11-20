import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/screens/home/counter_section.dart';
import 'package:alpha16/screens/home/database_section.dart';
import 'package:alpha16/screens/home/top_section.dart';
import 'package:flutter/material.dart';

//Домашняя страница

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

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
                  const TopSection(),
                  const CounterSection(),
                  SaveDhikr(),
                  const DatabaseSection()
                ],
              )),
            )));
  }
}
