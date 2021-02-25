import 'package:flutter/material.dart';

class BitTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final bool obscureText;

  const BitTextField(
      {Key key,
      @required this.hintText,
      @required this.icon,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusColor: Colors.black,
      ),
    );
  }
}
