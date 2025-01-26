import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
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
            const Gap(20),
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
                valueListenable: Hive.box<TaskModel>('taskInfo').listenable(),
                builder: (context, value, child) {
                  List<TaskModel> tasks = [];
                  for (var element in value.values) {
                    if (element.date == _selectedDate) {
                      tasks.add(element);
                    }
                  }
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskCard(model: tasks[index]);
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
