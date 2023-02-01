import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

const names = [
  'one',
  'two',
  'three',
];

extension GetRandom<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(names.getRandomElement());
}

class MyHomePageCubit extends StatefulWidget {
  const MyHomePageCubit({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageCubit> createState() => _MyHomePageCubitState();
}

class _MyHomePageCubitState extends State<MyHomePageCubit> {
  late final NamesCubit cubit;

  @override
  void initState() {
    cubit = NamesCubit();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<String?>(
        stream: cubit.stream,
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {

          final btn = ElevatedButton(
            onPressed: () => cubit.pickRandomName(),
            child: const Text('pickup the name'),
          );

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return btn;
            case ConnectionState.waiting:
              return btn;
            case ConnectionState.active:
              return Column(
                children: [Text(snapshot.data!), const SizedBox(height: 80), btn],
              );
            case ConnectionState.done:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
