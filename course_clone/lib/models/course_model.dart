class Course {
  final int id;
  final String name;
  final String image;
  final String price;
  final String duration;
  final String session;
  final String review;
  final bool isFavorited;
  final String description;

  Course({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.duration,
    required this.session,
    required this.review,
    required this.isFavorited,
    required this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      duration: json['duration'],
      session: json['session'],
      review: json['review'],
      isFavorited: json['is_favorited'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'duration': duration,
      'session': session,
      'review': review,
      'is_favorited': isFavorited,
      'description': description,
    };
  }
}
