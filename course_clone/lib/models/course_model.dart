class Course {
  final String id;
  final String name;
  final String description;
  final String url;
  final String topic;
  final List<String> subtopic;
  final String thumbnailUrl;
  final DateTime datePublished;
  final double price;
  final int lessons;
  final String duration;
  final double rating;


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
    this.duration = "0 hours",
    this.rating = 0.0,

  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      topic: json['topic'],
      subtopic: List<String>.from(json['subtopic']),
      thumbnailUrl: json['thumbnail_url'],
      datePublished: DateTime.parse(json['date_published']),
      price: (json['price'] ?? 0.0).toDouble(),
      lessons: json['lessons'] ?? 0,
      duration: json['duration'] ?? '0 hours',
      rating: (json['rating'] ?? 0.0).toDouble(),
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
      'duration': duration,
      'rating': rating,
    };
  }

}
