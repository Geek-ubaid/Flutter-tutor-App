class Topic {
  final int id;
  final String name;
  final String image;
  final String description;
  final List<String> sections;
  List<String> completedSections;

  Topic({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.sections,
    this.completedSections = const [],
  });

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      sections: List<String>.from(map['sections'] ?? []),
      completedSections: List<String>.from(map['completedSections'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'sections': sections,
      'completedSections': completedSections,
    };
  }
}
