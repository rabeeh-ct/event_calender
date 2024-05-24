import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';
import 'loading_widget.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.textColor = whiteColor,
    this.height = defaultPadding * 2.5,
    this.borderRadius = defaultPadding * .5,
    required this.isLoading,
    required this.onPressed,
    this.fontSize = 16,
    this.child,
  });
  final String text;

  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double height;
  final double borderRadius;
  final VoidCallback onPressed;
  final bool isLoading;
  final double fontSize;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GestureDetector(
          onTap: isLoading ? () {} : onPressed,
          child: SizedBox(
            height: height + defaultPadding / 2,
            child: Column(
              children: [
                Container(
                  height: height,
                  decoration: BoxDecoration(
                      color: backgroundColor ?? (!Get.isDarkMode ? primaryColor : null),
                      // border: Border.fromBorderSide(BorderSide(color: borderColor!, width: 1.5))
                      gradient: Get.isDarkMode
                          ? backgroundColor == null
                              ? const RadialGradient(
                                  // focal: AlignmentDirectional.topCenter,
                                  // focalRadius: 5,
                                  radius: 3,
                                  center: Alignment.topCenter,
                                  colors: [darkButtonSecondaryColor, darkButtonColor],
                                  stops: [0, .5],
                                )
                              : null
                          : null,
                      border: borderColor != null ? Border.all(color: borderColor!) : null,
                      borderRadius: BorderRadius.circular(borderRadius),
                      boxShadow: defaultShadow),
                  child: isLoading
                      ? const Center(child: ButtonLoadingWidget())
                      : Center(
                          child: child ??
                              Text(
                                text,
                                textScaleFactor: 1.0,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: fontSize),
                              ),
                        ),
                  // child: ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     textStyle: TextStyle(color: textColor),
                  //     backgroundColor: backgroundColor,
                  //     shape:borderColor!=null?
                  //     RoundedRectangleBorder(
                  //       side: BorderSide(color: borderColor!, width: 1.5),
                  //       borderRadius: BorderRadius.circular(defaultPadding*.5),
                  //     ):null,
                  //   ),
                  //   onPressed: isLoading ? () {} : onPressed,
                  //   child: isLoading
                  //       ? const ButtonLoadingWidget()
                  //       : Text(
                  //           text,
                  //           textScaleFactor: 1.0,
                  //           style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  //               color: textColor, fontWeight: FontWeight.w600),
                  //         ),
                  // ),
                ),
              ],
            ),
          ),
        ))
        //     child: SizedBox(
        //   height: height,
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       textStyle: TextStyle(color: textColor),
        //       backgroundColor: backgroundColor,
        //       shape:borderColor!=null?
        //       RoundedRectangleBorder(
        //         side: BorderSide(color: borderColor!, width: 1.5),
        //         borderRadius: BorderRadius.circular(defaultPadding*.5),
        //       ):null,
        //     ),
        //     onPressed: isLoading ? () {} : onPressed,
        //     child: isLoading
        //         ? const ButtonLoadingWidget()
        //         : Text(
        //             text,
        //             textScaleFactor: 1.0,
        //             style: Theme.of(context).textTheme.titleMedium?.copyWith(
        //                 color: textColor, fontWeight: FontWeight.w600),
        //           ),
        //   ),
        // ))
      ],
    );
  }
}
