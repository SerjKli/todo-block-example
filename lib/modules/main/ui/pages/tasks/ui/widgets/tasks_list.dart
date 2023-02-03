import 'package:bloc_test/models/Task.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/block/exports.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/ui/widgets/task_tile.dart';

import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasksList;

  /// If separate == true, add a widget between done and not done tasks
  final bool separate;

  const TasksList({
    Key? key,
    required this.tasksList,
    this.separate = false,
  }) : super(key: key);

  Widget _getDoneTasksSeparator(Task task) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Chip(
            label: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return Text("(${state.doneTasks}) Done tasks");
              },
            ),
          ),
        ),
        TaskTile(task: task),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFirstDone = true;

    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          final task = tasksList[index];

          if (separate && task.isDone && isFirstDone) {
            isFirstDone = false;
            return _getDoneTasksSeparator(task);
          } else {
            return TaskTile(task: task);
          }
        },
      ),
    );
  }
}
