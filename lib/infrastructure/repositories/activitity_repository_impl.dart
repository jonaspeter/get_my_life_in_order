import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:built_collection/built_collection.dart';

import '../../core/activity_failures.dart' as af;
import '../../domain/entities/activity.dart';
import '../../domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  ActivityRepositoryImpl() {
    activities = const [
      Activity(name: "Test"),
      Activity(name: "More Test"),
    ].build();
    streamController = StreamController()..sink.add(right(activities));
  }

  late BuiltList<Activity> activities;
  late StreamController<Either<af.ActivityFailure, BuiltList<Activity>>> streamController;

  @override
  StreamController<Either<af.ActivityFailure, BuiltList<Activity>>> watchAll() {
    return streamController;
  }

  @override
  Either<af.ActivityFailure, BuiltList<Activity>> getAll() {
    return right(activities);
  }

  @override
  Either<af.ActivityFailure, Unit> addActivity(Activity activity) {
    activities = activities.rebuild((b) => b.add(activity));
    streamController.sink.add(right(activities));
    return right(unit);
  }

}
