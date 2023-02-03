import 'package:bloc_test/models/Task.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/block/exports.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/ui/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

class ImportantTasksPage extends StatelessWidget {

  const ImportantTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.importantActiveTasks;

        /// Sort tasks list based on "isDone" status
        /// TODO: move to bloc
        tasksList.sort((a, b) => a.isDone ? 1 : -1);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TasksList(
              title: "(${state.importantTasksCount}) Important tasks",
              tasksList: tasksList,
              separate: true,
            ),
          ],
        );
      },
    );
  }
}
