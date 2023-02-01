import 'package:bloc_test/modules/bin/ui/bin_screen.dart';
import 'package:bloc_test/modules/tasks/ui/tasks_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TasksScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TasksScreen(),
          settings: routeSettings,
        );
      case BinScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const BinScreen(),
          settings: routeSettings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Column(
                children: [
                  const Text('Page not found'),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Go to main page'),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
