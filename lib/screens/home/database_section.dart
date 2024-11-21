import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/main.dart';
import 'package:alpha16/models/dhikr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/database_provider.dart';

//Cписок  dhikrs
//Виджет списка dhikrs
//Cписок  dhikrs

class DatabaseSection extends StatelessWidget {
  const DatabaseSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final databaseProvider = context.watch<DatabaseProvider>();
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
                  itemCount: databaseProvider.fakeDataBase.length,
                  itemBuilder: (context, index) {
                    index = databaseProvider.fakeDataBase.length - 1 - index;
                    return WidgetApp(
                      number: databaseProvider.fakeDataBase[index].counter,
                      date: DateFormat('EEE, d.M.y')
                          .format(databaseProvider.fakeDataBase[index].data),
                      title: databaseProvider.fakeDataBase[index].title,
                      index: index,
                    );
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
      required this.date,
      required this.index});
  int index;
  int number;
  String title;
  String date;

  @override
  Widget build(BuildContext context) {
    final databaseProvider = context.watch<DatabaseProvider>();
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
                showDialog(
                    context: context,
                    builder: (context) {
                      final controller = TextEditingController();

                      return CupertinoAlertDialog(
                        title: Text('Edit Dhikr'),
                        content: Column(children: [
                          SizedBox(height: 15),
                          Text("$number"),
                          SizedBox(height: 10),
                          CupertinoTextField(
                            controller: controller,
                            placeholder: title,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    databaseProvider.removeDhikr(index);
                                    context.pop();
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red[300]),
                                  )),
                              TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all(blueCustom)),
                                  onPressed: () {
                                    databaseProvider.upadateDhikr(
                                        index,
                                        Dhikr(
                                            counter: number,
                                            title: controller.text,
                                            data: DateTime.now()));

                                    context.pop();
                                  },
                                  child: Text('Save',
                                      style: TextStyle(color: Colors.white)))
                            ],
                          )
                        ]),
                      );
                    });
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
