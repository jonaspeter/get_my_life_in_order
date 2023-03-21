import 'package:get_it/get_it.dart';
import 'package:get_my_life_in_order/infrastructure/utilities/id_generator_uuid.dart';

import 'domain/repositories/activity_repository.dart';
import 'infrastructure/repositories/activity_repository_impl.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl.registerLazySingleton<ActivityRepository>(() => ActivityRepositoryImpl(IdGeneratorUuid()));
}
