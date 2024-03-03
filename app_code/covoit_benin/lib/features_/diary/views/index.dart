import 'package:covoit_benin/features_/diary/bloc/add_diary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

class AddDiaryProvider extends StatelessWidget {
  const AddDiaryProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AddDiaryBloc(), child: const AddDiaryScreen());
  }
}

class AddDiaryScreen extends StatelessWidget {
  const AddDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Ajouter un Journal",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocListener<AddDiaryBloc, AddDiaryState>(
          listener: (context, state) {
            if (state.status.isFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Echec')),
                );
            }
            if (state.status.isSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Enregistrement effectué avec Succès')),
                );
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => const WelcomeProvider()));
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(12)),
                _TiTleInput(),
                const Padding(padding: EdgeInsets.all(12)),
                _ContentInput(),
                const Padding(padding: EdgeInsets.all(12)),
                _AddImage(),
                const Padding(padding: EdgeInsets.all(12)),
                _SubmitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TiTleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDiaryBloc, AddDiaryState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (title) =>
              context.read<AddDiaryBloc>().add(AddDiaryTitleChanged(title)),
          decoration: const InputDecoration(
            labelText: 'Titre',
          ),
        );
      },
    );
  }
}

class _ContentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDiaryBloc, AddDiaryState>(
      buildWhen: (previous, current) => previous.content != current.content,
      builder: (context, state) {
        return TextField(
          maxLines: 8,
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (value) =>
              context.read<AddDiaryBloc>().add(AddDiaryContentChanged(value)),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Contenu',
          ),
        );
      },
    );
  }
}

class _AddImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDiaryBloc, AddDiaryState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        // ignore: use_build_context_synchronously
                        context
                            .read<AddDiaryBloc>()
                            .add(AddDiaryImageChanged(image.path));
                      }
                    },
                    icon: const Icon(Icons.photo),
                    label: const Text("Ajouter une image")),
                if (state.imageUrl != null)
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
              ],
            ),
            const Padding(padding: EdgeInsets.all(12)),
            // if (state.imageUrl != null) Text(state.imageUrl!)
          ],
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDiaryBloc, AddDiaryState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.isValid
                    ? () {
                        context
                            .read<AddDiaryBloc>()
                            .add(const AddDiarySubmitted());
                      }
                    : null,
                child: const Text("Enregistrer"),
              );
      },
    );
  }
}
