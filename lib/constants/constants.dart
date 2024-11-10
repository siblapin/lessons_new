import 'package:alpha16/models/dhikr.dart';
import 'package:alpha16/screens/home/database_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Color blueCustom = Color(0xFF4664FF);
Color greyCustom = Color(0xFF9F9F9F);

//Диалоговое окно
void myAlertDialog(
    {required BuildContext context,
    required String title,
    required int counter,
    required bool delete,
    Function? mySetState}) {
  showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return CupertinoAlertDialog(
          title: Text('Edit Dhikr'),
          content: Column(children: [
            SizedBox(height: 15),
            Text("$counter"),
            SizedBox(height: 10),
            CupertinoTextField(
              controller: controller,
              placeholder: title,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: (delete == true)
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: delete,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.red[300]),
                      )),
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(blueCustom)),
                    onPressed: () {
                      fakeDataBase.add(Dhikr(
                          counter: counter,
                          title: controller.text,
                          data: DateTime.now()));
                      context.pop();
                      if (mySetState != null) {
                        mySetState();
                      }
                    },
                    child: Text('Save', style: TextStyle(color: Colors.white)))
              ],
            )
          ]),
        );
      });
}
