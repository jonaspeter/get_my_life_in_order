import 'package:flutter/material.dart';

import '../domain/entities/activity.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({required this.activity, Key? key}) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
        child: Card(
            margin: EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                activity.name,
                style: theme.textTheme.titleMedium,
              ),
            )));
  }
}
