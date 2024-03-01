// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covoit_benin/cores/models/user.dart';
import 'package:covoit_benin/cores/repository/auth_repository/hash.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationResponse {
  final AuthenticationStatus status;
  final String? msg;
  AuthenticationResponse({required this.status, this.msg});
}

class AuthenticationRepository {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");

  PasswordHash hash = PasswordHash();

  Future<AuthenticationResponse> registerUser(User user) async {
    user = user.copyWith(password: hash.hashPassword(user.password));
    try {
      collectionReference.add(user.toMap()).then((value) => log(value.id));
      print(collectionReference.id);
      log("*******************");
      return AuthenticationResponse(status: AuthenticationStatus.authenticated);
    } catch (e) {
      return AuthenticationResponse(
          status: AuthenticationStatus.unauthenticated);
    }
  }

  Future<AuthenticationStatus> login(String phone, String password) async {
    try {
      QuerySnapshot _query =
          await collectionReference.where("phone", isEqualTo: phone).get();
      if (_query.docs.isEmpty) {
        return AuthenticationStatus.unauthenticated;
      }
      return AuthenticationStatus.authenticated;
    } catch (e) {
      return AuthenticationStatus.unauthenticated;
    }
  }

  Future<User?> getUser(String id) async {}
}
