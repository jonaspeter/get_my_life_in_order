part of 'activities_controller_bloc.dart';

/// Activities Controller Event
@freezed
class ActivitiesControllerEvent with _$ActivitiesControllerEvent {
  /// Activity Controller Event to add an Activity
  const factory ActivitiesControllerEvent.addActivity(String name) = AddActivity;
}
