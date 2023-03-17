import 'package:go_router/go_router.dart';

import '../activities_view.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (contex, state) => const ActivitiesView(),
  )
]);