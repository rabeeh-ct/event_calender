import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/theme/theme.dart';

showMessage(String message, {Duration? duration, bool isError = false}) {
  Get.showSnackbar(
    GetSnackBar(
      // message: message,
      snackStyle: SnackStyle.FLOATING,
      // icon: ,
      icon: isError
          ? const Icon(
              Icons.error_outline,
              color: Colors.red,
            )
          : null,
      messageText: Text(
        message,
        textScaleFactor: 1.0,
        style:
            Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      duration: duration ?? (isError?const Duration(milliseconds: 1500):const Duration(milliseconds: 1000)),
      borderRadius: defaultPadding / 2,
      backgroundColor: const Color(0xff28353e),
      animationDuration: const Duration(milliseconds: 600),
      margin:
          const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding),
    ),
  );
  // Get.snackbar(message, "",);
  // ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
  //   duration: const Duration(seconds: 2),
  //   // backgroundColor: blackColor,
  //   content: Text(
  //     message,
  //     textScaleFactor: 1.0,
  //     // style: const TextStyle(
  //     //     color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 14),
  //   ),
  //   shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(defaultPadding / 2))),
  //   behavior: SnackBarBehavior.floating,
  //   margin: const EdgeInsets.symmetric(
  //       horizontal: defaultPadding / 2, vertical: defaultPadding),
  // ));
}
