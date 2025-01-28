import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/services/cach_keys.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/home/presentation/view/home_view.dart';
import 'package:taskati/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool isUpload = AppLocalStorage.getCachData(CachKeys.isUpload) ?? false;

    Future.delayed(
      const Duration(seconds: 4),
      () {
        AppRouting.navigateWithReplacement(
            isUpload ? const HomeView() : const UploadView(), context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.appLogo, animate: true),
            const Gap(20),
            Text('Taskati',
                style: getTitleStyle(context,
                    fontSize: 30,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold)),
            const Gap(20),
            Text(
              'It\'s time to Get Organized ',
              style: getBodyStyle(
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
