import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/models/single_article_model.dart';
import 'package:course_clone/services/firestore_api.dart';
import 'package:course_clone/utils/convert_course_topics.dart';
import 'package:get/get.dart';

class TopicController extends GetxController {
  DatabaseService databaseService = DatabaseService();
  bool _loadingState = false;
  List<Topic> _topics = [];
  List<Course> _allCourses = [];

  bool get loadingState => _loadingState;
  List<Course> get getCourses => _allCourses;
  List<Topic> get getTopics => _topics;

  void toggleCourseLike(String courseId) {
    final courseIndex = _allCourses.indexWhere(
      (course) => course.id == courseId,
    );
    if (courseIndex != -1) {
      _allCourses[courseIndex].isLiked = !_allCourses[courseIndex].isLiked;
      update();
    }
  }

  void fetchTopics() async {
    _loadingState = true;
    update();
    try {
      final allCourses = await databaseService.fetchCourses.first;
      _allCourses = allCourses;
      final List<Topic> top = groupIntoTopics(
        allCourses: allCourses,
        converters: converter,
      );
      _topics = top;
    } catch (e) {
      // Handle error
    } finally {
      _loadingState = false;
      update();
    }
  }
}

List<Topic> groupIntoTopics({
  required List<Course> allCourses,
  required List<Converter> converters,
}) {
  final List<Topic> topics = [];
  int offset = 0;

  for (var cfg in converters) {
    // guard in case counts ever disagree
    final end = (offset + cfg.numOfLessons).clamp(0, allCourses.length);
    final chunk = allCourses.sublist(offset, end);
    topics.add(
      Topic(
        id: 1,
        name: cfg.topicName,
        description: cfg.description,
        courses: chunk,
        content: [],
        image: cfg.image,
        price: '0',
        duration: '0',
        session: '0',
        review: '0',
        isFavorited: false,
        videoUrl: cfg.videoUrl,
      ),
    );
    offset = end;
    if (offset >= allCourses.length) break;
  }

  return topics;
}
