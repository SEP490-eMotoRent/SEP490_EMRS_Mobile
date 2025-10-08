import 'package:flutter/material.dart';
import '../atoms/app_text_field.dart';
import '../atoms/app_button.dart';
import '../atoms/social_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();

    return Column(
      children: [
        AppTextField(hintText: 'Phone Number', controller: phoneController),
        const SizedBox(height: 16),
        AppButton(text: 'Continue', onPressed: () {}),
        const SizedBox(height: 16),
        const Text('Or'),
        const SizedBox(height: 16),
        SocialButton(text: 'Sign Up With Google', icon: Icons.g_mobiledata),
        const SizedBox(height: 8),
        SocialButton(text: 'Sign Up With E-Mail', icon: Icons.email),
      ],
    );
  }
}
