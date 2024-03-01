import 'package:covoit_benin/features/path/my_paths/bloc/my_path_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPathProvider extends StatelessWidget {
  const MyPathProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => MyPathBloc());
  }
}

class MyPathViews extends StatelessWidget {
  const MyPathViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Mes Trajets ..."),
      ),
      floatingActionButton: IconButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor)),
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white)),
    );
  }
}
