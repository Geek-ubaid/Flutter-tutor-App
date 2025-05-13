// lib/screens/home.dart

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:course_clone/theme/color.dart';
import 'package:course_clone/utils/data.dart';
import 'package:course_clone/widgets/category_box.dart';
import 'package:course_clone/widgets/notification_box.dart';
import 'package:course_clone/screens/detail_screen.dart';

/// Alias so root_app.dart’s reference to `Pepsi()` resolves here.
typedef Pepsi = HomePage;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final topics = myProgressCourses;

    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            floating: true,
            snap: true,
            title: _buildAppBar(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([_buildBody(topics)]),
          ),
        ],
      ),
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
              Text(profile['name']!,
                  style: TextStyle(color: AppColor.labelColor, fontSize: 14)),
              const SizedBox(height: 5),
              Text("Good Morning!",
                  style: TextStyle(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18)),
            ],
          ),
        ),
        const NotificationBox(notifiedNumber: 1),
      ],
    );
  }

  Widget _buildBody(List<Map<String, dynamic>> topics) {
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
            child: Text("Featured Topics",
                style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              height: 180,
              enlargeCenterPage: true,
              viewportFraction: .7,
            ),
            items: topics.map(_buildTopicCard).toList(),
          ),
          const SizedBox(height: 25),

          // Recommended horizontal list
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Recommended Topics",
                style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 140,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              itemCount: topics.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) => _buildTopicCard(topics[i]),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
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

  Widget _buildTopicCard(Map<String, dynamic> topic) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailScreen(topic: topic)),
        );
      },
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: AppColor.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor.withValues(alpha: 0.1),
                blurRadius: 4)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // topic image
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                topic['image'] as String,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),
            // topic title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                topic['name'] as String,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 6),
            // section count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "${(topic['sections'] as List).length} sections",
                style: const TextStyle(
                    fontSize: 12, color: AppColor.labelColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
