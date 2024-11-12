import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    super.key,
    required this.endIndent,
  });

  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white,
      height: 30,
      endIndent: endIndent,
    );
  }
}
