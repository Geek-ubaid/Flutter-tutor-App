import 'package:course_clone/models/course_model.dart';
import 'package:course_clone/models/progress_model.dart';
import 'constant.dart';
import 'package:course_clone/models/profile_model.dart';


/// Stub lists for your Course widgets (populate as needed)
final List<Course> features  = [];
final List<Course> recommends = [];

/// Progress tracking topics, each with a list of sections and a record of completed ones.
final List<Map<String, dynamic>> myProgressCourses = [
  {
    'id': 1,
    'name': 'Basics',
    'image': 'https://via.placeholder.com/150',
    'description': 'Fundamental concepts and setup for Flutter development.',
    'sections': <String>[
      'Flutter – Introduction',
      'Flutter – Architecture Application',
      'Android Studio Setup for Flutter Development',
      'Flutter – Setup for Application Development',
      'Flutter Development on Ubuntu',
    ],
    'completedSections': <String>[],
  },
  {
    'id': 2,
    'name': 'Widgets',
    'image': 'https://via.placeholder.com/150',
    'description': 'Deep dive into Flutter\'s widget system.',
    'sections': <String>[
      'Flutter – Widgets',
      'Flutter – Stateful vs Stateless Widgets',
      'MaterialApp class in Flutter',
      'Scaffold class in Flutter',
      'Flutter – AppBar Widget',
      'Flutter – FloatingActionButton',
      'BottomNavigationBar Widget in Flutter',
      'Drawer Widget in Flutter',
      'Container class in Flutter',
      'Flutter – SizedBox Widget',
      'ClipRRect Widget in Flutter',
      'Flutter – RichText Widget',
      'ListView Class in Flutter',
      'Flutter – GridView',
      'Flutter – TextField',
    ],
    'completedSections': <String>[],
  },
  {
    'id': 3,
    'name': 'UI Components',
    'image': 'https://via.placeholder.com/150',
    'description': 'Building and customizing UI components in Flutter.',
    'sections': <String>[
      'Icon Class in Flutter',
      'Expanded Class in Flutter',
      'Flutter – Checkbox Widget',
      'Flutter – Carousel Slider',
      'Flutter – Staggered Grid View',
      'Flutter – Circular & Linear Progress Indicators',
      'Alert Dialog box in Flutter',
      'Flutter – Dialogs',
      'Flutter – Handling videos',
      'Flutter – Expansion Tile Card',
      'Flutter – Tabs',
      'Flutter – Horizontal List',
      'Flutter – Working with Charts',
      'Flutter – Convex Bottombar',
      'Flutter – Slidable',
      'Flutter – Snackbar',
    ],
    'completedSections': <String>[],
  },
  {
    'id': 4,
    'name': 'Design & Animations',
    'image': 'https://via.placeholder.com/150',
    'description': 'Implementing design patterns and animations.',
    'sections': <String>[
      'Customizing Fonts in Flutter',
      'Flutter – Themes',
      'Flutter – Auto size text',
      'Flutter – Skeleton Text',
      'Flutter – Animation in Route Transition',
      'Flutter – Ripple Effect',
      'Flutter – Lazy Loader',
      'Flutter – Radial Hero Animation',
      'Flutter – Hinge Animation',
      'Flutter – Lottie Animation',
      'ProgressIndicator in Flutter',
      'Flutter – Physics Simulation in Animation',
      'Flutter – Using Google fonts',
      'Flutter – Rotate Transition',
      'Flutter – Animated Splash Screen',
      'Flutter – Shimmer',
      'Rive animations in Flutter',
    ],
    'completedSections': <String>[],
  },
  {
    'id': 5,
    'name': 'Forms & Gestures',
    'image': 'https://via.placeholder.com/150',
    'description': 'Handling user input via forms and gestures.',
    'sections': <String>[
      'Form Validation in Flutter',
      'Designing a Form Submission Page in Flutter',
      'Flutter – Gestures',
    ],
    'completedSections': <String>[],
  },
  {
    'id': 6,
    'name': 'Navigation & Routing',
    'image': 'https://via.placeholder.com/150',
    'description': 'Managing app navigation and routing.',
    'sections': <String>[
      'Routes and Navigator in Flutter',
      'Multi-Page Applications in Flutter',
      'Flutter – Named Routes',
      'Flutter – Arguments in Named Routes',
      'Flutter – Return Data from Screen',
      'URLs in Flutter',
      'Retrieve Data From TextFields in Flutter',
      'Flutter – WebSockets',
      'Flutter – Avoiding Jank',
      'Flutter – Updating Data on the Internet',
      'Flutter – Fetching Data From the Internet',
      'Flutter – Deleting Data On The Internet',
      'Flutter – Sending Data To the Internet',
      'Flutter – Send Data to Screen',
      'Flutter – Send Data to the Screen using RouteSettings',
    ],
    'completedSections': <String>[],
  },
  {
    'id': 7,
    'name': 'Accessing Device',
    'image': 'https://via.placeholder.com/150',
    'description': 'Using device features like camera, storage, sensors.',
    'sections': <String>[
      'Gallery Access in Flutter',
      'Camera Access in Flutter',
      'Background local notifications in Flutter',
      'Restrict Landscape Mode in Flutter',
    ],
    'completedSections': <String>[],
  },
  {
    'id': 8,
    'name': 'Advanced Concepts',
    'image': 'https://via.placeholder.com/150',
    'description': 'Exploring advanced Flutter and Dart topics.',
    'sections': <String>[
      'Flutter – Read and Write Data on Firebase',
      'Mail and SMS in Flutter',
      'Making Calls in Flutter',
      'FAB – Speed Dial in Flutter',
      'Flutter – Wakelock',
      'Implementing REST API in Flutter',
      'HTTP GET Response in Flutter',
    ],
    'completedSections': <String>[],
  },
  {
    'id': 9,
    'name': 'App Projects',
    'image': 'https://via.placeholder.com/150',
    'description': 'Building complete Flutter applications.',
    'sections': <String>[
      'Basic Quiz App In Flutter API',
      'A Hello World App Using Flutter',
      'Creating a Simple Application in Flutter',
      'Flutter – Simple PDF-Generating App',
      'Flutter – Dice Roller App',
      'Flutter – Magic 8-Ball App',
    ],
    'completedSections': <String>[],
  },
];


