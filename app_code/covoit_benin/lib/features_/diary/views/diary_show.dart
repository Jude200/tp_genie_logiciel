import 'package:covoit_benin/core_/entities/diary.dart';
import 'package:covoit_benin/core_/utils/date_format.dart';
import 'package:flutter/material.dart';

class DiaryView extends StatelessWidget {
  final Diary diary;

  const DiaryView({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diary.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(diary.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(diary.content, style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 10.0),
            Text(
              'Date: ${formatDateFromDateTime(diary.createdAt!)}',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10.0),
            if (diary.photoUrls != null)
              Image.network(
                diary.photoUrls!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            const SizedBox(height: 10.0),
            Text(
              diary.entry ?? '',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
