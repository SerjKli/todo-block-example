part of 'theme_switcher_bloc.dart';

class ThemeSwitcherState extends Equatable {
  final ThemeMode themeMode;

  const ThemeSwitcherState({
    this.themeMode = ThemeMode.light,
  });

  bool get isDarkTheme => themeMode == ThemeMode.dark;

  @override
  List<Object> get props => [themeMode];

  Map<String, dynamic> toMap() {
    return {
      'isDark': isDarkTheme,
    };
  }

  factory ThemeSwitcherState.fromMap(Map<String, dynamic> map) {
    return ThemeSwitcherState(
      themeMode: map['isDark'] ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
