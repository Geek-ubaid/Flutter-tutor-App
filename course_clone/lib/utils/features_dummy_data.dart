import 'package:course_clone/models/course_content_model.dart';
import 'package:course_clone/models/course_model.dart';

List<Course> features = [
  Course(
    id: 109,
    name: "Flutter GetX State Management",
    image:
        "https://miro.medium.com/v2/resize:fit:1058/1*4w4VNIC29JhrI6hEu5GFoQ.png",
    price: "\$85.00",
    duration: "15 hours",
    session: "10 lessons",
    review: "4.8",
    isFavorited: false,
    description:
        "Master Flutter state management with GetX. Learn reactive state management, dependency injection, route management, and other powerful features of the GetX library to build efficient and scalable Flutter applications.",
    content: [
      CourseContentModel(
        title: "GetX Fundamentals",
        subContent: [
          "Introduction to GetX and its core features. GetX is one of the easiest flutter state management libraries that provides a comprehensive solution for managing application state, navigation, and dependencies.",
          "State management with GetX controllers. Learn how to efficiently manage application state using GetX controllers, which provide a clean and organized way to handle data and UI updates.",
          "Dependency injection and service locator. Master GetX's powerful dependency injection system that helps you manage application dependencies and services with minimal boilerplate code.",
          "Route management and navigation. Explore GetX's intuitive navigation system that makes routing between screens seamless while maintaining clean architecture.",
        ],
      ),
      CourseContentModel(
        title: "Advanced GetX Concepts",
        subContent: [
          "Reactive state management with Obx and GetX. Deep dive into reactive programming using Obx and GetX observables to create responsive and dynamic user interfaces that automatically update when data changes.",
          "Memory management and bindings. Learn best practices for memory management in GetX and how to use bindings to efficiently manage controller lifecycles and prevent memory leaks.",
          "GetX middleware and internationalization. Implement middleware for route protection and learn how to easily add multi-language support to your applications using GetX's built-in internationalization features.",
          "Building complete apps with GetX architecture. Master the complete GetX architecture pattern to build scalable, maintainable, and performant Flutter applications.",
        ],
      ),
    ],
  ),
  Course(
    id: 100,
    name: "UI/UX Design",
    image:
        "https://images.unsplash.com/photo-1596638787647-904d822d751e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    price: "\$110.00",
    duration: "10 hours",
    session: "6 lessons",
    review: "4.5",
    isFavorited: false,
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
    content: [
      CourseContentModel(
        title: "Introduction to UI/UX",
        subContent: [
          "Learn the fundamental principles of user interface and experience design. Understanding core concepts like visual hierarchy, color theory, typography, and layout principles that form the foundation of effective design.",
          "Discover methods to conduct effective user research and analysis. Master various research methodologies including user interviews, surveys, usability testing, and data analysis to create user-centered designs.",
          "Master the art of empathizing with users and their needs. Learn how to create user personas, journey maps, and empathy maps to better understand and address user pain points and requirements.",
          "Understand the iterative process of design thinking methodology. Explore the five stages of design thinking: empathize, define, ideate, prototype, and test, to create innovative solutions.",
        ],
      ),
      CourseContentModel(
        title: "Design Tools",
        subContent: [
          "Figma is a powerful collaborative interface design tool that works in the browser. Learn to create responsive layouts, build component libraries, and collaborate in real-time with team members.",
          "Adobe XD offers seamless prototyping and design capabilities for digital experiences. Master features like auto-animate, repeat grids, and voice prototyping to create interactive designs.",
          "Sketch is a vector-based design tool exclusively for Mac users. Explore its powerful features for creating precise vectors, symbols, and responsive layouts for digital products.",
          "These industry-standard tools will prepare you for professional design work. Learn workflow optimization, plugin ecosystems, and best practices for delivering production-ready designs.",
        ],
      ),
    ],
  ),

  Course(
    id: 101,
    name: "Programming",
    image:
        "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    price: "\$155.00",
    duration: "20 hours",
    session: "12 lessons",
    review: "5",
    isFavorited: true,
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
    content: [
      CourseContentModel(
        title: "Programming Basics",
        subContent: [
          "Understanding how to store and manipulate data using variables. Learn about different data types, variable scope, and best practices for naming and managing variables in your programs.",
          "Learn to control program flow with conditional statements and loops. Master if-else statements, switch cases, for loops, while loops, and how to create complex program logic.",
          "Master the concept of writing reusable code with functions. Understand function parameters, return values, scope, and how to create modular and maintainable code.",
          "Build a strong foundation in programming logic and problem-solving. Develop analytical thinking skills and learn systematic approaches to break down complex problems into manageable solutions.",
        ],
      ),
      CourseContentModel(
        title: "Advanced Topics",
        subContent: [
          "Explore object-oriented programming principles and patterns. Deep dive into concepts like inheritance, polymorphism, encapsulation, and design patterns for building robust applications.",
          "Learn essential data structures for organizing and managing data. Master arrays, linked lists, stacks, queues, trees, and graphs to efficiently store and process data.",
          "Master fundamental algorithms for solving complex problems. Study sorting, searching, and optimization algorithms while understanding time and space complexity.",
          "Develop efficient and scalable programming solutions. Learn best practices for writing clean, maintainable code that can handle large-scale applications.",
        ],
      ),
    ],
  ),
  Course(
    id: 102,
    name: "English Writing",
    image:
        "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    price: "\$65.00",
    duration: "12 hours",
    session: "4 lessons",
    review: "4.5",
    isFavorited: false,
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
    content: [
      CourseContentModel(
        title: "Grammar Fundamentals",
        subContent: [
          "Master the eight parts of speech in English language. Learn to identify and use nouns, pronouns, verbs, adjectives, adverbs, prepositions, conjunctions, and interjections effectively.",
          "Learn to construct clear and effective sentence structures. Understand simple, compound, and complex sentences, and how to vary sentence structure for better writing flow.",
          "Understand proper punctuation usage for clear communication. Master the use of periods, commas, semicolons, colons, and other punctuation marks to enhance readability.",
          "Develop strong grammatical foundation for better writing. Learn common grammar rules, exceptions, and how to avoid common grammatical errors in your writing.",
        ],
      ),
      CourseContentModel(
        title: "Writing Skills",
        subContent: [
          "Learn to write compelling essays with proper structure and flow. Master the art of writing strong introductions, well-developed body paragraphs, and memorable conclusions.",
          "Explore creative writing techniques and storytelling methods. Learn character development, plot structure, dialogue writing, and creating engaging narratives.",
          "Master professional business writing and communication. Learn to write effective emails, reports, proposals, and other business documents with clarity and professionalism.",
          "Develop your unique writing style and voice. Discover techniques to make your writing more engaging, authentic, and impactful while maintaining proper grammar and structure.",
        ],
      ),
    ],
  ),
  Course(
    id: 103,
    name: "Photography",
    image:
        "https://images.unsplash.com/photo-1472393365320-db77a5abbecc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    price: "\$80.00",
    duration: "4 hours",
    session: "3 lessons",
    review: "4.5",
    isFavorited: false,
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
    content: [
      CourseContentModel(
        title: "Camera Basics",
        subContent: [
          "Master the exposure triangle: aperture, shutter speed, and ISO. Learn how these three elements work together to create properly exposed images and achieve creative effects.",
          "Learn principles of composition for stunning photographs. Understand the rule of thirds, leading lines, symmetry, patterns, and other compositional techniques to create visually appealing images.",
          "Understand natural and artificial lighting techniques. Learn to work with available light, studio lighting, and how different lighting conditions affect your photographs.",
          "Develop technical skills for camera operation. Master manual mode, focus techniques, white balance settings, and other camera controls for precise image capture.",
        ],
      ),
      CourseContentModel(
        title: "Advanced Photography",
        subContent: [
          "Master the art of capturing compelling portrait photographs. Learn lighting setups, posing techniques, and how to capture genuine expressions and emotions in your subjects.",
          "Learn techniques for stunning landscape photography. Understand the best times to shoot, use of filters, long exposure techniques, and composition strategies for dramatic landscapes.",
          "Discover the secrets of capturing beautiful night scenes. Master long exposure photography, astrophotography, light painting, and other nighttime photography techniques.",
          "Develop your unique photographic style and vision. Learn post-processing techniques, color theory, and how to create a consistent look across your photography portfolio.",
        ],
      ),
    ],
  ),
  Course(
    id: 104,
    name: "Guitar Class",
    image:
        "https://images.unsplash.com/photo-1549298240-0d8e60513026?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    price: "\$125.00",
    duration: "12 hours",
    session: "4 lessons",
    review: "5",
    isFavorited: false,
    description:
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
    content: [
      CourseContentModel(
        title: "Guitar Fundamentals",
        subContent: [
          "Learn essential chord progressions and transitions. Master common chord shapes, understand chord theory, and practice smooth transitions between chords for various musical styles.",
          "Master various strumming patterns and rhythms. Explore different strumming techniques, rhythm patterns, and how to maintain consistent timing while playing.",
          "Understand basic music theory for guitarists. Learn scales, key signatures, time signatures, and how to read guitar tablature and chord charts.",
          "Develop proper finger placement and technique. Master fretting hand positioning, picking hand techniques, and exercises to build strength and dexterity.",
        ],
      ),
      CourseContentModel(
        title: "Advanced Techniques",
        subContent: [
          "Master the art of fingerpicking and finger style guitar. Learn various fingerpicking patterns, classical guitar techniques, and how to create complex arrangements.",
          "Learn essential scales for soloing and improvisation. Master pentatonic scales, major and minor scales, and how to use them effectively in different musical contexts.",
          "Develop improvisation skills and musical creativity. Learn to create memorable solos, understand chord-scale relationships, and express yourself through your instrument.",
          "Advanced chord progressions and music theory. Explore extended chords, modal harmony, chord substitutions, and advanced theoretical concepts for sophisticated playing.",
        ],
      ),
    ],
  ),
];
