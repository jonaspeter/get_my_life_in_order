part of 'navigation_bloc.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.addActivity(StackRouter router) = AddActivity;

  const factory NavigationEvent.goBack(StackRouter router) = GoBack;
}
