import 'package:bloc_test/modules/theme_switcher/block/exports.dart';
import 'package:flutter/material.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.sunny),
        BlocBuilder<ThemeSwitcherBloc, ThemeSwitcherState>(
          builder: (context, state) {
            return Switch(
              value: state.isDarkTheme,
              onChanged: (value) {
                context.read<ThemeSwitcherBloc>().add(const SwitchThemeEvent());
              },
            );
          },
        ),
        const Icon(Icons.nightlight_round_rounded),
      ],
    );
  }
}
