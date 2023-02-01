part of 'theme_switcher_bloc.dart';

abstract class ThemeSwitcherEvent extends Equatable {
  const ThemeSwitcherEvent();
}

class SwitchThemeEvent extends ThemeSwitcherEvent {
  final ThemeMode themeMode;

  const SwitchThemeEvent({
    this.themeMode = ThemeMode.light,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [themeMode];
}
