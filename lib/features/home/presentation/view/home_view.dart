import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/services/boxes_name.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/add_task/data/task_model.dart';
import 'package:taskati/features/home/presentation/widgets/date_picker_widget.dart';
import 'package:taskati/features/home/presentation/widgets/home_header_widget.dart';
import 'package:taskati/features/home/presentation/widgets/task_card_widget.dart';
import 'package:taskati/features/home/presentation/widgets/today_date_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

String _selectedDate = DateFormat.yMd().format(DateTime.now());

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Gap(30),
            // Header.
            const HomeHeaderWidget(),
            const Gap(10),
            const TodayDateAndAddTaskWidget(),
            const Gap(10),
            DatePickerWidget(
              onDateChange: (date) {
                setState(() {
                  _selectedDate = DateFormat.yMd().format(date);
                });
              },
            ),
            const Gap(10),
            Expanded(
              child: ValueListenableBuilder<Box<TaskModel>>(
                valueListenable:
                    Hive.box<TaskModel>(BoxesName.taskInfo).listenable(),
                builder: (context, box, child) {
                  List<TaskModel> tasks = [];
                  for (var element in box.values) {
                    if (element.date == _selectedDate) {
                      tasks.add(element);
                    }
                  }
                  if (tasks.isEmpty) {
                    return Center(
                      child: Text(
                        "No Task Found",
                        style: getTitleStyle(
                          context,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            // complete this task with it's key
                            box.put(
                                tasks[index].id,
                                TaskModel(
                                  id: tasks[index].id,
                                  title: tasks[index].title,
                                  note: tasks[index].note,
                                  date: tasks[index].date,
                                  startTime: tasks[index].startTime,
                                  endTime: tasks[index].endTime,
                                  selectedIndex: 3,
                                  isCompleted: true,
                                ));
                          } else {
                            box.delete(tasks[index].id);
                          }
                        },
                        background: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: AppColors.white,
                                ),
                                const Gap(10),
                                Text(
                                  "Completed",
                                  style: getTitleStyle(context,
                                      color: AppColors.white),
                                ),
                              ]),
                        ),
                        secondaryBackground: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: AppColors.white,
                                ),
                                const Gap(10),
                                Text(
                                  "Delete",
                                  style: getTitleStyle(context,
                                      color: AppColors.white),
                                ),
                              ]),
                        ),
                        child: TaskCard(model: tasks[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
