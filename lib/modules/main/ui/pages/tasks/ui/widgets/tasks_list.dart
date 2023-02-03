import 'package:bloc_test/models/Task.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/block/exports.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/ui/widgets/task_tile.dart';

import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasksList;

  /// If separate == true, add a widget between done and not done tasks
  final bool separate;

  final String title;

  const TasksList({
    Key? key,
    required this.tasksList,
    required this.title,
    this.separate = false,
  }) : super(key: key);

  int get doneTasksCount => tasksList.where((element) => element.isDone == true).length;

  Widget _getDoneTasksSeparator(Task task) {
    return Column(
      children: [
        Chip(label: Text("($doneTasksCount) Done tasks")),
        TaskTile(task: task),
      ],
    );
  }

  Widget _getHeader(Task task){
    return Column(
      children: [
        Center(
          child: Chip(label: Text(title)),
        ),
        if (!task.isDone) TaskTile(task: task),
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

          /// If index == 0, show title
          if (index == 0) {
            return _getHeader(task);
          }

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
