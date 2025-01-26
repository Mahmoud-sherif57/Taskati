import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/add_task/presentation/view/add_task_view.dart';

class TodayDateAndAddTaskWidget extends StatelessWidget {
  const TodayDateAndAddTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: getTitleStyle(),
            ),
            Text(
              "Today",
              style: getTitleStyle(fontSize: 15),
            ),
          ],
        ),
        const Spacer(),
        CustomButtonWidget(
          text: "+ Add Task",
          onPressed: () {
            AppRouting.navigateWithReplacement(const AddTaskView(), context);
          },
          width: 130,
        ),
      ],
    );
  }
}
