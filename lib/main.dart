import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/add_task/data/task_model.dart';
import 'package:taskati/features/splash_view.dart';

Future<void> main() async {
  // hive initialization.
  await Hive.initFlutter();
  await Hive.openBox('userInfo');
  Hive.registerAdapter(
      TaskModelAdapter()); // we use this line to save an object
  await Hive.openBox<TaskModel>('taskInfo');
  AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      // light theme.
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
          fontFamily: GoogleFonts.poppins().fontFamily,
          inputDecorationTheme: InputDecorationTheme(
            // constraints: const BoxConstraints(maxHeight: 60),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(10),
            ),
          )),
      // dark theme .
      darkTheme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: SplashView()),
    );
  }
}
