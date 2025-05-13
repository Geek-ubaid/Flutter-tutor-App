import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/models/profile_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Profile _profile = Profile(
    name: "Jeno",
    image: "https://avatars.githubusercontent.com/u/86506519?v=4",
    email: "test@gmail.com",
    favoriteCourses: [],
  );

  Profile get profile => _profile;
  String get name => _profile.name;
  String get image => _profile.image;
  String get email => _profile.email;
  List<Topic> get bookmarkedCourses => _profile.favoriteCourses;

  void addCourseToFav(Topic course) {
    _profile.favoriteCourses.add(course);
    update();
  }
}
