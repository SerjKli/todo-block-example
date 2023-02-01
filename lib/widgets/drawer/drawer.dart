import 'package:bloc_test/modules/bin/ui/bin_screen.dart';
import 'package:bloc_test/modules/tasks/ui/tasks_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/tasks/block/exports.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

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
                    onTap: () {
                      Navigator.of(context).pushNamed(TasksScreen.routeName);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete, color: Colors.white70),
                    title: const Text('Deleted tasks', style: TextStyle(color: Colors.white70)),
                    trailing: Text(
                      "${state.trashedTasksCount}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(BinScreen.routeName);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
