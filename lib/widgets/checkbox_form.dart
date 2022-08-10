import 'package:flutter/material.dart';

class GetCheckValue extends StatefulWidget {
  GetCheckValue(
      {super.key,
      this.title,
      required this.isChecked,
      required this.formField});

  bool isChecked;
  Widget? title;
  var formField;

  @override
  GetCheckValueState createState() {
    return GetCheckValueState();
  }
}

class GetCheckValueState extends State<GetCheckValue> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: widget.title,
      value: widget.isChecked,
      onChanged: (value) {
        setState(() => widget.formField = value!);
      },
    );
  }
}
