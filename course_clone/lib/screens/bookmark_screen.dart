import 'package:course_clone/screens/web_view_screen.dart';
import 'package:course_clone/states/profile_controller.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/widgets/recommend_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBgColor,
        title: const Text('Bookmarks'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          if (controller.bookmarkedCourses.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No Bookmarks Yet!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Start saving your favorite courses',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            itemCount: controller.bookmarkedCourses.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final course = controller.bookmarkedCourses[index];
              return RecommendItem(
                course: course,
                onTap: () {
                  Get.to(
                    () => WebViewScreen(
                      url: course.url,
                      title: course.name,
                      id: course.id,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
