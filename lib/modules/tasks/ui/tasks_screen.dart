import 'package:bloc_test/models/Task.dart';
import 'package:bloc_test/modules/tasks/block/exports.dart';
import 'package:bloc_test/modules/tasks/ui/widgets/task_form.dart';
import 'package:bloc_test/modules/tasks/ui/widgets/tasks_list.dart';
import 'package:bloc_test/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  static const String routeName = "/tasks-screen";

  const TasksScreen({Key? key}) : super(key: key);

  _showAddTaskForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const TaskForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.activeTasks;

        return Scaffold(
          drawer: const AppDrawer(),
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () => _showAddTaskForm(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
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
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddTaskForm(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
