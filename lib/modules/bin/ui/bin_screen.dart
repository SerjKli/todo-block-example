import 'package:bloc_test/modules/tasks/block/exports.dart';
import 'package:bloc_test/modules/tasks/block/tasks_bloc.dart';
import 'package:bloc_test/modules/tasks/ui/widgets/tasks_list.dart';
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
        actions: [
          // IconButton(
          //   onPressed: () => {},
          //   icon: const Icon(Icons.add),
          // )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const Center(
            child: Chip(
              label: Text("Deleted"),
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return TasksList(tasksList: state.trashedTasks);
            },
          ),
        ],
      ),
    );
  }
}
