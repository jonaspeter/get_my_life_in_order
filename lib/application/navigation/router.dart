import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../presentation/activities_view.dart';
import '../../presentation/add_activity_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {

  @override
  final List<AutoRoute> routes = [

    AutoRoute(path: '/', page: ActivitiesListRoute.page,),
    AutoRoute(page: AddActivityRoute.page,),
  ];
}
