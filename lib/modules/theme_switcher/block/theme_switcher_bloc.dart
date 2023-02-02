import 'package:bloc_test/modules/theme_switcher/block/exports.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_switcher_event.dart';
part 'theme_switcher_state.dart';

class ThemeSwitcherBloc extends HydratedBloc<ThemeSwitcherEvent, ThemeSwitcherState> {
  ThemeSwitcherBloc() : super(const ThemeSwitcherState()) {
    on<SwitchThemeEvent>(_onThemeSwitch);
  }

  @override
  ThemeSwitcherState? fromJson(Map<String, dynamic> json) {
    return ThemeSwitcherState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeSwitcherState state) {
    return state.toMap();
  }

  _onThemeSwitch(SwitchThemeEvent event, Emitter<ThemeSwitcherState> emit) {
    final newThemeMode = state.isDarkTheme ? ThemeMode.light : ThemeMode.dark;

    emit(ThemeSwitcherState(themeMode: newThemeMode));
  }
}
