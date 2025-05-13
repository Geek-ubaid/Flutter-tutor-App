const int ANIMATED_BODY_MS = 500;

enum Topic {
  all,
  basics,
  uiComponents,
  widgets,
  designAndAnimations,
  formAndGestures,
  navigationAndRouting,
  accessingDevice,
  advancedConcepts,
}

extension TopicExtension on Topic {
  String get label {
    switch (this) {
      case Topic.all:
        return "all";
      case Topic.basics:
        return "basics";
      case Topic.uiComponents:
        return "ui components";
      case Topic.widgets:
        return "widgets";
      case Topic.designAndAnimations:
        return "design & animation";
      case Topic.formAndGestures:
        return "form & gestures";
      case Topic.navigationAndRouting:
        return "navigation & routing";
      case Topic.accessingDevice:
        return "accessing device";
      case Topic.advancedConcepts:
        return "advanced concepts";
    }
  }

  static Topic fromString(String value) {
    return Topic.values.firstWhere(
          (e) => e.label == value,
      orElse: () => Topic.all, // or throw
    );
  }
}
