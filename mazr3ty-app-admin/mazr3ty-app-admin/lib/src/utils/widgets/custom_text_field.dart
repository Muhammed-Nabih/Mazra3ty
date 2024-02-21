import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? inputType;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
  const CustomTextField({
    super.key,
    this.inputType,
    this.suffexIcon,
    this.onSaved,
    this.onChanged,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: inputType,
      ),
    );
  }
}
