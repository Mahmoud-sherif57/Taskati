import 'package:hive_flutter/hive_flutter.dart';

class AppLocalStorage {
  static late Box box;
  init() {
  box = Hive.box("userInfo");
  }
  static setCachDate(key, value) {
    box.put(key, value);
  }

  static getCachDate(key) {
    return box.get(key);
  }
}
