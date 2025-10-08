import 'package:flutter/material.dart';
import '../organisms/signup_body.dart';
import '../templates/auth_template.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      child: SignupBody(
        onBack: () => Navigator.pop(context),
        onNavigateLogin: () => Navigator.pushNamed(context, '/login'),
      ),
    );
  }
}
