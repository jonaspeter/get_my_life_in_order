import 'package:flutter/material.dart';
import 'package:get_my_life_in_order/presentation/activity_card.dart';

import '../domain/entities/activity.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key, required this.activities});

  final List<Activity> activities;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activities"),
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: activities.map((e) => ActivityCard(activity: e)).toList()),
        ),
    );
  }

}
