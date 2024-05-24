import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      required this.onChanged,
      required this.validator,
      this.keyboardType});
  final String label;
  final void Function(String value) onChanged;
  final String? Function(String? value) validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
        label: Text(label),
      ),
      validator: validator,
    );
  }
}
