import 'package:bloc_test/models/Task.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/block/exports.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/ui/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  static const String routeName = "/tasks-screen";

  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.activeTasks;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  "(${state.doneTasks}/${state.tasksCount}) Tasks: ",
                ),
              ),
            ),
            TasksList(tasksList: tasksList),
          ],
        );
      },
    );
  }
}
