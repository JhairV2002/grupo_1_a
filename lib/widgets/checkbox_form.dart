import 'package:flutter/material.dart';

class GetCheckValue extends StatefulWidget {
  GetCheckValue({
    super.key,
    required this.isChecked,
  });

  bool isChecked;
  @override
  GetCheckValueState createState() {
    return GetCheckValueState();
  }
}

class GetCheckValueState extends State<GetCheckValue> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.isChecked,
      onChanged: (value) {
        setState(() => widget.isChecked = value!);
      },
    );
  }
}