final List<TopicLabels> topics = [
TopicLabels(
    id: 1,
    name: 'Basics',
    image: 'https://via.placeholder.com/150',
    description: 'Fundamental concepts and setup for Flutter development.',
    sections: [
      'Flutter – Introduction',
      'Flutter – Architecture Application',
      'Android Studio Setup for Flutter Development',
      'Flutter – Setup for Application Development',
      'Flutter Development on Ubuntu',
    ],
  ),
      TopicLabels(
    id: 2,
    name: 'Widgets',
    image: 'https://via.placeholder.com/150',
    description: 'Deep dive into Flutter\'s widget system.',
    sections: [
      'Flutter – Widgets',
      'Flutter – Stateful vs Stateless Widgets',
      'MaterialApp class in Flutter',
      'Scaffold class in Flutter',
      'Flutter – AppBar Widget',
      'Flutter – FloatingActionButton',
      'BottomNavigationBar Widget in Flutter',
      'Drawer Widget in Flutter',
      'Container class in Flutter',
      'Flutter – SizedBox Widget',
      'ClipRRect Widget in Flutter',
      'Flutter – RichText Widget',
      'ListView Class in Flutter',
      'Flutter – GridView',
      'Flutter – TextField',
    ],
  ),
TopicLabels(
    id: 3,
    name: 'UI Components',
    image: 'https://via.placeholder.com/150',
    description: 'Building and customizing UI components in Flutter.',
    sections: [
      'Icon Class in Flutter',
      'Expanded Class in Flutter',
      'Flutter – Checkbox Widget',
      'Flutter – Carousel Slider',
      'Flutter – Staggered Grid View',
      'Flutter – Circular & Linear Progress Indicators',
      'Alert Dialog box in Flutter',
      'Flutter – Dialogs',
      'Flutter – Handling videos',
      'Flutter – Expansion Tile Card',
      'Flutter – Tabs',
      'Flutter – Horizontal List',
      'Flutter – Working with Charts',
      'Flutter – Convex Bottombar',
      'Flutter – Slidable',
      'Flutter – Snackbar',
    ],
  ),
    TopicLabels(
    id: 4,
    name: 'Design & Animations',
    image: 'https://via.placeholder.com/150',
    description: 'Implementing design patterns and animations.',
    sections: [
      'Customizing Fonts in Flutter',
      'Flutter – Themes',
      'Flutter – Auto size text',
      'Flutter – Skeleton Text',
      'Flutter – Animation in Route Transition',
      'Flutter – Ripple Effect',
      'Flutter – Lazy Loader',
      'Flutter – Radial Hero Animation',
      'Flutter – Hinge Animation',
      'Flutter – Lottie Animation',
      'ProgressIndicator in Flutter',
      'Flutter – Physics Simulation in Animation',
      'Flutter – Using Google fonts',
      'Flutter – Rotate Transition',
      'Flutter – Animated Splash Screen',
      'Flutter – Shimmer',
      'Rive animations in Flutter',
    ],
  ),
TopicLabels(
    id: 5,
    name: 'Forms & Gestures',
    image: 'https://via.placeholder.com/150',
    description: 'Handling user input via forms and gestures.',
    sections: [
      'Form Validation in Flutter',
      'Designing a Form Submission Page in Flutter',
      'Flutter – Gestures',
    ],
  ),
  TopicLabels(
    id: 6,
    name: 'Navigation & Routing',
    image: 'https://via.placeholder.com/150',
    description: 'Managing app navigation and routing.',
    sections: [
      'Routes and Navigator in Flutter',
      'Multi-Page Applications in Flutter',
      'Flutter – Named Routes',
      'Flutter – Arguments in Named Routes',
      'Flutter – Return Data from Screen',
      'URLs in Flutter',
      'Retrieve Data From TextFields in Flutter',
      'Flutter – WebSockets',
      'Flutter – Avoiding Jank',
      'Flutter – Updating Data on the Internet',
      'Flutter – Fetching Data From the Internet',
      'Flutter – Deleting Data On The Internet',
      'Flutter – Sending Data To the Internet',
      'Flutter – Send Data to Screen',
      'Flutter – Send Data to the Screen using RouteSettings',
    ],
  ),
  TopicLabels(
    id: 7,
    name: 'Accessing Device',
    image: 'https://via.placeholder.com/150',
    description: 'Using device features like camera, storage, sensors.',
    sections: [
      'Gallery Access in Flutter',
      'Camera Access in Flutter',
      'Background local notifications in Flutter',
      'Restrict Landscape Mode in Flutter',
    ],
  ),
  TopicLabels(
    id: 8,
    name: 'Advanced Concepts',
    image: 'https://via.placeholder.com/150',
    description: 'Exploring advanced Flutter and Dart TopicLabelss.',
    sections: [
      'Flutter – Read and Write Data on Firebase',
      'Mail and SMS in Flutter',
      'Making Calls in Flutter',
      'FAB – Speed Dial in Flutter',
      'Flutter – Wakelock',
      'Implementing REST API in Flutter',
      'HTTP GET Response in Flutter',
    ],
  ),
  TopicLabels(
    id: 9,
    name: 'App Projects',
    image: 'https://via.placeholder.com/150',
    description: 'Building complete Flutter applications.',
    sections: [
      'Basic Quiz App In Flutter API',
      'A Hello World App Using Flutter',
      'Creating a Simple Application in Flutter',
      'Flutter – Simple PDF-Generating App',
      'Flutter – Dice Roller App',
      'Flutter – Magic 8-Ball App',
    ]
  ),
];


