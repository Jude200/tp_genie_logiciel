import 'package:covoit_benin/core_/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationResponse {
  final AuthenticationStatus status;
  final String? msg;
  AuthenticationResponse({required this.status, this.msg});
}

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthenticationResponse> createUserWithEmailAndPassword(
      DUser user) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      await SaveLocalInfo.saveToken(user.email);
      return AuthenticationResponse(
          status: AuthenticationStatus.authenticated,
          msg: "Enregistrement effectué");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return AuthenticationResponse(
            status: AuthenticationStatus.unauthenticated,
            msg: "Mot de passe faible");
      }
      if (e.code == 'email-already-in-use') {
        return AuthenticationResponse(
            status: AuthenticationStatus.unauthenticated,
            msg: "Un compte existe déjà pour cette adresse email");
      }
      return AuthenticationResponse(
          status: AuthenticationStatus.unauthenticated,
          msg: "Une erreur s'est produite");
    } catch (e) {
      return AuthenticationResponse(
          status: AuthenticationStatus.unauthenticated,
          msg: "Une erreur s'est produite");
    }
  }

  Future<AuthenticationResponse> signInUserWithEmailAndPassword(
      DUser user) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      await SaveLocalInfo.saveToken(user.email);

      return AuthenticationResponse(
          status: AuthenticationStatus.authenticated,
          msg: "Connection effectué");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return AuthenticationResponse(
            status: AuthenticationStatus.unauthenticated,
            msg: "Mot de passe faible");
      }
      if (e.code == 'email-already-in-use') {
        return AuthenticationResponse(
            status: AuthenticationStatus.unauthenticated,
            msg: "Un compte existe déjà pour cette adresse email");
      }
      return AuthenticationResponse(
          status: AuthenticationStatus.unauthenticated,
          msg: "Une erreur s'est produite");
    } catch (e) {
      return AuthenticationResponse(
          status: AuthenticationStatus.unauthenticated,
          msg: "Une erreur s'est produite");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class SharedPreferencesAuthKeys {
  static String authToken = "authToken";
}

class SaveLocalInfo {
  static Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(SharedPreferencesAuthKeys.authToken, token);
  }
}
