import 'package:alpha16/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CounterSection extends StatefulWidget {
  const CounterSection({
    super.key,
  });

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  int counter = 0;

  // добавить единицу
  void add_number() {
    setState(() => counter++);}

// убавить на единицу
  void del_number() => counter > 0 ? setState(() {counter--;}) : counter = 0;

 // сбросить
  void reset_number() { if (counter > 0) { setState(() => counter = 0);}}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => del_number(),
            child: Container(
              width: 35,
              height: 35,
              child: SvgPicture.asset('assets/images/Group2.svg'))),
          GestureDetector(
            onTap: () => add_number(),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("$counter",style: TextStyle(color: Colors.white, fontSize: 48)),
                  Text("Dhikr",style: TextStyle(color: Colors.white, fontSize: 12))]),
              decoration: BoxDecoration(
                  color: blueCustom,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 154,
              height: 154)),
          GestureDetector(
            onTap: () => reset_number(),
            child: Container(
              child: SvgPicture.asset('assets/images/Group3.svg'),
              width: 35,
              height: 35))]),
      width: double.infinity,
      height: 202,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))));}}

class SaveDhikr extends StatelessWidget {
  const SaveDhikr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Save dhikr",
          style: TextStyle(color: blueCustom, fontSize: 14),
        ),
      ),
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}
