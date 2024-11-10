import 'package:alpha16/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ФУНКЦИЯ добавить единицу
// ФУНКЦИЯ убавить на единицу
// ФУНКЦИЯ обнулить
// ФУНКЦИЯ перерисовки counter
// МЕНЮ по добавлению, удалению, обнулению чисел
// КНОПКА добавление dhikrs
int counter = 0;

class CounterSection extends StatefulWidget {
  const CounterSection({
    super.key,
  });

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  // ФУНКЦИЯ добавить единицу
  void add_number() async {
    final pref = await SharedPreferences.getInstance();
    setState(() => counter++);
    pref.setInt("counter", counter);
  }

// ФУНКЦИЯ убавить на единицу
  void del_number() async {
    if (counter > 0) {
      final pref = await SharedPreferences.getInstance();
      setState(() {
        counter--;
      });
      pref.setInt("counter", counter);
    } else {
      counter = 0;
    }
  }

  // ФУНКЦИЯ обнулить
  void reset_number() async {
    if (counter > 0) {
      final pref = await SharedPreferences
          .getInstance(); // к переменой pref подключаем SharedPreferences.getInstance();
      setState(() => counter = 0);
      pref.setInt("counter", counter); // в пременную pref сохраняем counter
    }
  }

//  ФУНКЦИЯ перерисовки counter
  Future<void> getCounterFromPrefs() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey("counter")) {
      setState(() {
        counter = pref.getInt("counter")!;
      });
    }
  }

// запускает функцию getCounterFromPrefs ()
  @override
  void initState() {
    getCounterFromPrefs();
    super.initState();
  }

// меню по добавлению, удалению, обнулению чисел
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                      children: [
                        Text("$counter",
                            style:
                                TextStyle(color: Colors.white, fontSize: 48)),
                        Text("Dhikr",
                            style: TextStyle(color: Colors.white, fontSize: 12))
                      ]),
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
                  height: 35))
        ]),
        width: double.infinity,
        height: 202,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }
}

// кнопка добавление dhikrs
class SaveDhikr extends StatelessWidget {
  SaveDhikr(this.mySetState);
  Function mySetState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myAlertDialog(
            context: context,
            title: 'Save',
            counter: counter,
            delete: false,
            mySetState: mySetState);
      },
      child: Container(
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
      ),
    );
  }
}
