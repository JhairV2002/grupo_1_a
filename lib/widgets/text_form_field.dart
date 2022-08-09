import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.icon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.helperText,
    this.autofocus,
    this.keyboardType,
    this.obscureText,
    this.initialValue,
    this.color,
    required this.onChange,
  });

  Icon? icon;
  Icon? suffixIcon;
  String? hintText;
  String? labelText;
  String? helperText;
  bool? autofocus;
  TextInputType? keyboardType;
  bool? obscureText;
  Function(String?) onChange;
  String? initialValue;
  TextStyle? color;

  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        autofocus: autofocus ?? false,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        initialValue: initialValue ?? '',
        decoration: InputDecoration(
          icon: icon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          helperStyle: color ?? const TextStyle(color: Colors.white),
        ),
        onChanged: onChange,
        style: color ?? const TextStyle(color: Colors.white),
        cursorColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    ));
  }
}
