import 'package:flutter/material.dart';
import '../organisms/login_body.dart';
import '../templates/auth_template.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      child: LoginBody(
        onBack: () => Navigator.pop(context),
        onNavigateSignUp: () => Navigator.pushNamed(context, '/signup'),
      ),
    );
  }
}
