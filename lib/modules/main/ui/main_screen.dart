import 'package:bloc_test/modules/bottom_navigation/block/exports.dart';
import 'package:bloc_test/modules/bottom_navigation/ui/widgets/AppBottomNavigation.dart';
import 'package:bloc_test/modules/main/ui/pages/about/ui/widgets/about_page.dart';
import 'package:bloc_test/modules/main/ui/pages/important/ui/widgets/important_tasks_page.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/ui/widgets/tasks_page.dart';
import 'package:bloc_test/modules/main/ui/pages/tasks/ui/widgets/task_form.dart';
import 'package:bloc_test/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = "/";

  const MainScreen({Key? key}) : super(key: key);

  _showAddTaskForm(BuildContext context) {
    /// Move to the first page with tasks list
    context.read<BottomNavigationBloc>().add(const ChangeTabIndexEvent(newIndex: 0));

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const TaskForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(
            onPressed: () => _showAddTaskForm(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocListener<BottomNavigationBloc, BottomNavigationState>(
        listener: (context, state) {
          controller.animateToPage(
            state.tabIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        child: PageView(
          controller: controller,
          onPageChanged: (tabIndex){
            context.read<BottomNavigationBloc>().add(ChangeTabIndexEvent(newIndex: tabIndex));
          },
          children: const [
            TasksPage(),
            ImportantTasksPage(),
            AboutPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskForm(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}
