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
  bool isLiked;
  bool isFinished;

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
    required this.readingTime,
    this.isLiked = false,
    this.isFinished = false,
  });

  factory Course.fromJson(Map<String, dynamic> json, String id) {
    return Course(
      id: id,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      topic: json['topic'] ?? '',
      subtopic: json['subtopic'] ?? [],
      thumbnailUrl: "assets/icons/category/file.svg",
      datePublished: DateTime.parse(json['date_published']),
      readingTime: json['reading_time'] ?? '',
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
      'duration': 'duration',
      'rating': rating,
    };
  }
}

// List<Course> courses = [
//   Course(
//     id: "SqpPbQtPQ5zfqPbrVK9v",
//     name: "Icon Class in Flutter",
//     description:
//         "Icon class in Flutter is used to show specific icons in our app. Instead of creating an image for our icon, we can simply use the Icon class for inserting an icon in our app. For using this class you must ensure that you have set uses-material-design: true in the pubsec.yaml file of your object.",
//     url:
//         "https://www.geeksforgeeks.org/icon-class-in-flutter/", // Dummy course content URL
//     topic: 'Topic.uiComponents.label',
//     subtopic: ["icon"],
//     thumbnailUrl: 'thumbnailUrl',
//     datePublished: DateTime.parse('1969-07-20 20:18:04Z'),
//     price: 110.0,
//     lessons: 1,
//     rating: 4.5,
//     readingTime: "3 mins",
//   ),
//   Course(
//     id: "XyeQYFIPnq8YCUhpGgqC",
//     name: "Customizing Fonts in Flutter",
//     description:
//         "Customization is everywhere, from documents to apps, we can customize everything as we want to. The power of customization is humongous, and it has revolutionized the way we look at technology in this world. Just like how printing “Hello World”, is the basic step towards learning a new programming language, customizing the style of a text is the basic step toward customizing an app. So, let’s see how to customize text in Flutter.",
//     url: "https://www.geeksforgeeks.org/customizing-fonts-in-flutter/",
//     topic: 'Topic.designAndAnimations.label',
//     subtopic: ["font_customization"],
//     thumbnailUrl: 'thumbnailUrl',
//     datePublished: DateTime.parse('1969-07-20 20:18:04Z'),
//     price: 95.0,
//     lessons: 3,
//     rating: 4.2,
//     readingTime: "3 mins",
//   ),
//   Course(
//     id: "eOM8s3d09qDqawjKNR9f",
//     name: "An introduction to the open source SDK by Google",
//     description:
//         "Flutter is Google’s Mobile SDK to build native iOS and Android, Desktop (Windows, Linux, macOS), and Web apps from a single codebase. When building applications with Flutter, everything is Widgets – the blocks with which the flutter apps are built. They are structural elements that ship with a bunch of material design-specific functionalities, and new widgets can be composed out of existing ones, too. The process of composing widgets together is called composition. The User Interface of the app is composed of many simple widgets, each of them handling one particular job. That is the reason why Flutter developers tend to think of their Flutter app as a tree of widgets.",
//     url: "https://www.geeksforgeeks.org/flutter-architecture-application/",
//     topic: 'Topic.basics.label',
//     subtopic: ["introduction"],
//     thumbnailUrl: 'thumbnailUrl',
//     datePublished: DateTime.parse('1969-07-20 20:18:04Z'),
//     price: 80.0,
//     lessons: 3,
//     rating: 3.9,
//     readingTime: "3 mins",
//   ),
//   Course(
//     id: "foGQ5CYuibXWBKDMwPq8",
//     name: "What is Widgets in Flutter?",
//     description:
//         "Flutter is Google’s UI toolkit for crafting beautiful, natively compiled iOS and Android apps from a single code base. To build any application we start with widgets – The building block of Flutter applications. Widgets describe what their view should look like given their current configuration and state. It includes a text widget, row widget, column widget, container widget, and many more.",
//     url:
//         "https://www.geeksforgeeks.org/flutter-an-introduction-to-the-open-source-sdk-by-google/",
//     topic: 'Topic.widgets.label',
//     subtopic: ["introduction"],
//     thumbnailUrl: 'thumbnailUrl',
//     datePublished: DateTime.parse('1969-07-20 20:18:04Z'),
//     price: 72.0,
//     lessons: 8,
//     // duration: '4 hours',
//     rating: 4.9,
//     readingTime: "3 mins",
//   ),
//   Course(
//     id: "foGQ5CYuibXWBKDMwPq8",
//     name: "What is Widgets in Flutter?",
//     description:
//         "Flutter is Google’s UI toolkit for crafting beautiful, natively compiled iOS and Android apps from a single code base. To build any application we start with widgets – The building block of Flutter applications. Widgets describe what their view should look like given their current configuration and state. It includes a text widget, row widget, column widget, container widget, and many more.",
//     url:
//         "https://www.geeksforgeeks.org/flutter-an-introduction-to-the-open-source-sdk-by-google/",
//     topic: 'Topic.widgets.label',
//     subtopic: ["introduction"],
//     thumbnailUrl: 'thumbnailUrl',
//     datePublished: DateTime.parse('1969-07-20 20:18:04Z'),
//     price: 72.0,
//     lessons: 8,
//     // duration: '4 hours',
//     rating: 4.9,
//     readingTime: "3 mins",
//   ),
// ];
