import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/activity_failures.dart';
import '../../../domain/entities/activity.dart';
import '../../../domain/repositories/activity_repository.dart';

part 'activities_observer_event.dart';

part 'activities_observer_state.dart';

part 'activities_observer_bloc.freezed.dart';

class ActivitiesObserverBloc extends Bloc<ActivitiesObserverEvent, ActivitiesObserverState> {
  final ActivityRepository activityRepo;
  StreamSubscription? _streamSubscription;

  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    return super.close();
  }

  ActivitiesObserverBloc({required this.activityRepo})
      : super(const Initial()) {

    on<Observe>((event, emit) async {
      await _streamSubscription?.cancel();
      final controller = activityRepo.watchAll();
      _streamSubscription = controller.stream.listen((event) {
        add(ActivitiesObserverEvent.load(event));
      });
    });

    on<Load>((event, emit) {
      final activities = event.activities;
      activities.match((l) {}, (r) {
        emit(Loaded(r));});
    });
  }
}
