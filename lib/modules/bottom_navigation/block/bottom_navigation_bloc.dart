import 'package:bloc_test/modules/bottom_navigation/block/exports.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends HydratedBloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState()) {
    on<ChangeTabIndexEvent>(_changeTabIndex);
  }

  _changeTabIndex(ChangeTabIndexEvent event, Emitter<BottomNavigationState> emit) {
    /// No need to update state, if this is the same page
    if(event.newIndex != state.tabIndex) {
      emit(BottomNavigationState(tabIndex: event.newIndex));
    }
  }

  @override
  BottomNavigationState? fromJson(Map<String, dynamic> json) {
    return BottomNavigationState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BottomNavigationState state) {
    return state.toMap();
  }
}
