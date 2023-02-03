import 'package:bloc_test/modules/main/ui/pages/tasks/block/exports.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/ui/widgets/tasks_list.dart';
import 'package:bloc_test/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class BinScreen extends StatelessWidget {
  static const String routeName = "/deleted-tasks-screen";

  const BinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Deleted tasks'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return TasksList(
                tasksList: state.trashedTasks,
                title: 'Deleted tasks',
              );
            },
          ),
        ],
      ),
    );
  }
}
