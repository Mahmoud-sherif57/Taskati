import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';
@HiveType(typeId:1)
class TaskModel {
  @HiveField(0)
  final String id; 
   @HiveField(1)
  final String title;
  @HiveField(2)
  final String note;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String startTime;
  @HiveField(5)
  final String endTime;
  @HiveField(6)
  final int selectedIndex;
  @HiveField(7)
  final bool isCompleted;

  TaskModel(
      {required this.id,
      required this.title,
      required this.note,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.selectedIndex,
      required this.isCompleted});
}