final profile = Profile(
  name: "Jeno",
  image: "https://avatars.githubusercontent.com/u/86506519?v=4",
  email: "sangvaleap.vanny@gmail.com",
  favoriteCourses: [],
);

List categories = [
  {
    "name": "All",
    "identifier": Topic.all,
    "icon": "assets/icons/category/all.svg"
  },
  {
    "name": "Basics",
    "identifier": Topic.basics,
    "icon": "assets/icons/category/coding.svg"
  },
  {
    "name": "Widgets",
    "identifier": Topic.widgets,
    "icon": "assets/icons/category/education.svg"
  },
  {
    "name": "Design",
    "identifier": Topic.designAndAnimations,
    "icon": "assets/icons/category/design.svg"
  },
  {
    "name": "UI",
    "identifier": Topic.uiComponents,
    "icon": "assets/icons/category/business.svg"
  },
  {
    "name": "Forms",
    "identifier": Topic.formAndGestures,
    "icon": "assets/icons/category/all.svg"
  },
  {
    "name": "Routing",
    "identifier": Topic.navigationAndRouting,
    "icon": "assets/icons/category/coding.svg"
  },
  {
    "name": "Access Control",
    "identifier": Topic.accessingDevice,
    "icon": "assets/icons/category/education.svg"
  },
  {
    "name": "AdvancedConcepts",
    "identifier": Topic.advancedConcepts,
    "icon": "assets/icons/category/design.svg"
  },
];

