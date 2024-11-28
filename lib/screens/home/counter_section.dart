import 'package:alpha16/constants/constants.dart';
import 'package:alpha16/models/dhikr.dart';
import 'package:alpha16/providers/counter_provider.dart';
import 'package:alpha16/providers/top_section_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/database_provider.dart';

// ФУНКЦИЯ добавить единицу
// ФУНКЦИЯ убавить на единицу
// ФУНКЦИЯ обнулить
// ФУНКЦИЯ перерисовки counter
// МЕНЮ по добавлению, удалению, обнулению чисел
// КНОПКА добавление dhikrs

class CounterSection extends StatelessWidget {
  const CounterSection({
    super.key,
  });

// меню по добавлению, удалению, обнулению чисел
  @override
  Widget build(BuildContext context) {
    final couterProvider = context.read<CouterProvider>();

    return Visibility(
      visible: context.watch<TopSectionProvider>().activity,
      child: Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
                onTap: () => couterProvider.del_number(),
                child: Container(
                    width: 35,
                    height: 35,
                    child: SvgPicture.asset('assets/images/Group2.svg'))),
            GestureDetector(
                onTap: () => couterProvider.add_number(),
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CurrentCounter(),
                          Text("Dhikr".tr(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12))
                        ]),
                    decoration: BoxDecoration(
                        color: blueCustom,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 154,
                    height: 154)),
            GestureDetector(
                onTap: () => couterProvider.reset_number(),
                child: Container(
                    child: SvgPicture.asset('assets/images/Group3.svg'),
                    width: 35,
                    height: 35))
          ]),
          width: double.infinity,
          height: 202,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}

class CurrentCounter extends StatelessWidget {
  const CurrentCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final couterProvider = context.watch<CouterProvider>();
    return Text("${couterProvider.counter}",
        style: TextStyle(color: Colors.white, fontSize: 48));
  }
}

// кнопка добавление dhikrs
class SaveDhikr extends StatelessWidget {
  SaveDhikr();

  @override
  Widget build(BuildContext context) {
    final couterProvider = context.read<CouterProvider>();
    return Visibility(
      visible: context.watch<TopSectionProvider>().activity,
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                final controller = TextEditingController();

                return CupertinoAlertDialog(
                  title: Text('Save Dhikr'.tr()),
                  content: Column(children: [
                    SizedBox(height: 15),
                    Text("${couterProvider.counter}"),
                    SizedBox(height: 10),
                    CupertinoTextField(
                      controller: controller,
                      placeholder: "Enyer title".tr(),
                    ),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(blueCustom)),
                        onPressed: () {
                          context.read<DatabaseProvider>().addDhikr(Dhikr(
                              counter: couterProvider.counter,
                              title: controller.text,
                              date: DateTime.now()));
                          controller.dispose();
                          context.pop();
                        },
                        child: Text('Save'.tr(),
                            style: TextStyle(color: Colors.white))),
                    SizedBox(height: 20)
                  ]),
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Container(
            child: Center(
              child: Text(
                "Save Dhikr".tr(),
                style: TextStyle(color: blueCustom, fontSize: 14),
              ),
            ),
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
      ),
    );
  }
}
