import 'package:flutter/material.dart';

class MeaninglessBtn extends StatelessWidget {
  const MeaninglessBtn({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('created: MeaninglessBtn build called');
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Meaningless Button'),
    );
  }
}
