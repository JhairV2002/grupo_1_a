import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.icon,
      this.suffixIcon,
      this.hintText,
      this.labelText,
      this.helperText,
      this.autofocus,
      this.keyboardType,
      this.obscureText});

  Icon? icon;
  Icon? suffixIcon;
  String? hintText;
  String? labelText;
  String? helperText;
  bool? autofocus;
  TextInputType? keyboardType;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
            autofocus: autofocus ?? false,
            keyboardType: keyboardType ?? TextInputType.text,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              icon: icon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              labelText: labelText,
              helperText: helperText,
            ))));
  }
}
