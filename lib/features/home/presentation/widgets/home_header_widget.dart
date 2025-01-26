import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  String? imagePath;
  String userName = "";

  @override
  void initState() {
    super.initState();
    userName = AppLocalStorage.getCachData("name");
    imagePath = AppLocalStorage.getCachData("image");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, ${userName.isNotEmpty ? userName : "User"}",
              style: getTitleStyle(
                  color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
            Text(
              "Have a Nice Day",
              style: getSmallStyle(fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 35,
          backgroundImage: imagePath != null
              ? FileImage(File(imagePath!)) as ImageProvider
              : const AssetImage(AppImages.userProfile),
        ),
      ],
    );
  }
}
