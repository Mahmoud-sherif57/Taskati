import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/text_style.dart';

class CustomFormFieldWidget extends StatelessWidget {
  const CustomFormFieldWidget({
    super.key,
    required this.text,
    required this.hintText,
    this.onTap,
    this.suffixIcon,
    this.readOnly = false,
    this.maxLines,
    this.animationDelayTime = 500, 
    this.controller,
  });

  final String text;
  final String hintText;
  final Function()? onTap;
  final bool readOnly;
  final Widget? suffixIcon;
  final int? maxLines;
  final int animationDelayTime;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: 1),
      delay: Duration(milliseconds: animationDelayTime),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: getTitleStyle(),
          ),
          const Gap(5),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
            ),
            onTap: onTap,
            readOnly: readOnly,
            maxLines: maxLines,
          ),
          const Gap(15),
        ],
      ),
    );
  }
}
