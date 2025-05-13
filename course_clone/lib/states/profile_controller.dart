import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/models/profile_model.dart';
import 'package:course_clone/models/single_article_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Profile _profile = Profile(
    name: "Jeno",
    image: "https://avatars.githubusercontent.com/u/86506519?v=4",
    email: "test@gmail.com",
    favoriteCourses: [],
  );

  List<Course> get bookmarkedCourses => _profile.favoriteCourses;
  int get bookmarkedCoursesCount => _profile.favoriteCourses.length;

  /// Toggle in/out and notify listeners.
  void toggleBookmark(Course course) {
    final exists = _profile.favoriteCourses.any((c) => c.id == course.id);

    if (exists) {
      _profile.favoriteCourses.removeWhere((c) => c.id == course.id);
    } else {
      _profile.favoriteCourses.add(course);
    }

    // If you give each card a GetBuilder id,
    // you can pass [course.id] here to rebuild only that one.
    update([course.id, bookmarkedCoursesCount]);
  }
}
