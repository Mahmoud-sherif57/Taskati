import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/services/cach_keys.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/profile/presentation/view/profile_view.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  String imagePath = "";
  String userName = "";

  @override
  void initState() {
    super.initState();
    userName = AppLocalStorage.getCachData(CachKeys.name) ?? "";
    imagePath = AppLocalStorage.getCachData(CachKeys.image) ?? "";
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
              style: getTitleStyle(context,
                  color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
            Text(
              "Have a Nice Day",
              style: getSmallStyle(context: context, fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            AppRouting.navigateTo(const ProfileView(), context);
          },
          child: CircleAvatar(
            radius: 35,
            backgroundImage: imagePath.isNotEmpty
                ? FileImage(File(imagePath)) as ImageProvider
                : const AssetImage(AppImages.userProfile),
          ),
        ),
      ],
    );
  }
}
