import 'package:alpha16/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DatabaseSection extends StatelessWidget {
  const DatabaseSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Last saved dhikrs",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            WidgetApp(
                number: 14,
                title: 'Name of the file dhikr',
                date: '19.02.2021'),
            WidgetApp(
                number: 9, title: 'Name of the file dhikr', date: '18.02.2021'),
            WidgetApp(
                number: 15,
                title: 'Name of the file dhikr',
                date: '14.02.2021'),
          ],
        ),
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}

class WidgetApp extends StatelessWidget {
  WidgetApp(
      {super.key,
      required this.number,
      required this.title,
      required this.date});
  int number;
  String title;
  String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 309,
      height: 49,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 24,
              height: 24,
              child: Center(
                  child: Text(
                "$number",
                style: TextStyle(
                    fontSize: 20,
                    color: blueCustom,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'gilroy-medium'),
              ))),
          Text("$title"),
          Text("$date",
              style: TextStyle(
                  fontSize: 10,
                  color: greyCustom,
                  fontFamily: 'gilroy-medium')),
          Container(
            height: 15,
            width: 15,
            child: SvgPicture.asset('assets/images/Group4.svg'),
          )
        ],
      ),
    );
  }
}
