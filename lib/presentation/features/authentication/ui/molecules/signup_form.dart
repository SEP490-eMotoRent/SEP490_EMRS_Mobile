import 'package:flutter/material.dart';
import '../atoms/app_text_field.dart';
import '../atoms/app_button.dart';
import '../atoms/social_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();

    return Column(
      children: [
        AppTextField(hintText: 'Email', controller: emailController),
        const SizedBox(height: 16),
        AppTextField(hintText: 'Password', controller: passwordController, obscureText: true),
        const SizedBox(height: 16),
        AppTextField(hintText: 'Confirm Password', controller: confirmController, obscureText: true),
        const SizedBox(height: 16),
        AppButton(text: 'Continue', onPressed: () {}),
        const SizedBox(height: 16),
        const Text('Or'),
        const SizedBox(height: 16),
        SocialButton(text: 'Sign Up With Google', icon: Icons.g_mobiledata),
      ],
    );
  }
}
