import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/theme/color.dart';

class CourseDetailScreen extends StatelessWidget {
  final Topic course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColor.appBgColor, // Solid status bar background
      ),
      child: Scaffold(
        backgroundColor: AppColor.appBgColor,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0, // Prevent shadow on scroll
          backgroundColor: AppColor.appBgColor,
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: AppColor.appBgColor,
          ),
          iconTheme: const IconThemeData(color: AppColor.textColor),
          title: Text(
            course.name,
            style: const TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(height: 8),
              Text(
                course.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                course.description,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColor.labelColor,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
