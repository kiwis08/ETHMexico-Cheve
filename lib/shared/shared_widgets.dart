import 'package:flutter/material.dart';

class RoundedTextFormField extends StatelessWidget {
  const RoundedTextFormField(
      {Key? key,
        required this.controller,
        required this.labelText,
        this.prefixIcon,
        this.suffixIcon,
        this.obscure = false,
        this.autofillHints,
        required this.inputType,
        this.validator,
      })
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool obscure;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputType inputType;
  final Iterable<String>? autofillHints;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      autofillHints: autofillHints,
      validator: validator,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: suffixIcon,
          ),
          labelText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: Colors.black12,),
    );
  }
}