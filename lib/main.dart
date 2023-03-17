import 'package:flutter/material.dart';

import 'presentation/theme.dart' as Theme;
import 'service_locator.dart' as sl;
import 'presentation/navigation/router.dart' as r;


void main() async{
  await sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Get My Life in Order',
      theme: Theme.theme,
      routerConfig: r.router,
      // home: const ActivitiesView(),
    );
  }
}
