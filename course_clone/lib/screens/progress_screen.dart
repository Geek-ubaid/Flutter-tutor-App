// lib/screens/progress_screen.dart

import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/screens/detail_screen.dart';
import 'package:course_clone/states/progress_tracker_controller.dart';
import 'package:course_clone/states/topic_controller.dart';
import 'package:flutter/material.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/utils/data.dart';
import 'package:course_clone/widgets/custom_image.dart';
import 'package:course_clone/models/progress_model.dart';
import 'package:get/get.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final List<TopicLabels> topic = topics;
    final total = topics.length;

    // compute average progress
    var avgProgress = 0.0;
    if (total > 0) {
      final sum = topics
          .map((t) {
            final secs = t.sections;
            final done = t.completedSections.length;
            return done / secs.length;
          })
          .reduce((a, b) => a + b);
      avgProgress = sum / total;
    }

    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: const Text(
          'My Progress',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColor.textColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          GetBuilder<ProgressTrackerContoller>(
            builder: (controller) {
              return _buildSummary(controller.completedCourses.length, 82);
            },
          ),
          const SizedBox(height: 16),
          _buildStreakBanner(),
          const SizedBox(height: 16),
          Column(
            children: [
              if (topics.isNotEmpty) _buildContinueCard(topic[0]),
              const SizedBox(height: 16),
              _buildQuoteCard(),
              const SizedBox(height: 16),
              const Text(
                'Course Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor,
                ),
              ),
              const SizedBox(height: 12),
              // spread without .toList()
            ],
          ),
          Expanded(
            child: GetBuilder<TopicController>(
              builder: (topicContoller) {
                return GetBuilder<ProgressTrackerContoller>(
                  builder: (progressContoller) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: topicContoller.getTopics.length,
                      separatorBuilder: (context, index) => SizedBox(height: 5),
                      itemBuilder: (context, index) {
                        final topic = topicContoller.getTopics[index];
                        final completed = progressContoller.completedCourses;
                        return _buildProgressCard(topic, completed);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(int completed, int total) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.primary, AppColor.primary.withValues(alpha: 0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColor.primary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Label + date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                DateTime.now().toIso8601String().substring(0, 7),
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),

          // Average %
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$completed / $total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Lessons Completed',
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            child: Text(
              '${(completed / total * 100).toStringAsFixed(1)}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStreakBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.pink.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Text(
            "🔥 You’re on a 4-day streak!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueCard(TopicLabels t) {
    return GetBuilder<TopicController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () async {
            Get.to(() => DetailPageScreen(topic: controller.getTopics[0]));
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColor.sky.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CustomImage(
                  controller.getTopics[0].image,
                  width: 60,
                  height: 60,
                  radius: 12,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Continue Learning:',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.labelColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        controller.getTopics[0].name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.play_arrow, color: AppColor.primary, size: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuoteCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.yellow.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '“Learning never exhausts the mind.”',
            style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                '– Leonardo da Vinci',
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(Topic topic, List<String> compltedIds) {
    int compelted = 0;
    for (var course in topic.courses!) {
      if (compltedIds.contains(course.id)) {
        compelted++;
      }
    }
    return GestureDetector(
      onTap: () async {
        Get.to(() => DetailPageScreen(topic: topic));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 3),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top row
            Row(
              children: [
                CustomImage(topic.image, width: 70, height: 70, radius: 12),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topic.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$compelted of ${topic.courses!.length} completed Lessons',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColor.labelColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: (compelted / topic.courses!.length),
                          minHeight: 8,
                          color: AppColor.primary,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation(AppColor.purple),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${(compelted / topic.courses!.length * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColor.labelColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            // inline section list
            // ...sections.map((sec) {
            //   final done = doneList.contains(sec);
            //   return Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 2),
            //     child: Row(
            //       children: [
            //         Icon(
            //           done ? Icons.check_circle : Icons.radio_button_unchecked,
            //           size: 16,
            //           color: done ? AppColor.green : AppColor.labelColor,
            //         ),
            //         const SizedBox(width: 6),
            //         Expanded(
            //           child: Text(
            //             sec,
            //             style: TextStyle(
            //               fontSize: 13,
            //               color:
            //                   done
            //                       ? AppColor.textColor
            //                       : AppColor.labelColor.withValues(alpha: 0.7),
            //               decoration: done ? TextDecoration.lineThrough : null,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
