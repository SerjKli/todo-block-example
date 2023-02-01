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
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text("Delted"),
            ),
          ),
          // TasksList(tasksList: tasksList),
        ],
      ),
    );
  }
}
