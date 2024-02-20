import 'package:flutter/material.dart';
import 'package:gawean/constants.dart';

class ComponentTextFieldForm extends StatelessWidget {
  const ComponentTextFieldForm({super.key, required this.text, required this.obscureText, this.suffixIcon, required this.textInputType, this.validator, this.textEditingController, this.focusNode, required this.onChanged});

  final String text;
  final bool obscureText;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        suffixIcon: suffixIcon,
        hintText: text,
        //errorText: _isValidate ? null: validationMessage,
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.kNeutral3,
            fontSize: 16
        ),
        hintMaxLines: 1,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: AppColor.kErrorColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: AppColor.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}


