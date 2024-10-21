import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/screens/home/database_section.dart';
import 'package:flutter/material.dart';
import 'screens/home/counter_section.dart';
import 'screens/home/top_section.dart';

void main() {
  runApp(Alpha16());
}

class Alpha16 extends StatelessWidget {
  const Alpha16({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'gilroy-bold'),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                      CounterSection(),
                      SizedBox(height: 20),
                      SaveDhikr(),
                      SizedBox(height: 20),
                      DatabaseSection()
                    ],
                  )),
                ))));
  }
}
