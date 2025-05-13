import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/models/single_article_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

//! This is a controller class that manages the state of favorite courses
class FavoritesController extends GetxController {
  final List<Course> _favCourses = [];

  List<Course> get favoriteCourses => _favCourses;

  void addToCart(Course course) {
    _favCourses.add(course);
    update();
  }
}
