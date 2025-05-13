// lib/screens/home.dart

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:course_clone/models/profile_model.dart';
import 'package:course_clone/screens/detail_screen.dart';
import 'package:course_clone/states/make_favorite_controller.dart';
import 'package:course_clone/states/profile_controller.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/utils/data.dart';
import 'package:course_clone/utils/features_dummy_data.dart';
import 'package:course_clone/widgets/category_box.dart';
import 'package:course_clone/widgets/notification_box.dart';

/// Alias so root_app.dart’s reference to `Pepsi()` resolves here.
typedef Pepsi = HomePage;
import 'package:course_clone/widgets/recommend_item.dart';
import 'package:flutter/material.dart';
import 'package:course_clone/screens/search_screen.dart';

import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    List<Course> courses = Provider.of<List<Course>>(context);
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
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildBody(courses),
              childCount: 1,
            ),
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
              Text(
                profile.name ?? '',
                style: TextStyle(color: AppColor.labelColor, fontSize: 14),
              ),
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


  _buildBody(List<Course> courses) {
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
          _buildFeatured(courses),
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
                )

              ],
            ),
          ),
          _buildAll(courses),
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

  _buildFeatured(List<Course> courses) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        courses.length,
        (index) => FeatureItem(
          data: courses[index],
          onTap: () {
            //! This is how to update the state of the controller
            // Get.find<FavoritesController>().addToCart(features[index]);
          },
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

  _buildAll(List<Course> courses){
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(
          courses.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: RecommendItem(data: courses[index]),
          ),
        ),
      ),
    );
  }
}
