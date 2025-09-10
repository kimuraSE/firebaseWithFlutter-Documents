import 'package:firetest/main.dart';
import 'package:firetest/widgets/home/home.dart';
import 'package:flutter/material.dart';
import 'package:firetest/services/auth_service.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Account Page')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Account Page Hello User!'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await AuthService().signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false,
                    );
                  } catch (e) {
                    // Handle error
                  }
                },
                child: const Text('sign out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
