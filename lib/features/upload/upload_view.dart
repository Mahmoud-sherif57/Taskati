import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/functions/custom_dialog.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/services/cach_keys.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/home/presentation/view/home_view.dart';

String imagePath = "";
String userName = "";

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primary,
      appBar: AppBar(
        // backgroundColor: AppColors.primary,
        title: Text(
          "Upload Data",
          style: getTitleStyle(context, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                // check userImage & userName
                //1- is done
                //2- no userImage
                //3- no userName
                //4-no userImage & no userName
                if (userName.isNotEmpty) {
                  // cache data and navigate ..
                  AppLocalStorage.setCachData(CachKeys.name, userName);
                  AppLocalStorage.setCachData(CachKeys.image, imagePath);
                  AppLocalStorage.setCachData(CachKeys.isUpload, true);
                  AppRouting.navigateWithReplacement(const HomeView(), context);
                } else if (imagePath.isNotEmpty && userName.isNotEmpty) {
                  showErrorDialog(context, "please, Enter your image");
                } else if (userName.isEmpty) {
                  showErrorDialog(context, "please, Enter your name");
                } else {
                  showErrorDialog(context, "please, Enter your name & image");
                }
              },
              child: const Text("Done"))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundImage: (imagePath.isNotEmpty)
                      ? FileImage(File(imagePath)) as ImageProvider
                      : const AssetImage(AppImages.userProfile),
                ),
                const Gap(20),
                CustomButtonWidget(
                  text: "upload from camera",
                  onPressed: () {
                    uploadImage(isCamera: true);
                  },
                ),
                const Gap(20),
                CustomButtonWidget(
                    text: "upload from Gallery",
                    onPressed: () {
                      uploadImage(isCamera: false);
                    }),
                const Gap(20),
                const Divider(),
                const Gap(20),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Enter Your Name "),
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadImage({required bool isCamera}) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }
}
