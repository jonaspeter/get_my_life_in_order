part of 'activities_observer_bloc.dart';

@freezed
class ActivitiesObserverEvent with _$ActivitiesObserverEvent {
  const factory ActivitiesObserverEvent.observe() = Observe;
  const factory ActivitiesObserverEvent.load(
      Either<ActivityFailure, BuiltList<Activity>> activities) = Load;
}
