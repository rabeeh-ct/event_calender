import 'package:flutter/material.dart';

class HideKeyboard {
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
