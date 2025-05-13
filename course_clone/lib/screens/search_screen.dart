import 'package:course_clone/models/single_article_model.dart';
import 'package:course_clone/states/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:course_clone/theme/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.courses});
  final List<Course> courses;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

Set<String> savedCourseIds = {};

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final controller = Get.find<CourseController>();

  List<String> filters = [];
  String selectedFilter = 'All';
  String searchQuery = "";

  @override
  void initState() {
    super.initState();

    // Unique topics + 'All'
    final allTopics = widget.courses.map((c) => c.topic).toSet().toList();
    filters = ['All', ...allTopics];
    if (widget.initialFilter != null &&
        filters.contains(widget.initialFilter)) {
      selectedFilter = widget.initialFilter!;
    } else {
      selectedFilter = 'All';
    }
    _searchController.addListener(() {
      setState(() {
        searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<Course> courses = Provider.of<List<Course>>(context);

    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.appBgColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: AppColor.appBgColor,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.textColor),
        title: const Text(
          "Explore",
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 8),
            _buildFilters(),
            const SizedBox(height: 8),
            Expanded(child: _buildCourseList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            filters.map((filter) {
              final isSelected = filter == selectedFilter;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(filter),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                  selectedColor: AppColor.primary.withOpacity(0.9),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColor.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 7,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildCourseList() {
    final filteredCourses =
        widget.courses.where((course) {
          final matchesFilter =
              selectedFilter == 'All' ||
              course.topic.toLowerCase() == selectedFilter.toLowerCase();

          final query = searchQuery.toLowerCase();

          final matchesQuery =
              course.name.toLowerCase().contains(query) ||
              course.topic.toLowerCase().contains(query) ||
              course.subtopic.any((sub) => sub.toLowerCase().contains(query));

          return matchesFilter && (searchQuery.isEmpty || matchesQuery);
        }).toList();

    if (filteredCourses.isEmpty) {
      return const Center(
        child: Text(
          "No courses found",
          style: TextStyle(color: AppColor.labelColor),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredCourses.length,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildCourseCard(filteredCourses[index]),
          ),
    );
  }

  Widget _buildCourseCard(Course course) {
    final isSaved = savedCourseIds.contains(course.id);

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => CourseDetailScreen(course: course),
        //   ),
        // );
      },
      child: Material(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 12),
                        height: 100,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SvgPicture.asset(
                            course.thumbnailUrl,
                            fit: BoxFit.contain,
                            height: 90,
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 9),
                          Row(
                            children: [
                              _iconText(
                                Icons.play_circle_outline,
                                "${course.lessons} lessons",
                              ),
                              _iconText(Icons.schedule, course.readingTime),
                              _iconText(
                                Icons.star,
                                course.rating.toString(),
                                iconColor: Colors.amber,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: IconButton(
                    onPressed: () {
                      final ctrl = Get.find<ProfileController>();
                      ctrl.toggleBookmark(course);
                    },
                    // tie this builder to the same id you used in update()
                    // so only this icon rebuilds
                    icon: GetBuilder<ProfileController>(
                      id: course.id,
                      builder: (ctrl) {
                        final bookmarked = ctrl.bookmarkedCourses.any(
                          (c) => c.id == course.id,
                        );
                        return Icon(
                          bookmarked ? Icons.bookmark : Icons.bookmark_outline,
                          color: AppColor.primary,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconText(
    IconData icon,
    String label, {
    Color iconColor = AppColor.labelColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(width: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColor.labelColor),
          ),
        ],
      ),
    );
  }
}
