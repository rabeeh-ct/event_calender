import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

const defaultPadding = 20.0;
const defaultAppBarHeight = 56.0;
const defaultSpacer = SizedBox(
  height: defaultPadding,
);
const defaultSpacerSmall = SizedBox(
  height: defaultPadding / 2,
);
const defaultSpacerHorizontal = SizedBox(width: defaultPadding);
const defaultSpacerHorizontalSmall = SizedBox(
  width: defaultPadding / 2,
);

const defaultAnimationDuration = Duration(milliseconds: 500);

const dividerColor = Color(0xFFC4C4C4);
const backGroundColor = Color(0xFFffffff);
const bgLightBlue = Color(0xFFF2F6F9);
const lightGrey = Color(0xFFEEEEEE);
// const lightGrey = Color(0xFFf1f2f6);
const whiteColor = Colors.white;
const greyColor = Color(0xff959595);
const primaryColor = Color(0xFF0C9494);
const errorColor = Color(0xFFFC4444);
const blackColor = Color(0xff000000);
const greenColor = Color(0xff4BB543);
const warningColor = Color(0xFFFF640D);
// const offWhite = Color(0xffCED2D6);

const darkGrey = Color(0xff343C42);
const lightColor = Color(0xffC3C0C3);
const offWhite = Color(0xffE8E8E8);
// const darkGrey = Color(0xff666666);
const darkBackground = Color(0xff192126);
const darkButtonColor = Color(0xff1e282e);
const darkButtonSecondaryColor = Color(0xff515661);

const defaultShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(2, 5),
    blurRadius: 5,
  )
];


extension Sizedbox on num {
  SizedBox get sBH => SizedBox(height: toDouble());
  SizedBox get sBW => SizedBox(width: toDouble());
}

extension StringExtension on String{
  String get upperFirst=>"${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

// extension SampleText on String {
//   Text get errorText => Text(toString(),style: const TextStyle(color: Colors.red),);
// }