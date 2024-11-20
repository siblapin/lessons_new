import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CouterProvider extends ChangeNotifier {
  int counter = 0;
  CouterProvider() {
    getCounterFromPrefs();
  } // аналог initState, конструкторе в {} обновляет(запускает) при каждом обновление БИЛД
  // ФУНКЦИЯ добавить единицу
  void add_number() async {
    final pref = await SharedPreferences.getInstance();

    counter++;
    notifyListeners(); // аналог setSatate
    pref.setInt("counter", counter);
  }

// ФУНКЦИЯ убавить на единицу
  void del_number() async {
    if (counter > 0) {
      final pref = await SharedPreferences.getInstance();

      counter--;
      notifyListeners(); // аналог setSatate
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

      counter = 0;
      notifyListeners(); // аналог setSatate
      pref.setInt("counter", counter); // в пременную pref сохраняем counter
    }
  }

//  ФУНКЦИЯ перерисовки counter
  Future<void> getCounterFromPrefs() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey("counter")) {
      counter = pref.getInt("counter")!;
      notifyListeners(); // аналог setSatate
    }
  }
}
