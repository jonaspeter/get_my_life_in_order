import 'package:fpdart/fpdart.dart';

import '../../core/activity_failures.dart' as af;
import '../../domain/entities/activity.dart';
import '../../domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  ActivityRepositoryImpl ();

  @override
  Either<af.ActivityFailure, List<Activity>> getAll() {
    return right([
      Activity(name: "Test"),
      Activity(name: "More Test"),
    ]);
  }
}