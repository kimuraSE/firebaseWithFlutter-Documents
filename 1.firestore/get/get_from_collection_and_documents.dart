import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetFromCollectionAndDocuments {
  Future<void> fetchDocument() async {
    try {
      debugPrint('fetching document...');
      final snap = await FirebaseFirestore.instance
          .collection('collection_id')
          .doc('documents_id')
          .get(); // 単発読み取り（get）

      if (!snap.exists) {
        debugPrint('document not found');
        return;
      }
      final data = snap.data(); // Map<String, dynamic>?
      debugPrint('value = ${data?['key']}');
    } on FirebaseException catch (e) {
      debugPrint('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> _fetchCollection() async {
    try {
      debugPrint('fetching document...');
      final snap = await FirebaseFirestore.instance
          .collection('/cources/3fuHy6ZNkNAq5Sz6LSsF/lesson/')
          .where('column_name', isEqualTo: 'value')
          .get();

      if (!snap.docs.isNotEmpty) {
        debugPrint('document not found');
        return;
      }
      for (var doc in snap.docs) {
        debugPrint('Document ID: ${doc.id}, Data: ${doc.data()}');
      }
    } on FirebaseException catch (e) {
      debugPrint('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }



    Future<void> _fetchCollectionGroup() async {
    try {
      debugPrint('fetching document...');
      final snap = await FirebaseFirestore.instance
          .collectionGroup('lesson')
          .where('SecNum', isEqualTo: 1)
          .orderBy('SecNum', descending: true)
          .get();

      if (!snap.docs.isNotEmpty) {
        debugPrint('document not found');
        return;
      }
      for (var doc in snap.docs) {
        debugPrint('Document ID: ${doc.id}, Data: ${doc.data()}');
      }
    } on FirebaseException catch (e) {
      debugPrint('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
