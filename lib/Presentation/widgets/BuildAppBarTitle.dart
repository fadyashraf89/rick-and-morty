import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class BuildAppBarTitle extends StatelessWidget {
  const BuildAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "All Characters",
      style:
          (TextStyle(color: MyColors.WhiteColor, fontWeight: FontWeight.bold)),
    );
  }
}
