import 'package:covoit_benin/cores/services/snack_bar.dart';
import 'package:covoit_benin/features/auth/login/views/index.dart';
import 'package:covoit_benin/features/auth/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            snackBarPerso(SnackBarStatus.success,
                "Enregistrement effectué avec succès", context);
          }
          if (state.status == FormzSubmissionStatus.failure) {
            snackBarPerso(
                SnackBarStatus.failure, "Une erreur s'est produite", context);
          }
        },
        builder: (context, state) {
          return const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 250),
                Column(
                  children: [
                    _NomInput(),
                    SizedBox(height: 20),
                    _PrenomInput(),
                    SizedBox(height: 20),
                    _EmailInput(),
                    SizedBox(height: 20),
                    _PhoneInput(),
                    SizedBox(height: 20),
                    _PasswordInput(),
                    SizedBox(height: 20),
                    _GenreInput(),
                    SizedBox(height: 20),
                    _RegisterBtn(),
                    SizedBox(height: 20),
                    Divider(),
                    _OrLogin()
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NomInput extends StatelessWidget {
  const _NomInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Nom", style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (previous, current) => previous.nom != current.nom,
            builder: (context, state) {
              return TextFormField(
                onChanged: (nom) => context
                    .read<RegisterBloc>()
                    .add(RegisterNomChanged(nom: nom)),
                decoration: InputDecoration(
                  hintText: "John Doe",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText: state.nom.displayError != null
                      ? 'Veuillez entrez un nom correct'
                      : null,
                ),
                validator: (nom) => nom!.isEmpty ? 'Entrez votre nom' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PrenomInput extends StatelessWidget {
  const _PrenomInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Prenom", style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (previous, current) => previous.prenom != current.prenom,
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<RegisterBloc>()
                    .add(RegisterPrenomChanged(prenom: value)),
                decoration: InputDecoration(
                  hintText: " Arsène",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText: state.prenom.displayError != null
                      ? 'Veuillez entrez un prenom correct'
                      : null,
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Entrez votre Prenom' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
              return TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => context
                    .read<RegisterBloc>()
                    .add(RegisterEmailChanged(email: value)),
                decoration: InputDecoration(
                  hintText: "johndoe@gmail.com",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText: state.email.displayError != null
                      ? 'Veuillez entrez une adresse mail correcte'
                      : null,
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Entrez votre Email' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Téléphone",
              style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (previous, current) => previous.phone != current.phone,
            builder: (context, state) {
              return TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (value) => context
                    .read<RegisterBloc>()
                    .add(RegisterPhoneChanged(phone: value)),
                decoration: InputDecoration(
                  hintText: "64821365",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText: state.phone.displayError != null
                      ? 'Veuillez entrez un numéro de téléphone valide'
                      : null,
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Entrez votre Numéro de Telephone"' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Mot de Passe",
              style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (previous, current) =>
                previous.password != current.password,
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<RegisterBloc>()
                    .add(RegisterPasswordChanged(password: value)),
                decoration: InputDecoration(
                  hintText: "**********",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText: state.password.displayError != null
                      ? 'Veuillez entrez un mot de passe sécurisé'
                      : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _GenreInput extends StatelessWidget {
  const _GenreInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Genre", style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Text("Homme"),
                      Radio(
                          value: "Homme",
                          groupValue: state.genre.value,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (String? value) => context
                              .read<RegisterBloc>()
                              .add(RegisterGenreChanged(genre: value!))),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Femme"),
                      Radio(
                          value: "Femme",
                          groupValue: state.genre.value,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (String? value) => context
                              .read<RegisterBloc>()
                              .add(RegisterGenreChanged(genre: value!))),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _RegisterBtn extends StatelessWidget {
  const _RegisterBtn();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: state.isValid
                    ? () {
                        context
                            .read<RegisterBloc>()
                            .add(const RegisterSubmitted());
                      }
                    : null,
                child: const Text("S'inscrire"));
      },
    );
  }
}

class _OrLogin extends StatelessWidget {
  const _OrLogin();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          const Text("Vous avez déjà un compte ?"),
          TextButton(
              onPressed: () => Get.to(() => const LoginProvider()),
              child: const Text("Se connecter"))
        ],
      ),
    );
  }
}
