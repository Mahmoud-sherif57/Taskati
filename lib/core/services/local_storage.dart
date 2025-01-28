import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/services/boxes_name.dart';
import 'package:taskati/features/add_task/data/task_model.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box<TaskModel> taskBox;
  init() {
    userBox = Hive.box(BoxesName.userInfo);
    taskBox = Hive.box<TaskModel>(BoxesName.taskInfo);
  }

  static setCachData(key, value) {
    userBox.put(key, value);
  }

  static getCachData(key) {
    return userBox.get(key);
  }

  static setCachTask(key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getCachTask(key) {
    return taskBox.get(key);
  }
}
