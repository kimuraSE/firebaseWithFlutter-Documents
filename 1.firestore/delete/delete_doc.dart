class DeleteDoc {
  Future<void> _deleteDocInTestCollection() async {
    try {
      debugPrint('fetching document...');
      final snap = FirebaseFirestore.instance.collection('test').doc('your_doc_id');
      await snap.delete();
      debugPrint('Document deleted with ID: ${snap.id}');
    } on FirebaseException catch (e) {
      debugPrint('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
