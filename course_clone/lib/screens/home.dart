import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/models/profile_model.dart';
import 'package:course_clone/screens/detail_screen.dart';
import 'package:course_clone/states/make_favorite_controller.dart';
import 'package:course_clone/states/profile_controller.dart';
import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/services/firestore_api.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/utils/data.dart';
import 'package:course_clone/utils/features_dummy_data.dart';
import 'package:course_clone/widgets/category_box.dart';
import 'package:course_clone/widgets/feature_item.dart';
import 'package:course_clone/widgets/notification_box.dart';
import 'package:course_clone/widgets/recommend_item.dart';
import 'package:flutter/material.dart';
import 'package:course_clone/screens/search_screen.dart';

import 'package:provider/provider.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
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
            snap: true,
            floating: true,
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
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.name ?? '',
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
        NotificationBox(notifiedNumber: 1),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Featured",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
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

  _buildCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(
              selectedColor: Colors.white,
              data: categories[index],
              onTap: null,
            ),
          ),
        ),
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
      ),
    );
  }

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
