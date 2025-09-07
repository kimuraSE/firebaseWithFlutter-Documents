class DeleteField {
  Future<void> _deleteFieldInTestCollection() async {
    try {
      debugPrint('fetching document...');
      final snap = FirebaseFirestore.instance.collection('test').doc('your_doc_id');
      await snap.update({
        'title': FieldValue.delete(),
      });
      debugPrint('Field deleted in document with ID: ${snap.id}');
    } on FirebaseException catch (e) {
      debugPrint('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
