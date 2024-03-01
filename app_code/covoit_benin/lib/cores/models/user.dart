import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? id;
  String nom;
  String prenom;
  String email;
  String phone;
  String password;
  String genre;

  String photo;
  bool isDriver;
  DateTime creatAt;
  User({
    this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.phone,
    required this.password,
    required this.genre,
    required this.photo,
    this.isDriver = false,
    required this.creatAt,
  });

  User copyWith({
    String? id,
    String? nom,
    String? prenom,
    String? email,
    String? phone,
    String? password,
    String? genre,
    String? photo,
    bool? isDriver,
    DateTime? creatAt,
  }) {
    return User(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      genre: genre ?? this.genre,
      photo: photo ?? this.photo,
      isDriver: isDriver ?? this.isDriver,
      creatAt: creatAt ?? this.creatAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'phone': phone,
      'password': password,
      'genre': genre,
      'photo': photo,
      'isDriver': isDriver,
      'creatAt': creatAt.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
      genre: map['genre'] as String,
      photo: map['photo'] as String,
      isDriver: map['isDriver'] as bool,
      creatAt: DateTime.fromMillisecondsSinceEpoch(map['creatAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
