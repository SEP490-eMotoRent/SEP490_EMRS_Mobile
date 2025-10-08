import 'package:flutter/material.dart';
import '../molecules/signup_form.dart';
import '../molecules/auth_title.dart';
import '../atoms/back_button.dart';

class SignupBody extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNavigateLogin;

  const SignupBody({
    super.key,
    required this.onBack,
    required this.onNavigateLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackNavButton(onPressed: onBack),
        const SizedBox(height: 24),
        const AuthTitle(
          title: 'eMotoRent',
          subtitle: "Let's Create Your eMotoRent Account",
        ),
        const SizedBox(height: 32),
        const SignupForm(),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: onNavigateLogin,
          child: const Text("I already Have An Account"),
        ),
      ],
    );
  }
}
