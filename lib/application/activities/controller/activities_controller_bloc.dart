import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/activity.dart';
import '../../../domain/repositories/activity_repository.dart';

part 'activities_controller_event.dart';
part 'activities_controller_state.dart';
part 'activities_controller_bloc.freezed.dart';

/// Activities Controller Bloc
class ActivitiesControllerBloc extends Bloc<ActivitiesControllerEvent, ActivitiesControllerState> {
  final ActivityRepository activityRepo;

  /// Activities Controller Bloc
  ActivitiesControllerBloc({required this.activityRepo}) : super(const Initial()) {
    on<AddActivity>((event, emit) {
      activityRepo.addActivity(event.activity);
    });
  }
}
