import 'package:course_clone/state_holeder_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/root_app.dart';
import 'theme/color.dart';
import 'package:course_clone/screens/progress_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: StateHoldersBindings(),
      title: 'Online Course App',
      theme: ThemeData(primaryColor: AppColor.primary),
      home: const ProgressScreen(),
    );
  }
}
