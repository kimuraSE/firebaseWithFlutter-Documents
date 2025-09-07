class Transaction {
  Future<void> _runTransaction() async {
    final docRef = FirebaseFirestore.instance.collection('test').doc('your_doc_id');
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(docRef);
      if (!snapshot.exists) {
        throw Exception("Document does not exist");
      }
      transaction.update(docRef, {
        'title': 'Updated Title',
        'description': 'Updated Description',
      });
    });
  }


  Future<void> commitBatch() async {
  final db = FirebaseFirestore.instance;
  final batch = db.batch();

  final a = db.collection('users').doc('alice');
  final b = db.collection('users').doc('bob');

  batch.update(a, {'age': 21});            // 1つ目の書き込み
  batch.set(b, {'name': 'Bob', 'age': 30}); // 2つ目（新規でもOK）
  batch.delete(db.collection('logs').doc('old')); // 3つ目

  try {
    await batch.commit(); // ← ここで“全部まとめて”コミット
    // どれか一つでも失敗（ルール/存在/型）なら全体が失敗
  } on FirebaseException catch (e) {
    // 失敗＝何も反映されない
    print('Batch failed: ${e.code} ${e.message}');
  }
}


}
