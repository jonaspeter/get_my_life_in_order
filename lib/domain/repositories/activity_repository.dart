import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/activity_failures.dart' as af;
import '../entities/activity.dart';

abstract class ActivityRepository {

  Either<af.ActivityFailure, BuiltList<Activity>> getAll();

  StreamController<Either<af.ActivityFailure, BuiltList<Activity>>> watchAll();

  Either<af.ActivityFailure, Unit> addActivity(String name);
}