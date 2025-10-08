import 'package:flutter/material.dart';

class BackNavButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackNavButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: onPressed ?? () => Navigator.pop(context),
    );
  }
}
