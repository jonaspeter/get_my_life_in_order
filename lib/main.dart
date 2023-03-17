import 'package:flutter/material.dart';

import 'presentation/theme.dart' as Theme;
import 'domain/entities/activity.dart';
import 'presentation/activities_view.dart';


void main() {
  runApp(const MyApp());
}

const _testActivities = [
  Activity(name: "Test"),
  Activity(name: "More Test"),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get My Life in Order',
      theme: Theme.theme,
      home: const ActivitiesView(activities: _testActivities),
    );
  }
}
