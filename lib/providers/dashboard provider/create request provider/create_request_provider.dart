import 'package:flutter/material.dart';

class CreateRequstProvider extends ChangeNotifier {
  // ----------------------------------------------------- Getters -------------------------------------------------------------

  InputDecoration get inputDecoration => _inputDecoration;
   List<DropdownMenuItem> itemTypesDropDown = [];

  // ----------------------------------------------------- Variables -----------------------------------------------------------

  final InputDecoration _inputDecoration = InputDecoration(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.red)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    fillColor: Colors.grey[100],
    filled: true,
  );

  // ----------------------------------------------------- Functionality -------------------------------------------------------

  String? nameValidation({required String? value}) {
    if (value == null) {
      return "Field Can't be null";
    } else if (value.isEmpty) {
      return "Field Can't be null";
    } else if (value.length < 3) {
      return "Must be greater then 3";
    } 
    return null;
  }
}
