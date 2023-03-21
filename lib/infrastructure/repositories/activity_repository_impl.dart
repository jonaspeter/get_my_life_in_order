import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:built_collection/built_collection.dart';
import 'package:get_my_life_in_order/infrastructure/utilities/id_generator.dart';

import '../../core/activity_failures.dart' as af;
import '../../domain/entities/activity.dart';
import '../../domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  ActivityRepositoryImpl(this._idGenerator): activities = BuiltList() {
    streamController = StreamController()..sink.add(right(activities));
  }

  final IdGenerator _idGenerator;

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
  Either<af.ActivityFailure, Unit> addActivity(String name) {
    String id = _idGenerator.getNewId();
    while(!_idIsUnique(id)) {
      id = _idGenerator.getNewId();
    }
    activities = activities.rebuild((b) => b.add(Activity(id: id, name: name)));
    streamController.sink.add(right(activities));
    return right(unit);
  }

  bool _idIsUnique(id) {
    return !activities.any((a) => a.id == id);
  }

}