const thumbnailUrl = "assets/icons/category/file.svg";

List<Course> courses = [
  Course(
    id: "SqpPbQtPQ5zfqPbrVK9v",
    name: "Icon Class in Flutter",
    description: "Icon class in Flutter is used to show specific icons in our app. Instead of creating an image for our icon, we can simply use the Icon class for inserting an icon in our app. For using this class you must ensure that you have set uses-material-design: true in the pubsec.yaml file of your object.",
    url: "https://www.geeksforgeeks.org/icon-class-in-flutter/", // Dummy course content URL
    topic: Topic.uiComponents.label,
    subtopic: ["icon"],
    thumbnailUrl: thumbnailUrl,
    datePublished: DateTime.parse('1969-07-20 20:18:04Z'),
    price: 110.0,
    lessons: 1,
    rating: 4.5,
    readingTime: "3 mins"
  ),
  Course(
    id: "XyeQYFIPnq8YCUhpGgqC",
    name: "Customizing Fonts in Flutter",
    description: "Customization is everywhere, from documents to apps, we can customize everything as we want to. The power of customization is humongous, and it has revolutionized the way we look at technology in this world. Just like how printing “Hello World”, is the basic step towards learning a new programming language, customizing the style of a text is the basic step toward customizing an app. So, let’s see how to customize text in Flutter.",
    url: "https://www.geeksforgeeks.org/customizing-fonts-in-flutter/",
    topic: Topic.designAndAnimations.label,
    subtopic: ["font_customization"],
    thumbnailUrl: thumbnailUrl,
    datePublished: DateTime.parse('1969-07-20 20:18:04Z'),
    price: 95.0,
    lessons: 3,
    rating: 4.2,
    readingTime: "3 mins"
  ),
  Course(
    id: "eOM8s3d09qDqawjKNR9f",
    name: "An introduction to the open source SDK by Google",
    description: "Flutter is Google’s Mobile SDK to build native iOS and Android, Desktop (Windows, Linux, macOS), and Web apps from a single codebase. When building applications with Flutter, everything is Widgets – the blocks with which the flutter apps are built. They are structural elements that ship with a bunch of material design-specific functionalities, and new widgets can be composed out of existing ones, too. The process of composing widgets together is called composition. The User Interface of the app is composed of many simple widgets, each of them handling one particular job. That is the reason why Flutter developers tend to think of their Flutter app as a tree of widgets.",
    url: "https://www.geeksforgeeks.org/flutter-architecture-application/",
    topic: Topic.basics.label,
    subtopic: ["introduction"],
    thumbnailUrl: thumbnailUrl,
    datePublished: DateTime.parse('1969-07-20 20:18:04Z'),
    price: 80.0,
    lessons: 3,
    rating: 3.9,
    readingTime: "3 mins"
  ),
  Course(
    id: "foGQ5CYuibXWBKDMwPq8",
    name: "What is Widgets in Flutter?",
    description: "Flutter is Google’s UI toolkit for crafting beautiful, natively compiled iOS and Android apps from a single code base. To build any application we start with widgets – The building block of Flutter applications. Widgets describe what their view should look like given their current configuration and state. It includes a text widget, row widget, column widget, container widget, and many more.",
    url: "https://www.geeksforgeeks.org/flutter-an-introduction-to-the-open-source-sdk-by-google/",
    topic: Topic.widgets.label,
    subtopic: ["introduction"],
    thumbnailUrl: thumbnailUrl,
    datePublished: DateTime.parse('1969-07-20 20:18:04Z'),
    price: 72.0,
    lessons: 8,
    rating: 4.9,
    readingTime: "3 mins"
  ),
];


