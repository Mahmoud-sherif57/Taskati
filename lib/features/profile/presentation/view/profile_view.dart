import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/services/boxes_name.dart';
import 'package:taskati/core/services/cach_keys.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final box = Hive.box(BoxesName.userInfo);
    var darkMode = box.get(CachKeys.darkMode, defaultValue: false);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(
                darkMode ? Icons.sunny : Icons.dark_mode,
              ),
              onPressed: () {
                box.put(CachKeys.darkMode, !darkMode);
              },
            ),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(BoxesName.userInfo).listenable(),
        builder: (context, value, child) {
          String path = value.get(CachKeys.image, defaultValue: "");
          String name = value.get(CachKeys.name, defaultValue: "");
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primary.withOpacity(0.5),
                        radius: 85,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: (path.isNotEmpty)
                              ? FileImage(File(path)) as ImageProvider
                              : const AssetImage(AppImages.userProfile),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: theme.surface,
                            foregroundColor: AppColors.primary,
                            child: const Icon(
                              Icons.camera_alt,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    color: AppColors.primary,
                    thickness: 1,
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        name,
                        style: getTitleStyle(context, color: AppColors.primary),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.primary,
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: theme.surface,
                            foregroundColor: AppColors.primary,
                            child: const Icon(
                              Icons.edit,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
