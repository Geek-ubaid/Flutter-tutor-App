import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/screens/video_screen.dart';
import 'package:course_clone/states/profile_controller.dart';
import 'package:course_clone/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPageScreen extends StatefulWidget {
  final Course course;
  const DetailPageScreen({super.key, required this.course});

  @override
  State<DetailPageScreen> createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  bool aboutExpand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBgColor,
        title: Text('Detail'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag:
                  widget
                      .course
                      .image, // Ensure the tag matches the one used in the previous screen
              child: Image.network(widget.course.image),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    widget.course.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final controller = Get.find<ProfileController>();
                    if (controller.bookmarkedCourses.any(
                      (course) => course.id == widget.course.id,
                    )) {
                      controller.bookmarkedCourses.removeWhere(
                        (course) => course.id == widget.course.id,
                      );
                    } else {
                      controller.addCourseToFav(widget.course);
                    }
                    controller.update();
                  },
                  icon: GetBuilder<ProfileController>(
                    builder: (controller) {
                      bool bookmarked = controller.bookmarkedCourses.any(
                        (course) => course.id == widget.course.id,
                      );
                      return Icon(
                        bookmarked ? Icons.bookmark : Icons.bookmark_outline,
                        color: AppColor.primary,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildAttributes(),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _getAttribute(
                        Icons.timer,
                        AppColor.primary,
                        '15 Minutes reading',
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.sky,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: AppColor.sky),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder:
                          //         (context) => VideoPlayerPage(
                          //           videoLink:
                          //               'https://www.youtube.com/watch?v=EcnqFasHf18',
                          //         ),
                          //   ),
                          // );
                          Get.to(
                            () => VideoPlayerPage(
                              videoLink:
                                  'https://www.youtube.com/watch?v=EcnqFasHf18',
                            ),
                          );
                        },
                        child: const Text('Video'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.description,
                        style: const TextStyle(fontSize: 16),
                        maxLines: aboutExpand ? null : 2,
                        overflow: aboutExpand ? null : TextOverflow.ellipsis,
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            aboutExpand = !aboutExpand;
                          });
                        },
                        child: Text(
                          aboutExpand ? 'Show less' : 'Show more',
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Course Content',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.course.content!.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Text(
                          widget.course.content![index].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        children:
                            widget.course.content![index].subContent
                                .map(
                                  (content) => ListTile(
                                    title: Text(content),

                                    // leading: Icon(Icons.play_circle_outline),
                                  ),
                                )
                                .toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Add your action here
            //   },
            //   child: const Text('Enroll Now'),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttributes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _getAttribute(
          Icons.play_circle_outlined,
          AppColor.labelColor,
          widget.course.session,
        ),
        const SizedBox(width: 12),
        _getAttribute(
          Icons.schedule_rounded,
          AppColor.labelColor,
          widget.course.duration,
        ),
        const SizedBox(width: 12),
        _getAttribute(Icons.star, AppColor.yellow, widget.course.review),
        const SizedBox(width: 12),
      ],
    );
  }

  _getAttribute(IconData icon, Color color, String info) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 3),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColor.labelColor, fontSize: 13),
        ),
      ],
    );
  }
}
