import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:course_clone/screens/progress_screen.dart';
import 'package:course_clone/states/make_favorite_controller.dart';
import 'package:course_clone/states/profile_controller.dart';
import 'package:course_clone/theme/color.dart';
import 'package:course_clone/utils/data.dart';
import 'package:course_clone/widgets/custom_image.dart';
import 'package:course_clone/widgets/recommend_item.dart';
import 'package:course_clone/widgets/setting_box.dart';
import 'package:course_clone/widgets/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'bookmark_screen.dart';

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
          _buildSection1(),
          const SizedBox(height: 20),
          // _buildSection2(),
          // const SizedBox(height: 20),
          _buildSection3(),
          //! This is how to update the UI when the data changes
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
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Column(
          children: [
            CustomImage(controller.image, width: 100, height: 100, radius: 20),
            const SizedBox(height: 10),
            Text(
              controller.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
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
          
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Divider(height: 0, color: Colors.grey.withOpacity(0.8)),
          ),
          // SettingItem(
          //   title: "Payment",
          //   leadingIcon: "assets/icons/wallet.svg",
          //   bgIconColor: AppColor.green,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Divider(height: 0, color: Colors.grey.withOpacity(0.8)),
          ),
          GetBuilder<ProfileController>(
            builder: (contrller) {
              return SettingItem(
                onTap: () {
                  Get.to(() => BookmarkScreen());
                },
                title: "Bookmark",
                leadingIcon: "assets/icons/bookmark.svg",
                bgIconColor: AppColor.primary,
                itemCount:
                    contrller.bookmarkedCourses.isNotEmpty
                        ? contrller.bookmarkedCourses.length
                        : null,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSection2() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.cardColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SettingItem(
            title: "Notification",
            leadingIcon: "assets/icons/bell.svg",
            bgIconColor: AppColor.purple,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Divider(height: 0, color: Colors.grey.withOpacity(0.8)),
          ),
          SettingItem(
            title: "Privacy",
            leadingIcon: "assets/icons/shield.svg",
            bgIconColor: AppColor.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildSection3() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.cardColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ),
      ],
    );
  }
}
