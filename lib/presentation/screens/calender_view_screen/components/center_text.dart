import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class CenterText extends StatelessWidget {
  const CenterText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14,color: blackColor),
      ),
    );
  }
}
