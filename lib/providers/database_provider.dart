import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/dhikr.dart';

class DatabaseProvider extends ChangeNotifier {
  late Box<Dhikr> box;
  Future<void> openDhikrBox() async {
    box = await Hive.openBox("dhikrs");
  }

  void removeDhikr(int index) {
    box.deleteAt(index);
    notifyListeners();
  }

  void addDhikr(Dhikr dhikr) {
    box.add(dhikr);
    notifyListeners();
  }

  void upadateDhikr(index, Dhikr newDhikr) {
    box.putAt(index, newDhikr);
    notifyListeners();
  }

  void upadateDatabase() {
    notifyListeners();
  }

  @override
  void dispose() {
    box.close();
    super.dispose();
  }
}
