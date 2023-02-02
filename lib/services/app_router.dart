import 'package:bloc_test/modules/bin/ui/bin_screen.dart';
import 'package:bloc_test/modules/main/ui/main_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
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
