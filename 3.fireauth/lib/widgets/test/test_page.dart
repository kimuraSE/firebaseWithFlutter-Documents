import 'package:firetest/widgets/test/count_up_btn.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firetest/widgets/test/meaningless_btn.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('created: TestPage build called');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test Page'),
            const SizedBox(height: 16),
            CountUpBtn(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              label: 'Count Up',
            ),
            const SizedBox(height: 16),
            _counter == 0
                ? const Text('You have not pressed the button yet.')
                : Text('Button pressed $_counter times.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
              child: const Text('Reset'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Go Back'),
            ),
            const SizedBox(height: 16),
            const MeaninglessBtn(),
          ],
        ),
      ),
    );
  }
}
