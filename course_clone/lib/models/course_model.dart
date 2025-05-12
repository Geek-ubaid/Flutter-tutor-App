class Course {
  final String id;
  final String name;
  final String description;
  final String url;
  final String topic;
  final List<String> subtopic;
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

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      topic: json['topic'] ?? 'all',
      subtopic: json['subtopic'] ?? [''],
      thumbnailUrl: json['thumbnail_url'] ?? '',
      datePublished: DateTime.parse(json['date_published']),
      readingTime: json['reading_time'] ?? ''
    );
  }

}
