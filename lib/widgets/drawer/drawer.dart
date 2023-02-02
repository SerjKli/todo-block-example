import 'package:bloc_test/modules/bin/ui/bin_screen.dart';
import 'package:bloc_test/modules/main/ui/main_screen.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/block/exports.dart';
import 'package:bloc_test/modules/theme_switcher/ui/widgets/ThemeSwitchButton.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  /// Go to route
  ///
  /// BuildContext context
  /// String route - route to go
  void _goTo(BuildContext context, String route) {
    final navigator = Navigator.of(context);

    /// Close drawer first
    navigator.pop();

    /// Check if current route is the same we want to go. If yes, nothing to do
    if (ModalRoute.of(context)?.settings.name != route) {
      //TODO: don't push navigator if previous route equals the given one, make pop instead. This will
      // prevent big stack
      navigator.pushNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.blueAccent,
          child: BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return Column(
                children: [
                  const CircleAvatar(
                    radius: 68,
                    child: Text(
                      'TLB',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white70),
                    title: const Text('My tasks', style: TextStyle(color: Colors.white70)),
                    trailing: Text(
                      "${state.doneTasks}/${state.tasksCount}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    onTap: () => _goTo(context, MainScreen.routeName),
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete, color: Colors.white70),
                    title: const Text('Deleted tasks', style: TextStyle(color: Colors.white70)),
                    trailing: Text(
                      "${state.trashedTasksCount}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    onTap: () => _goTo(context, BinScreen.routeName),
                  ),
                  const Spacer(),
                  const ThemeSwitchButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
