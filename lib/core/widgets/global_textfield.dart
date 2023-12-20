import 'package:chat_gpt/config/extensions.dart';
import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final bool? obscure;
  final String hint;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final BorderSide? borderSide;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const GlobalTextField({
    super.key,
    this.obscure,
    required this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixIconColor,
    this.borderSide,
    this.textInputAction,
    this.controller,
    this.textInputType,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscure ?? false,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.text,
      style: context.textTheme.bodyMedium!.copyWith(
        color: Colors.white,
      ),
      decoration: CustomInputDecoration.decorate(
        context,
        hint: hint,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
