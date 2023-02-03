import 'package:bloc_test/modules/bottom_navigation/block/exports.dart';
import 'package:flutter/material.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.tabIndex,
          onTap: (tabIndex) => context.read<BottomNavigationBloc>().add(
                ChangeTabIndexEvent(newIndex: tabIndex),
              ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist),
              label: "All tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Important",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_mark),
              label: "Info",
            ),
          ],
        );
      },
    );
  }
}
