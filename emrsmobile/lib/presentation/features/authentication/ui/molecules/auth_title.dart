import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 8),
        Text(subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.white70)),
      ],
    );
  }
}
