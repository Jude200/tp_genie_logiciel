import 'package:covoit_benin/core_/entities/diary.dart';
import 'package:covoit_benin/core_/utils/date_format.dart';
import 'package:covoit_benin/features_/about/index.dart';
import 'package:covoit_benin/features_/auth/auth.dart';
import 'package:covoit_benin/features_/diary/views/diary_show.dart';
import 'package:covoit_benin/features_/diary/views/index.dart';
import 'package:covoit_benin/features_/welcome/bloc/welcome_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class WelcomeProvider extends StatelessWidget {
  const WelcomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomeBloc(),
      child: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WelcomeBloc>().add(WelcomeInitialEvent());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => AboutScreen())),
            icon: const Icon(Icons.info, color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Mes journaux",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white)),
        actions: [
          TextButton.icon(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                context.read<WelcomeBloc>().add(WelcomeSignOutEvent());
              },
              icon: const Icon(Icons.logout),
              label: const Text("Se déconnecter"))
        ],
      ),
      body: BlocConsumer<WelcomeBloc, WelcomeState>(
        listener: (contextWelcome, state) {
          if (state.status == FormzSubmissionStatus.canceled) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginProvider()));
          }
        },
        builder: (context, state) {
          return state.status.isInProgress
              ? const Center(child: CircularProgressIndicator())
              : state.diary.isEmpty
                  ? const Center(child: Text("Pas de Journaux ajoutés"))
                  : SingleChildScrollView(
                      child: Column(
                        children: state.diary
                            .map((e) => DiardyPresentationCard(diary: e))
                            .toList(),
                      ),
                    );
        },
      ),
      floatingActionButton: IconButton.filled(
          onPressed: () => Get.to(() => const AddDiaryProvider()),
          icon: const Icon(Icons.add)),
    );
  }
}

class DiardyPresentationCard extends StatelessWidget {
  const DiardyPresentationCard({super.key, required this.diary});

  final Diary diary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => DiaryView(diary: diary))),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        // width: MediaQuery.of(context).size.width * .65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor.withOpacity(.2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Titre : ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .49,
                          child: Text(diary.title,
                              overflow: TextOverflow.ellipsis))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text("Contenu : ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .49,
                        child: Text(diary.content,
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Créer le : ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(formatDateFromDateTime(diary.createdAt!))
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Column(
              children: [
                if (diary.photoUrls != null)
                  Image.network(diary.photoUrls!, width: 70, height: 70),
              ],
            )
          ],
        ),
      ),
    );
  }
}
