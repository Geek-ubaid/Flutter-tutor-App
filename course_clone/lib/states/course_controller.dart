import 'package:get/get.dart';

import '../models/course_model.dart';
import '../services/firestore_api.dart';

class CourseController extends GetxController {
  RxList<Course> courses = <Course>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    courses.bindStream(DatabaseService().fetchCourses);
    isLoading.value = false;
  }
}