import 'package:flutter/material.dart';
import '../organisms/hello_body.dart';
import '../templates/auth_template.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      child: HelloBody(
        onSignUp: () => Navigator.pushNamed(context, '/signup'),
        onSignIn: () => Navigator.pushNamed(context, '/login'),
      ),
    );
  }
}
