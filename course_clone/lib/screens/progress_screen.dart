// lib/screens/progress_screen.dart

import 'package:flutter/material.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/utils/data.dart';
import 'package:course_clone/widgets/custom_image.dart';
import 'package:course_clone/screens/detail_screen.dart';
import 'package:course_clone/models/progress_model.dart';
class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Topic> topic = topics;
    final total = topics.length;

    // compute average progress
    var avgProgress = 0.0;
    if (total > 0) {
      final sum = topics.map((t) {
        final secs = t.sections;
        final done = t.completedSections.length;
        return done / secs.length;
      }).reduce((a, b) => a + b);
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
          _buildSummary(avgProgress, total),
          const SizedBox(height: 16),
          _buildStreakBanner(),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context , index)=>Column(
              children: [

                if (topics.isNotEmpty) _buildContinueCard(topic[index]),
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
                _buildProgressCard(topic[index])
                ]
            )),
          ),
        ],
      )

    //   ListView.builder(
    //     padding: const EdgeInsets.all(16),
    //     children: [
    //       _buildSummary(avgProgress, total),
    //       const SizedBox(height: 16),
    //       _buildStreakBanner(),
    //       const SizedBox(height: 16),
    //       if (topics.isNotEmpty) _buildContinueCard(topic[0]),
    //       const SizedBox(height: 16),
    //       _buildQuoteCard(),
    //       const SizedBox(height: 16),
    //       const Text(
    //         'Course Details',
    //         style: TextStyle(
    //           fontSize: 18,
    //           fontWeight: FontWeight.w600,
    //           color: AppColor.textColor,
    //         ),
    //       ),
    //       const SizedBox(height: 12),
    //       // spread without .toList()
    //       ...topics.map(_buildProgressCard),
    //     ],
    //   ),
    );
  }

  Widget _buildSummary(double avg, int total) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primary,
            AppColor.primary.withValues(alpha: 0.7),
          ],
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
              const Text('Your Progress',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              const SizedBox(height: 4),
              Text(
                DateTime.now().toIso8601String().substring(0, 7),
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
          // Average %
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            child: Text(
              '${(avg * 100).toInt()}%',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
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
          Icon(Icons.local_fire_department, color: AppColor.red),
          SizedBox(width: 10),
          Text("🔥 You’re on a 4-day streak!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildContinueCard(Topic topic) {
    return GestureDetector(
      onTap: () async {
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => DetailScreen(topic: topic)),
        // );
        setState(() {}); // refresh when returning
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColor.sky.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CustomImage(topic.image,
                width: 60, height: 60, radius: 12),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Continue Learning:',
                      style: TextStyle(
                          fontSize: 13,
                          color: AppColor.labelColor,
                          fontWeight: FontWeight.w500)),
                  Text(topic.name,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textColor)),
                ],
              ),
            ),
            const Icon(Icons.play_arrow, color: AppColor.primary, size: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildQuoteCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.yellow.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        '“Learning never exhausts the mind.” – Leonardo da Vinci',
        style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget _buildProgressCard(Topic topic) {
    final sections = (topic.sections);
    final doneList =
    (topic.completedSections);

    final doneCount = doneList.length;
    final totalCount = sections.length;
    final percent = totalCount > 0 ? doneCount / totalCount : 0.0;
    final barColor = percent >= 0.7
        ? AppColor.green
        : percent >= 0.4
        ? AppColor.orange
        : AppColor.red;

    return GestureDetector(
      onTap: () async {
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => DetailScreen(topic: topic)),
        // );
        // setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
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
                CustomImage(topic.image,
                    width: 70, height: 70, radius: 12),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(topic.name,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor)),
                      const SizedBox(height: 4),
                      Text('$doneCount of $totalCount completed',
                          style: const TextStyle(
                              fontSize: 13, color: AppColor.labelColor)),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: percent,
                          minHeight: 8,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation(barColor),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('${(percent * 100).toInt()}%',
                            style: const TextStyle(
                                fontSize: 13,
                                color: AppColor.labelColor)),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            // inline section list
            ...sections.map((sec) {
              final done = doneList.contains(sec);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Icon(
                      done
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      size: 16,
                      color: done ? AppColor.green : AppColor.labelColor,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        sec,
                        style: TextStyle(
                          fontSize: 13,
                          color: done
                              ? AppColor.textColor
                              : AppColor.labelColor.withValues(alpha: 0.7),
                          decoration:
                          done ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
