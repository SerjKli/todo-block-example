import 'package:bloc_test/models/Task.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/block/exports.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  Widget _buildTrailing(BuildContext context) {
    if (task.isDeleted) {
      return TextButton(
        child: const Text('Restore'),
        onPressed: () {
          context.read<TasksBloc>().add(RestoreTask(task: task));
        },
      );
    } else {
      return Checkbox(
        value: task.isDone,
        onChanged: (value) {
          context.read<TasksBloc>().add(ChangeDoneStatusTask(task: task));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.redAccent,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.delete_forever),
          ),
        ),
      ),
      onDismissed: (_) => context.read<TasksBloc>().add(DeleteTask(task: task)),
      child: ListTile(
        leading: IconButton(
          icon: Icon(task.isImportant ? Icons.star : Icons.star_border_outlined),
          onPressed: () => context.read<TasksBloc>().add(ChangeImportantTask(task: task)),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: _buildTrailing(context),
      ),
    );
  }
}
