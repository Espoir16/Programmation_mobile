import 'package:flutter/material.dart';
import 'login_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in or sign up',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            const EmailField(),
            const SizedBox(height: 14),
            ContinueButton(onPressed: () {}),
            const SizedBox(height: 18),
            const OrSeparator(),
            const SizedBox(height: 18),
            ContinueWithButton(
              label: 'Apple',
              iconPath: 'assets/apple_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            ContinueWithButton(
              label: 'Google',
              iconPath: 'assets/google_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            ContinueWithButton(
              label: 'Facebook',
              iconPath: 'assets/facebook_logo.svg',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
