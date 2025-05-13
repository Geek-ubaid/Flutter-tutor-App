// lib/screens/home.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_clone/models/single_article_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/utils/data.dart';
import 'package:course_clone/widgets/category_box.dart';
import 'package:course_clone/widgets/notification_box.dart';
import 'package:course_clone/widgets/recommend_item.dart';
import 'package:course_clone/screens/search_screen.dart';
import 'package:get/get.dart';

import '../models/course_model.dart';
import '../states/course_controller.dart';
import '../widgets/feature_item.dart';

/// Alias so root_app.dart’s reference to `Pepsi()` resolves here.
typedef Pepsi = HomePage;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? nickname;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNickname();
  }

  Future<void> fetchNickname() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final doc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      if (doc.exists) {
        setState(() {
          nickname = doc.data()?["nickname"] ?? "";
        });
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Course> courses = Provider.of<List<Course>>(context);

    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return _buildSkeletonScreen();
        }

        if (controller.courses.isEmpty) {
          return Center(child: Text('No courses available.'));
        }

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColor.appBarColor,
              pinned: true,
              floating: true,
              snap: true,
              title: _buildAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildBody(controller.courses),
                childCount: 1,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Greeting + name
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nickname ?? '',
                style: TextStyle(color: AppColor.labelColor, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Text(
                "Good Morning!",
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const NotificationBox(notifiedNumber: 1),
      ],
    );
  }

  _buildBody(List<Course> courses) {
    List<Topic> topic = dummyfeatures;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategories(),
          const SizedBox(height: 15),
          // Featured carousel
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Featured Topics",
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _buildFeatured(topic),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Daily Read",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  child: Text(
                    "See all",
                    style: TextStyle(fontSize: 14, color: AppColor.darker),
                  ),
                ),
              ],
            ),
          ),
          _buildAll(topic),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            categories.map((cat) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CategoryBox(
                  data: cat,
                  onTap: () {
                    // TODO: implement filtering
                  },
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildFeatured(List<Topic> courses) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: 0.75,
      ),
      items:
          courses.map((course) {
            return Builder(
              builder: (BuildContext context) {
                return FeatureItem(
                  data: course,
                  onTap: () {
                    // You can update your controller logic here
                    // Get.find<FavoritesController>().addToCart(course);
                  },
                );
              },
            );
          }).toList(),
    );
  }

  _buildAll(List<Topic> courses) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(
          courses.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: RecommendItem(data: limitedCourses[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fake category boxes
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder:
                  (context, index) => Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
            ),
          ),
          const SizedBox(height: 20),
          // Fake featured carousel items
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder:
                  (context, index) => Container(
                    width: 250,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
            ),
          ),
          const SizedBox(height: 20),
          // Fake list items
          Column(
            children: List.generate(3, (index) {
              return Container(
                height: 120,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
