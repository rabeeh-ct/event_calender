import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class BottomSheetSmallContainer extends StatelessWidget {
  const BottomSheetSmallContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43,
      height: 5,
      decoration: BoxDecoration(
        color:
            Get.isDarkMode ? const Color(0xff929393) : const Color(0xff666666),
        borderRadius: BorderRadius.circular(defaultPadding),
      ),
    );
  }
}
