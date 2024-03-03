import 'dart:developer';

import 'package:covoit_benin/features_/auth/bloc/auth_bloc.dart';
import 'package:covoit_benin/features_/auth/cubit/is_connect_cubit.dart';
import 'package:covoit_benin/features_/welcome/views/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => IsConnectCubit())
      ],
      child: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<IsConnectCubit>().isConnect();
    return Scaffold(
      body: BlocListener<IsConnectCubit, bool>(
        listener: (BuildContext contextIsConnect, bool isConnected) {
          if (!isConnected) {
            // Get.to((_) => const WelcomeProvider());

            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const WelcomeProvider()));
          }
        },
        child: BlocListener<AuthBloc, AuthState>(
          listener: (contextState, state) {
            if (state.status.isFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                    const SnackBar(content: Text("Une erreur s'est produite")));
            }
            if (state.status.isSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Inscription effectué avec succès')));

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const WelcomeProvider()));
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Align(
              alignment: const Alignment(-1 / 3, -1 / 3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Mon Journal Intime",
                      style: Theme.of(context).textTheme.titleLarge),
                  const Padding(padding: EdgeInsets.all(12)),
                  _Header(),
                  const Padding(padding: EdgeInsets.all(12)),
                  _EmailInput(),
                  const Padding(padding: EdgeInsets.all(12)),
                  _PasswordInput(),
                  const Padding(padding: EdgeInsets.all(12)),
                  _LoginButton(),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Divider(),
                  const Padding(padding: EdgeInsets.all(20)),
                  _Footer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        if (state.status.isSuccess) {
          Get.to((_) => const WelcomeProvider());
        }
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<AuthBloc>().add(AuthEmailChanged(email)),
          decoration: InputDecoration(
            labelText: 'Email',
            errorText:
                state.email.displayError != null ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<AuthBloc>().add(AuthPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Mot de Passe',
            errorText: state.password.displayError != null
                ? 'Mot de passe invalide'
                : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.isValid
                    ? () {
                        context.read<AuthBloc>().add(const AuthSubmitted());
                      }
                    : null,
                child: Text(state.isCreatedAccountClicked
                    ? "S'inscrire"
                    : "Se connecter"),
              );
      },
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.isCreatedAccountClicked
            ? Text("Créer un compte",
                style: Theme.of(context).textTheme.titleSmall)
            : Text("Se connecter",
                style: Theme.of(context).textTheme.titleSmall);
      },
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextButton.icon(
          icon: const Icon(Icons.portrait_rounded),
          label: Text(
            state.isCreatedAccountClicked
                ? 'Avez-vous déjà un compte ?'
                : 'Créer un compte',
          ),
          onPressed: () =>
              context.read<AuthBloc>().add(AuthIsCreatedAccountClicked()),
        );
      },
    );
  }
}
