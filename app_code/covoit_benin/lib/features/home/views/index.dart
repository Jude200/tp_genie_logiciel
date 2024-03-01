import 'package:covoit_benin/features/home/bloc/home_bloc.dart';
import 'package:covoit_benin/features/home/cubit/home_cubit.dart';
import 'package:covoit_benin/features/home/widgets/historique_card.dart';
import 'package:covoit_benin/features/home/widgets/near_of_you.dart';
import 'package:covoit_benin/features/path/my_paths/bloc/my_path_bloc.dart';
import 'package:covoit_benin/features/profile/bloc/profile_bloc.dart';
import 'package:covoit_benin/features/profile/profile.dart';
import 'package:covoit_benin/features/search/bloc/search_bloc.dart';
import 'package:covoit_benin/features/search/views/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
      BlocProvider(create: (_) => HomeBloc()),
      BlocProvider(create: (_) => SearchBloc()),
      BlocProvider(create: (_) => MyPathBloc()),
      BlocProvider(create: (_) => ProfileBloc())
    ], child: const HomeMainViews());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            _Search(),
            Column(
              children: [_FromHistorique(), _NearOfYou()],
            ),
          ],
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, stae) {
          return TextFormField(
            decoration: InputDecoration(
                hintText: "Rechercher ...",
                filled: true,
                fillColor: Colors.green.withOpacity(.1),
                border: InputBorder.none,
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search))),
          );
        }),
      ),
    );
  }
}

class _FromHistorique extends StatelessWidget {
  const _FromHistorique();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Text("D'après votre historique"),
        ),
        const SizedBox(height: 20),
        SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(2, (index) => const MyHistoriqueCArd()),
            ))
      ],
    );
  }
}

class _NearOfYou extends StatelessWidget {
  const _NearOfYou();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Text("Près de votre Position"),
        ),
        const SizedBox(height: 20),
        ...List.generate(2, (index) => const NearOfYouCard())
      ],
    );
  }
}

class HomeMainViews extends StatelessWidget {
  const HomeMainViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(builder: (context, state) {
      return Scaffold(
        body: IndexedStack(
          index: state,
          children: const [
            // MyPathViews(),
            SearchView(),
            HomeView(),
            Center(child: Text("Historique")),
            ProfileView()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.yellow,
            onTap: (int index) => context.read<HomeCubit>().changeState(index),
            items: const [
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.directions), label: 'Mes trajets'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Recherche'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'Historique'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profil'),
            ]),
      );
    });
  }
}
