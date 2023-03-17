import 'package:fpdart/fpdart.dart';

import '../../core/activity_failures.dart' as af;
import '../entities/activity.dart';

abstract class ActivityRepository {
  Either<af.ActivityFailure, List<Activity>> getAll();
}