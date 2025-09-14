import 'package:flutter/material.dart';

class CountUpBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const CountUpBtn({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    debugPrint('created: CountUpBtn build called');

    return ElevatedButton(onPressed: onPressed, child: Text(label));
  }
}
