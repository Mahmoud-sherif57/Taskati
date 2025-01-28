import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    this.onDateChange,
  });

  final Function(DateTime)? onDateChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return DatePicker(
      DateTime.now(),
      // DateTime.now().add(
      //     const Duration(days: -2)), // to start from 2days before
      height: 100,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectionColor: AppColors.primary,
      onDateChange: onDateChange,
      dateTextStyle: getBodyStyle(context),
      dayTextStyle: getSmallStyle(context:  context, color: theme.onSurface),
      monthTextStyle: getSmallStyle(context:  context, color: theme.onSurface),
    );
  }
}
