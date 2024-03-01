import 'package:covoit_benin/features/auth/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            Column(
              children: [
                _PhoneInput(),
                SizedBox(height: 20),
                _PasswordInput(),
                SizedBox(height: 20),
                _LoginBtn(),
                SizedBox(height: 20),
                Divider(),
              ],
            )
          ],
        ),
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
          BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (previous, current) => previous.phone != current.phone,
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<LoginBloc>()
                    .add(LoginPhoneChanged(phone: value)),
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
          BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (previous, current) =>
                previous.password != current.password,
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<LoginBloc>()
                    .add(LoginPasswordChanged(password: value)),
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

class _LoginBtn extends StatelessWidget {
  const _LoginBtn();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: state.isValid
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                child: const Text("Se connecter"));
      },
    );
  }
}
