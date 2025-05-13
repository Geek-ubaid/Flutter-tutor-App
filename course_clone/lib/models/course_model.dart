import '../utils/constant.dart';

class Course {
  final String id;
  final String name;
  final String description;
  final String url;
  final String topic;
  final List<dynamic> subtopic;
  final String thumbnailUrl;
  final DateTime datePublished;
  final String readingTime;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.topic,
    required this.subtopic,
    required this.thumbnailUrl,
    required this.datePublished,
    required this.readingTime
  });

  factory Course.fromJson(Map<String, dynamic> json, String id) {
    return Course(
      id: id,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      topic: TopicExtension.fromString(json['topic'] ?? '').label,
      subtopic: json['subtopic'] ?? [''],
      thumbnailUrl: "assets/icons/category/file.svg",
      datePublished: DateTime.parse(json['date_published']),
      readingTime: json['reading_time'] ?? ''
    );
  }

}
