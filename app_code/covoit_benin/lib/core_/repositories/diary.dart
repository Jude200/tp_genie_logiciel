// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covoit_benin/core_/entities/diary.dart';
import 'package:firebase_storage/firebase_storage.dart';

enum DairyRequestStatus { success, failure, unknown }

class DairyRequestResponse {
  final DairyRequestStatus status;
  final String? msg;
  DairyRequestResponse({required this.status, this.msg});
}

class DiaryRepo {
  final String diariesCollection = "diaries";
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final _storageRef = FirebaseStorage.instance.ref().child("images/");

  Future<DairyRequestResponse?> save(Diary diary) async {
    bool isSuccess = false;
    try {
      await _fireStore.runTransaction((transaction) async {
        if (diary.photoUrls != null) {
          log("Image Insertion start ...");
          File file = File(diary.photoUrls!);
          final task = await _storageRef.putFile(file);
          var downloadUrl = await task.ref.getDownloadURL();
          log("Image Insertion success ...");
          diary = diary.copyWith(photoUrls: downloadUrl.toString());
        } else {
          diary = diary.copyWith(photoUrls: null);
        }
        log("Run transaction ...");
        transaction.set(
            _fireStore.collection(diariesCollection).doc(), diary.toMap());
        log("Transaction success ...");
        isSuccess = true;
        return DairyRequestResponse(status: DairyRequestStatus.success);
      });
    } catch (e) {
      // print(e);
      return DairyRequestResponse(status: DairyRequestStatus.failure);
    }
    return DairyRequestResponse(
        status: isSuccess
            ? DairyRequestStatus.success
            : DairyRequestStatus.failure);
  }

  Future<List<Diary>?> getAll(String token) async {
    List<Diary> diaries = [];
    try {
      await _fireStore
          .collection(diariesCollection)
          .where('userId', isEqualTo: token)
          .get()
          .then((snapshot) {
        for (var element in snapshot.docs) {
          diaries.add(Diary.fromMap(element.data()));
        }
      });
      return diaries;
    } catch (e) {
      return null;
    }
  }

  // Future<DairyRequestResponse> delete(Diary diary, String token) async {
  //   try {
  //      await _fireStore
  //         .collection(diariesCollection)
  //         .where('userId', isEqualTo: token)
  //         .delete() ;
  //   } catch (_) {

  //   }
  // }
}
