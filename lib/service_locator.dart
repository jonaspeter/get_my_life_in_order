import 'package:get_it/get_it.dart';

import 'domain/repositories/activity_repository.dart';
import 'infrastructure/repositories/activitity_repository_impl.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl.registerLazySingleton<ActivityRepository>(() => ActivityRepositoryImpl());
}