import 'package:flutter/material.dart';
import 'package:get_my_life_in_order/domain/repositories/activity_repository.dart';
import 'package:get_my_life_in_order/presentation/activity_card.dart';

import '../service_locator.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activities = sl<ActivityRepository>().getAll().getOrElse((l) => []);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: theme.colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
