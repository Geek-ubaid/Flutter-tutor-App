import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProgressTrackerContoller extends GetxController {
  final List<String> _completedCourses = [];

  List<String> get completedCourses => _completedCourses;

  void addToComplted(String id) {
    _completedCourses.add(id);
    update();
  }

  void removeFromCompleted(String id) {
    _completedCourses.remove(id);
    update();
  }
}
