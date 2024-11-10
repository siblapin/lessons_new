import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/models/dhikr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Cписок  dhikrs
//Виджет списка dhikrs

//Cписок  dhikrs
class DatabaseSection extends StatelessWidget {
  const DatabaseSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Last saved dhikrs",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 2, bottom: 10),
              color: blueCustom,
              width: 70,
              height: 3,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: fakeDataBase.length,
                  itemBuilder: (context, index) {
                    index = fakeDataBase.length - 1 - index;
                    return WidgetApp(
                        number: fakeDataBase[index].counter,
                        date: fakeDataBase[index].data.month.toString(),
                        title: fakeDataBase[index].title);
                  }),
            ),
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

//Виджет списка dhikrs
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
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      height: 49,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 40,
              child: Center(
                  child: Text("$number",
                      style: TextStyle(
                          fontSize: 20,
                          color: blueCustom,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'gilroy-medium')))),
          Container(
            margin: EdgeInsets.only(right: 30, left: 20),
            child: Text("$title",
                style: TextStyle(fontSize: 12, fontFamily: 'gilroy-bold')),
          ),
          Text("$date",
              style: TextStyle(
                  fontSize: 10,
                  color: greyCustom,
                  fontFamily: 'gilroy-medium')),
          GestureDetector(
              onTap: () {
                myAlertDialog(
                  context: context,
                  title: title,
                  counter: number,
                  delete: true,
                );
              },
              child: Container(
                  color: Colors.grey[100],
                  width: 70,
                  child: Center(
                      child: SvgPicture.asset('assets/images/Group4.svg'))))
        ],
      ),
    );
  }
}

List<Dhikr> fakeDataBase = [
  Dhikr(counter: 11, title: '1 title', data: DateTime.now()),
  Dhikr(counter: 12, title: '2 title', data: DateTime.now()),
  Dhikr(counter: 13, title: '3 title', data: DateTime.now()),
  Dhikr(counter: 14, title: '4 title', data: DateTime.now()),
  Dhikr(counter: 15, title: '5 ver', data: DateTime.now()),
];
