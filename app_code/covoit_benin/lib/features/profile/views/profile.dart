import 'package:covoit_benin/features/cars/views/index.dart';
import 'package:covoit_benin/features/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProfileProvider extends StatelessWidget {
  const ProfileProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Center(
                    child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(radius: 80),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.photo))
                  ],
                )),
                const SizedBox(height: 20),
                const _NomDisplay(),
                const SizedBox(height: 10),
                const _PrenomDisplay(),
                const SizedBox(height: 10),
                const _EmailDisplay(),
                const SizedBox(height: 10),
                const _PhoneDisplay(),
                const SizedBox(height: 10),
                const _GenreDisplay(),
                const SizedBox(height: 10),
                const _RulesDisplay(),
                const SizedBox(height: 10),
                const Divider(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Mes voitures",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton.filled(
                          onPressed: () =>
                              Get.to(() => const RegisterVehicleProvider()),
                          icon: const Icon(Icons.add))
                    ]),
                const MyCars(),
                const _LogOutBtn()
              ],
            ),
          ),
        );
      }),
    );
  }
}

class MyCars extends StatelessWidget {
  const MyCars({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(3, (index) => const MyCarCard()),
      ),
    );
  }
}

class MyCarCard extends StatelessWidget {
  const MyCarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Stack(
        children: [
          Image.asset("assets/images/img.jpg", width: 160, height: 100),
          Positioned(
            bottom: 0,
            child: Container(
              width: 160,
              color: Theme.of(context).primaryColor,
              child: const Center(
                  child: Text("Toyota : RM 5210",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white))),
            ),
          )
        ],
      ),
    );
  }
}

class _NomDisplay extends StatelessWidget {
  const _NomDisplay();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, stae) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Nom", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("John Doe")
            ],
          );
        }),
      ),
    );
  }
}

class _PrenomDisplay extends StatelessWidget {
  const _PrenomDisplay();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, stae) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Prenom", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Arsène")
            ],
          );
        }),
      ),
    );
  }
}

class _EmailDisplay extends StatelessWidget {
  const _EmailDisplay();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, stae) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("judeseruch@gmail.com")
            ],
          );
        }),
      ),
    );
  }
}

class _PhoneDisplay extends StatelessWidget {
  const _PhoneDisplay();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, stae) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Téléphone", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("++ 229 64821365")
            ],
          );
        }),
      ),
    );
  }
}

class _GenreDisplay extends StatelessWidget {
  const _GenreDisplay();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, stae) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Genre", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Homme")
            ],
          );
        }),
      ),
    );
  }
}

class _RulesDisplay extends StatelessWidget {
  const _RulesDisplay();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, stae) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Role : ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Text("Passager"),
                      ),
                      Switch(
                        value: true,
                        onChanged: (bool value) => context
                            .read<ProfileBloc>()
                            .add(ProfileRoleChangeEvent(value: value)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("Passager"),
                      )
                    ],
                  ),
                )
              ]);
        }),
      ),
    );
  }
}

class _LogOutBtn extends StatelessWidget {
  const _LogOutBtn();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text("Se déconnecter"));
      },
    );
  }
}
