import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_widgets.dart';

class BasicTextField extends StatelessWidget {
  final bool shadow;
  final String hint;
  final TextInputType inputType;

  const BasicTextField({
    super.key,
    this.shadow = false,
    required this.hint,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: shadow,
      style: inputTextStyle,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: inputPaddingConstraints,
        enabledBorder: OutlineInputBorder(
          borderSide: inputBorderside,
          borderRadius: inputBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: inputBordersideFocused,
          borderRadius: inputBorderRadius,
        ),
      ),
    );
  }
}
