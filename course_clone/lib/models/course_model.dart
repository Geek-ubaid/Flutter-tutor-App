import 'package:course_clone/models/course_content_model.dart';

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
  final double price;
  final int lessons;
  final double rating;
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
    this.price = 0.0,
    this.lessons = 0,
    this.rating = 0.0,
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


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'topic': topic,
      'subtopic': subtopic,
      'thumbnail_url': thumbnailUrl,
      'date_published': datePublished.toIso8601String(),
      'price': price,
      'lessons': lessons,
      'rating': rating,
    };
  }

}