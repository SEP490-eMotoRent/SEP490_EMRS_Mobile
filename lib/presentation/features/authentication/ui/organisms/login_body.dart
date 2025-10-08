import 'package:flutter/material.dart';
import '../molecules/login_form.dart';
import '../molecules/auth_title.dart';
import '../atoms/back_button.dart';

class LoginBody extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNavigateSignUp;

  const LoginBody({
    super.key,
    required this.onBack,
    required this.onNavigateSignUp,
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
          subtitle: 'Sign in to your eMotoRent Account',
        ),
        const SizedBox(height: 32),
        const LoginForm(),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: onNavigateSignUp,
          child: const Text("Don't Have An Account? Sign Up Now"),
        ),
      ],
    );
  }
}
