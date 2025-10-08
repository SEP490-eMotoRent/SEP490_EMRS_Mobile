import 'package:flutter/material.dart';

class AuthTemplate extends StatelessWidget {
  final Widget child;

  const AuthTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(child: child),
        ),
      ),
    );
  }
}
