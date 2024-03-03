import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Diary {
  final String? id;
  final String? userId;
  final String title;
  final String content;
  final DateTime? createdAt;
  final String? photoUrls;
  final String? entry;
  Diary({
    this.id,
    this.userId,
    required this.title,
    required this.content,
    this.createdAt,
    this.photoUrls,
    this.entry,
  });

  Diary copyWith({
    String? id,
    String? userId,
    String? title,
    String? content,
    DateTime? createdAt,
    String? photoUrls,
    String? entry,
  }) {
    return Diary(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      photoUrls: photoUrls ?? this.photoUrls,
      entry: entry ?? this.entry,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'photoUrls': photoUrls,
      'entry': entry,
    };
  }

  factory Diary.fromMap(Map<String, dynamic> map) {
    return Diary(
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      photoUrls: map['photoUrls'] != null ? map['photoUrls'] as String : null,
      entry: map['entry'] != null ? map['entry'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Diary.fromJson(String source) =>
      Diary.fromMap(json.decode(source) as Map<String, dynamic>);
}
