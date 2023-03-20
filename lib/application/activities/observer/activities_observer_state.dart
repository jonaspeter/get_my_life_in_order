part of 'activities_observer_bloc.dart';

///Activities Observer State
@freezed
class ActivitiesObserverState with _$ActivitiesObserverState {
  const factory ActivitiesObserverState.initial() = Initial;
  const factory ActivitiesObserverState.loaded(BuiltList<Activity> activities) = Loaded;
}
