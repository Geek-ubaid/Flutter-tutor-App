class CourseContentModel {
  final String title;
  final List<String> subContent;

  CourseContentModel({required this.title, required this.subContent});

  factory CourseContentModel.fromJson(Map<String, dynamic> json) {
    return CourseContentModel(
      title: json['title'] as String,
      subContent: List<String>.from(json['subContent'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'subContent': subContent};
  }

  @override
  String toString() {
    return 'CourseContentModel(title: $title, subContent: $subContent)';
  }
}
