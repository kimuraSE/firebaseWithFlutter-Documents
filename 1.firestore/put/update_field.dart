class UpdateField {
  Future<void> _updateFieldInTestCollection() async {
    try {
      debugPrint('fetching document...');
      final snap = FirebaseFirestore.instance.collection('test').doc('your_doc_id');
      await snap.update({
        'title': 'Updated Title',
        'description': 'Updated Description',
      });
      debugPrint('Document updated with ID: ${snap.id}');
    } on FirebaseException catch (e) {
      debugPrint('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
