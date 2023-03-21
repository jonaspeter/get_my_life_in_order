import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide State;

import '../application/activities/observer/activities_observer_bloc.dart';
import 'widgets/activity_card.dart';
import '../domain/entities/activity.dart';
import '../application/navigation/navigation_bloc.dart';

@RoutePage()
class ActivitiesListView extends StatefulWidget {
  const ActivitiesListView({super.key});

  @override
  State<ActivitiesListView> createState() => _ActivitiesListViewState();
}

class _ActivitiesListViewState extends State<ActivitiesListView> {
  Option<BuiltList<Activity>> activities = none();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final router = AutoRouter.of(context);
    final navigationBlock = context.read<NavigationBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Activities"),
      ),
      body: BlocListener<ActivitiesObserverBloc, ActivitiesObserverState>(
        listener: (context, state) {
          state.when(
              initial: () {},
              loaded: (a) {
                setState(() {
                  activities = some(a);
                });
              });
        },
        child: Center(
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: activities.match(
                //TODO handle this case of missing activities better
                () => const [Text("Error")],
                (a) => a.map((e) => ActivityCard(activity: e)).toList(),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationBlock.add(AddActivity(router));
        },
        backgroundColor: theme.colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
