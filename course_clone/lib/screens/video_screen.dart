import 'package:flutter/material.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/widgets/custom_image.dart';

class VideoScreen extends StatelessWidget {
  final Map course;

  const VideoScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        elevation: 0,
        title: Text(
          course["name"] ?? "Course",
          style: const TextStyle(
            color: AppColor.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomImage(course["image"], width: double.infinity, height: 180, radius: 16),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfo("Duration", course["duration"]),
                _buildInfo("Sessions", course["session"]),
                _buildInfo("Rating", course["review"]),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: course["complete_percent"] ?? 0.0,
              minHeight: 8,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColor.primary,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${(course["complete_percent"] * 100).toInt()}% Completed",
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColor.labelColor,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              course["description"] ?? "No description provided for this course.",
              style: const TextStyle(fontSize: 15, color: AppColor.textColor),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for future video/lesson screen
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Start Lesson tapped!"),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.play_arrow),
              label: const Text("Start Lesson"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
              fontSize: 13,
              color: AppColor.labelColor,
              fontWeight: FontWeight.w500,
            )),
        const SizedBox(height: 4),
        Text(value ?? "-",
            style: const TextStyle(
              fontSize: 14,
              color: AppColor.textColor,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}
