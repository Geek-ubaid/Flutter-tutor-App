import 'package:course_clone/states/make_favorite_controller.dart';
import 'package:course_clone/states/profile_controller.dart';
import 'package:get/get.dart';

class StateHoldersBindings extends Bindings {
  //! This is where you register you state holders / controllers
  @override
  void dependencies() {
    Get.put(FavoritesController());
    Get.put(ProfileController());
  }
}
