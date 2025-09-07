class SetFieldAndCreateDocInCollection {

  Future<void> _setDataOnTestCollection() async {
    try {
      debugPrint('fetching document...');
      final snap = FirebaseFirestore.instance.collection('test').doc();
      await snap.set({
        'title': 'New Title3',
        'description': 'New Description3',
      });
      debugPrint('Document set with ID: ${snap.id}');
    } on FirebaseException catch (e) {
      debugPrint('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }


  

}