import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

class PasswordHash {
  String hashPassword(String password) {
    Uint8List utf8Encode = utf8.encode(password);
    Digest digest = sha256.convert(utf8Encode);

    return digest.toString();
  }

  bool verifyPassword(String enteredPassword, String storedHashedPassword) {
    return hashPassword(enteredPassword) == storedHashedPassword;
  }
}
