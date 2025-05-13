// lib/screens/detail_screen.dart

import 'package:flutter/material.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/widgets/custom_image.dart';

class DetailScreen extends StatefulWidget {
  /// Pass in one entry from your `myProgressCourses` list
  final Map<String, dynamic> topic;

  // use `super.key` instead of manually forwarding `key`
  const DetailScreen({super.key, required this.topic});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late List<String> _completed;

  @override
  void initState() {
    super.initState();
    _completed = List<String>.from(
      widget.topic['completedSections'] as List<dynamic>? ?? <String>[],
    );
  }

  void _markDone(String section) {
    setState(() {
      if (!_completed.contains(section)) {
        _completed.add(section);
      }
      widget.topic['completedSections'] = _completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.topic['name'] as String? ?? 'Topic';
    final desc = widget.topic['description'] as String?;
    final imageUrl = widget.topic['image'] as String?;
    final sections =
    (widget.topic['sections'] as List<dynamic>? ?? <String>[])
        .cast<String>();

    final doneCount = _completed.length;
    final totalCount = sections.length;
    final percent = totalCount > 0 ? doneCount / totalCount : 0.0;
    final barColor = percent >= .7
        ? AppColor.green
        : percent >= .4
        ? AppColor.orange
        : AppColor.red;

    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text(name, style: const TextStyle(color: AppColor.textColor)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          if (imageUrl != null) ...[
            CustomImage(
              imageUrl,
              width: double.infinity,
              height: 180,
              radius: 12,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
          ],
          if (desc != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(desc, style: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 12),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$doneCount of $totalCount completed',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.labelColor,
                      ),
                    ),
                    Text(
                      '${(percent * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: sections.length,
              itemBuilder: (context, i) {
                final section = sections[i];
                final completed = _completed.contains(section);

                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.shadowColor.withAlpha(15),
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            completed ? Colors.green : AppColor.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed:
                          completed ? null : () => _markDone(section),
                          child: Text(
                            completed ? 'Completed ✅' : 'Mark as Done',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
