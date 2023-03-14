import 'dart:developer';

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  Icon prefixIcon;
  String hint;
  var function;
  CustomTextfield({super.key, required this.prefixIcon, required this.hint, required this.function});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: function,
        decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
            prefixIcon: prefixIcon));
  }
}
