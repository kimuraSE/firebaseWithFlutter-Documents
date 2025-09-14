import 'dart:async';
import 'package:flutter/material.dart';

class RouterRefresh extends ChangeNotifier {
  late final StreamSubscription _sub;
  RouterRefresh(Stream<dynamic> stream) {
    _sub = stream.listen((_) => notifyListeners());
  }
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}