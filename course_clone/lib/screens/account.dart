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
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody()),
      ],
    );
  }

  _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Account",
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _buildProfile(),
          const SizedBox(height: 20),
          _buildRecord(),
          const SizedBox(height: 20),
          _buildSection1(),
          const SizedBox(height: 20),
          // _buildSection2(),
          // const SizedBox(height: 20),
          _buildSection3(),
          //! This is how to update the UI when the data changes
          GetBuilder<FavoritesController>(
            builder: (controller) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: controller.favoriteCourses.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final course = controller.favoriteCourses[index];
                  return RecommendItem(data: course);
                },
              );
            },
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SettingBox(title: "12 courses", icon: "assets/icons/work.svg"),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SettingBox(title: "55 hours", icon: "assets/icons/time.svg"),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SettingBox(title: "4.8", icon: "assets/icons/star.svg"),
        ),
      ],
    );
  }

  Widget _buildSection1() {
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
          InkWell(
            onTap: () {},
            child: SettingItem(
              title: "Setting",
              leadingIcon: "assets/icons/setting.svg",
              bgIconColor: AppColor.blue,
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
        ],
      ),
      child: SettingItem(
        title: "Log Out",
        leadingIcon: "assets/icons/logout.svg",
        bgIconColor: AppColor.darker,
      ),
    );
  }
}
