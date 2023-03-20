part of 'navigation_bloc.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.listActivities(Option<NavigationState> previous) = ListActivities;
  const factory NavigationState.addingActivity(Option<NavigationState> previous) = AddingActivity;
}