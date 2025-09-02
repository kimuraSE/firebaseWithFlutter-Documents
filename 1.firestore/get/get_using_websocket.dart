class GetUsingWebsocket {

  Stream<DocumentSnapshot<Map<String, dynamic>>>? _stream;
  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance
        .collection('websockets')
        .doc('lif7yGzZN9XHNKzxb1kk')
        .snapshots();
    _stream!.listen((snapshot) {
      debugPrint('Handling WebSocket...');
      debugPrint('Document Data: ${snapshot.data()}');
      // ここで_handleWebSocket()相当の処理を実行
    });

    
  }

}