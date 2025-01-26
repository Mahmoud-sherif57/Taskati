import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/add_task/data/task_model.dart';
import 'package:taskati/features/add_task/presentation/widgets/custom_form_field_widget.dart';
import 'package:taskati/features/home/presentation/view/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});
  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var date = DateFormat.yMd().format(DateTime.now());
  var startTime = DateFormat("hh:mm").format(DateTime.now());
  var endTime =
      DateFormat("hh:mm").format(DateTime.now().add(const Duration(hours: 1)));
  int selectedIndex = 0;
  var titleController = TextEditingController();
  var noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AppRouting.navigateWithReplacement(const HomeView(), context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary,
          ),
        ),
        title: Text(
          "Add Task",
          style: getTitleStyle(color: AppColors.primary),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormFieldWidget(
              animationDelayTime: 500,
              controller: titleController,
              text: "Title",
              hintText: "Enter Task Title",
            ),
            const Gap(15),
            CustomFormFieldWidget(
              animationDelayTime: 600,
              controller: noteController,
              text: "Note",
              hintText: "Enter Your Note",
              maxLines: 5,
            ),
            const Gap(15),
            CustomFormFieldWidget(
              animationDelayTime: 700,
              text: "Date",
              hintText: date,
              readOnly: true,
              suffixIcon: const Icon(Icons.calendar_month_rounded),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(
                      DateTime.now().add(const Duration(days: 365)).year),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      date = DateFormat.yMd().format(value);
                    });
                  }
                });
              },
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomFormFieldWidget(
                    animationDelayTime: 800,
                    text: "Start Time",
                    hintText: startTime,
                    suffixIcon: const Icon(Icons.watch_later),
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            startTime = value.format(context);
                          });
                        }
                      });
                    },
                  ),
                ),
                const Gap(15),
                Expanded(
                  child: CustomFormFieldWidget(
                    animationDelayTime: 800,
                    text: "End Time",
                    hintText: endTime,
                    suffixIcon: const Icon(Icons.watch_later),
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            endTime = value.format(context);
                          });
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            const Gap(10),
            FadeIn(
              duration: const Duration(seconds: 1),
              delay: const Duration(milliseconds: 900),
              child: Row(
                children: [
                  Row(
                    children: [
                      ...List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: index == 0
                                        ? AppColors.primary
                                        : index == 1
                                            ? AppColors.orange
                                            : AppColors.red,
                                    child: selectedIndex == index
                                        ? const Icon(
                                            Icons.check,
                                            color: AppColors.white,
                                          )
                                        : const SizedBox(),
                                  ),
                                ),
                              )),
                    ],
                  ),
                  const Spacer(),
                  CustomButtonWidget(
                    text: "Add Task",
                    onPressed: () {
                      if (titleController.text.isEmpty ||
                          noteController.text.isEmpty) {
                        return;
                      }
                      String uniqeKey =
                          "$titleController${DateTime.now().toString()}";
                      // we generated random & unique key by using title and dateTime of the task
                      AppLocalStorage.setCachTask(
                        uniqeKey,
                        TaskModel(
                          id: uniqeKey,
                          title: titleController.text,
                          note: noteController.text,
                          date: date,
                          startTime: startTime,
                          endTime: endTime,
                          selectedIndex: selectedIndex,
                          isCompleted: false,
                        ),
                      );
                      AppRouting.navigateWithReplacement(
                          const HomeView(), context);
                    },
                    width: 150,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
