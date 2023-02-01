import 'package:bloc_test/modules/tasks/ui/tasks_screen.dart';
import 'package:bloc_test/modules/theme_switcher/block/exports.dart';
import 'package:bloc_test/services/app_router.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/modules/tasks/block/exports.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (context) => TasksBloc(),
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => ThemeSwitcherBloc()),
      ],
      child: BlocBuilder<ThemeSwitcherBloc, ThemeSwitcherState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Todos',

            ///Theme properties
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            themeMode: state.themeMode,
            darkTheme: ThemeData.dark(),

            /// Hide debug banner
            debugShowCheckedModeBanner: false,

            /// Route properties
            onGenerateRoute: appRouter.onGenerateRoute,

            home: const TasksScreen(),
          );
        },
      ),
    );
  }
}
