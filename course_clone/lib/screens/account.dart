import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:course_clone/screens/progress_screen.dart';
import 'package:course_clone/states/make_favorite_controller.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/utils/data.dart';
import 'package:course_clone/widgets/custom_image.dart';
import 'package:course_clone/widgets/recommend_item.dart';
import 'package:course_clone/widgets/setting_box.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: const Text(
            "Account",
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SliverToBoxAdapter(child: _buildBody()),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _buildProfile(),
          const SizedBox(height: 20),
          _buildRecord(),
          const SizedBox(height: 20),
          _buildProgressSection(),
          const SizedBox(height: 20),
          GetBuilder<FavoritesController>(
            builder: (controller) => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.favoriteCourses.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) =>
                  RecommendItem(data: controller.favoriteCourses[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Column(
      children: [
        CustomImage(profile["image"]!, width: 70, height: 70, radius: 20),
        const SizedBox(height: 10),
        Text(
          profile["name"]!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildRecord() {
    return Row(
      children: const [
        Expanded(
          child:
          SettingBox(title: "12 courses", icon: "assets/icons/work.svg"),
        ),
        SizedBox(width: 10),
        Expanded(
          child:
          SettingBox(title: "55 hours", icon: "assets/icons/time.svg"),
        ),
        SizedBox(width: 10),
        Expanded(
          child: SettingBox(title: "4.8", icon: "assets/icons/star.svg"),
        ),
      ],
    );
  }

  Widget _buildProgressSection() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const ProgressScreen()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColor.cardColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor.withAlpha(20),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Row(
              children: [
                // Circle background + icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bar_chart,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "My Progress",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios,
                    color: AppColor.darker, size: 16),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            // TODO: Logout logic
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColor.cardColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor.withAlpha(20),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.darker,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios,
                    color: AppColor.darker, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
