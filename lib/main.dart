import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/activities/controller/activities_controller_bloc.dart';
import 'application/activities/observer/activities_observer_bloc.dart';
import 'application/navigation/navigation_bloc.dart';
import 'domain/repositories/activity_repository.dart';
import 'presentation/theme.dart' as theme;
import 'service_locator.dart' as sl;
import 'application/navigation/router.dart';

void main() async {
  await sl.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => ActivitiesControllerBloc(activityRepo: sl.sl<ActivityRepository>()),
        ),
        BlocProvider(
          create: (context) => ActivitiesObserverBloc(activityRepo: sl.sl<ActivityRepository>())
            ..add(const ActivitiesObserverEvent.observe()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Get My Life in Order',
        theme: theme.theme,
        routerConfig: _appRouter.config(),
        // home: const ActivitiesView(),
      ),
    );
  }
}
