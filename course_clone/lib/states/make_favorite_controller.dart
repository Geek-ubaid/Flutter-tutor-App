import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/utils/data.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

//! This is a controller class that manages the state of favorite courses
class FavoritesController extends GetxController {
  final List<Topic> _favCourses = [];

  List<Topic> get favoriteCourses => _favCourses;

  void addToCart(Topic course) {
    _favCourses.add(course);
    update();
  }
}
