import 'package:flutter/material.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          TextSpan(
            text: (value == null || value!.isEmpty) ? 'N/A' : value,
            // Check for empty string
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
