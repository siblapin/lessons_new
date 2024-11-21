import 'package:flutter/cupertino.dart';

import '../models/dhikr.dart';

class DatabaseProvider extends ChangeNotifier {
  List<Dhikr> fakeDataBase = [
    Dhikr(counter: 11, title: '1 title', data: DateTime.now()),
    Dhikr(counter: 12, title: '2 title', data: DateTime.now()),
    Dhikr(counter: 13, title: '3 title', data: DateTime.now()),
    Dhikr(counter: 14, title: '4 title', data: DateTime.now()),
    Dhikr(counter: 15, title: '5 title', data: DateTime.now()),
  ];

  void removeDhikr(int index) {
    fakeDataBase.removeAt(index);
    notifyListeners();
  }

  void addDhikr(Dhikr dhikr) {
    fakeDataBase.add(dhikr);
    notifyListeners();
  }

  void upadateDhikr(index, Dhikr newDhikr) {
    fakeDataBase[index] = newDhikr;
    notifyListeners();
  }

  void upadateDatabase() {
    notifyListeners();
  }
}
