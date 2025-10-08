import 'package:flutter/material.dart';
import '../atoms/app_button.dart';

class HelloBody extends StatelessWidget {
  final VoidCallback onSignUp;
  final VoidCallback onSignIn;

  const HelloBody({super.key, required this.onSignUp, required this.onSignIn});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/bike_top.jpg'),
        const SizedBox(height: 8),
        Image.asset('assets/images/bike_side.jpg'),
        const SizedBox(height: 24),
        const Text('eMotoRent',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        const Text('Your Rental EBike.\nUnlocked.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 32),
        AppButton(text: 'Sign Up', onPressed: onSignUp),
        const SizedBox(height: 8),
        AppButton(text: 'Sign In', onPressed: onSignIn, isPrimary: false),
      ],
    );
  }
}
