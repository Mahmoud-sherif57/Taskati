import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/services/boxes_name.dart';
import 'package:taskati/core/services/cach_keys.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/themes/dark_theme.dart';
import 'package:taskati/core/themes/light_theme.dart';
import 'package:taskati/features/add_task/data/task_model.dart';
import 'package:taskati/features/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // hive initialization.
  await Hive.initFlutter();
  await Hive.openBox(BoxesName.userInfo);
  Hive.registerAdapter(
      TaskModelAdapter()); // we use this registerAdapter to save an object
  await Hive.openBox<TaskModel>(BoxesName.taskInfo);
  AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(BoxesName.userInfo).listenable(),
      builder: (context, value, child) {
        var darkMode = value.get(CachKeys.darkMode, defaultValue: false);
        return MaterialApp(
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          theme: applightTheme,
          darkTheme: appDarkTheme,
          debugShowCheckedModeBanner: false,
          home: const Scaffold(body: SplashView()),
        );
      },
    );
  }
}


// to change theme in your app you need to do some steps ..
/*
1) handling theme (dark \ light)  => themes folder
2) adjust box by name of the key  => prifileView screen 
3)listen to value of this key => in main file to listen on all the app
4)deal with all of widgets (by theme) 
 */