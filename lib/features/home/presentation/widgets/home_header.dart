import 'package:flutter/material.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
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
              "Hello, mahmoud",
              style: getTitleStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Have a nice day",
              style: getTitleStyle(fontSize: 15),
            ),
          ],
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(AppImages.userProfile),
        ),
      ],
    );
  }
}