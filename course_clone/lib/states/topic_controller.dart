import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/models/single_article_model.dart';
import 'package:course_clone/utils/convert_course_topics.dart';
import 'package:course_clone/utils/data.dart';
import 'package:get/get.dart';

class TopicController extends GetxController {
  bool _loadingState = false;
  List<Topic> topics = [];

  bool get loadingState => _loadingState;
  List<Topic> get getTopics => topics;

  void fetchTopics() async {
    _loadingState = true;
    update();
    try {
      await Future.delayed(const Duration(seconds: 3));
      final allCourses = courses;
      final List<Topic> top = groupIntoTopics(
        allCourses: allCourses,
        converters: converter,
      );
      topics = top;
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
        image: 'assets/icons/category/file.svg',
        price: '0',
        duration: '0',
        session: '0',
        review: '0',
        isFavorited: false,
      ),
    );
    offset = end;
    if (offset >= allCourses.length) break;
  }

  return topics;
}
