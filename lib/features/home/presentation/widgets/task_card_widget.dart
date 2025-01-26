import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/add_task/data/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.model,
  });
  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: model.selectedIndex == 0
              ? AppColors.primary
              : model.selectedIndex == 1
                  ? AppColors.orange
                  : model.selectedIndex == 2
                      ? AppColors.red
                      : AppColors.green,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.title, style: getTitleStyle(color: AppColors.white)),
              const Gap(10),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.white,
                  ),
                  const Gap(10),
                  Text(
                    "${model.startTime}  :  ${model.endTime}",
                    style: getBodyStyle(color: AppColors.white),
                  )
                ],
              ),
              const Gap(10),
              Text(
                overflow: TextOverflow.visible,
                softWrap: true,
                model.note,
                style: getTitleStyle(color: AppColors.white),
              ),
            ],
          ),
          const Spacer(),
          RotatedBox(
            quarterTurns: 3,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 1,
                  color: AppColors.white,
                ),
                const Gap(5),
                Text(
                  model.isCompleted ? "Completed" : "TODO",
                  style: getTitleStyle(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
