
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthController {

  final FirebaseAuth _auth;

  User? currentUser;

  bool isLoading = true;

  final _controller = StreamController<User?>.broadcast();

  late final StreamSubscription<User?> _sub;

  Stream<User?> get userChanges => _controller.stream;

  void dispose() {
    _sub.cancel();
    _controller.close();
  }

  AuthController(this._auth){
    // Listen to auth state changes
    _auth.authStateChanges().listen((User? user) {
      currentUser = user;
      isLoading = false;
      _controller.add(user);
    });
  }

  


}