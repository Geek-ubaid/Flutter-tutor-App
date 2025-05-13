import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/widgets/notification_box.dart';
import 'package:course_clone/widgets/category_box.dart';
import 'package:course_clone/widgets/feature_item.dart';
import 'package:course_clone/widgets/recommend_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../states/make_favorite_controller.dart';
import '../utils/data.dart';
import '../utils/features_dummy_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? nickname;

  @override
  void initState() {
    super.initState();
    fetchNickname();
  }

  Future<void> fetchNickname() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final doc = await FirebaseFirestore.instance.collection("users").doc(uid).get();
      if (doc.exists) {
        setState(() {
          nickname = doc.data()?["nickname"] ?? "";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  (context, index) => _buildBody(),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nickname ?? "",
                style: TextStyle(color: AppColor.labelColor, fontSize: 14),
              ),
              const SizedBox(height: 5),
              const Text(
                "Good Morning!",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColor.textColor,
                ),
              ),
            ],
          ),
        ),
        NotificationBox(notifiedNumber: 1),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategories(),
          const SizedBox(height: 15),
          _buildSectionTitle("Featured"),
          _buildFeatured(),
          const SizedBox(height: 15),
          _buildSectionHeader("Recommended", "See all"),
          _buildRecommended(),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColor.textColor,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String left, String right) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
            ),
          ),
          Text(right, style: const TextStyle(fontSize: 14, color: AppColor.darker)),
        ],
      ),
    );
  }

  Widget _buildFeatured() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        features.length,
            (index) => FeatureItem(
          data: features[index],
          onTap: () {
            Get.find<FavoritesController>().addToCart(features[index]);
          },
        ),
      ),
    );
  }

  Widget _buildRecommended() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(data: recommends[index]),
          ),
        ),
      ),
    );
  }
}
