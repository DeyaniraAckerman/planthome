import 'package:flutter/material.dart';

class PtInputDecoration {
  static InputDecoration inputDecoration(
      {required String hintText,
      IconData? prefixIcon,
      IconButton? suffixIcon}) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.white) : null,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30.0), right: Radius.circular(30.0))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30.0), right: Radius.circular(30.0))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30, width: 2),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30.0), right: Radius.circular(30.0))));
  }
}
