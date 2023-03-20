import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auto_route/auto_route.dart';

import 'router.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';
part 'navigation_bloc.freezed.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const ListActivities(None())) {

    on<AddActivity>((event, emit) {
      final StackRouter router = event.router;
      router.push(const AddActivityRoute());
      emit(AddingActivity(some(state)));
    });

    on<GoBack>((event, emit) {
      final StackRouter router = event.router;
      final prev = state.previous;
      prev.match(
        () { }, // if there is no previous state do nothing
        (pState) {
          router.removeLast();
          pState.when(
              listActivities: (Option<NavigationState> previous) =>
                  router.replace(const ActivitiesListRoute()),
              addingActivity: (Option<NavigationState> previous) =>
                  router.replace(const AddActivityRoute()));
          emit(pState);
        },
      );
    });
  }
}

