import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? imagePath ;
  String userName = "";

  @override
  void initState() {
    super.initState();
    userName = AppLocalStorage.getCachDate("name");
    imagePath = AppLocalStorage.getCachDate("image");
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
              "Have a nice day",
              style: getTitleStyle(fontSize: 15),
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
