import 'package:flutter/material.dart';

import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      this.isPassword,
      this.hintText,
      this.labelText,
      this.controller,
      this.suffix,
      this.validator
      ,this.keyboardType});

  final String? hintText;
  final String? labelText;
  final dynamic controller;
  final bool? isPassword;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ?? false,
      controller: widget.controller,
      keyboardType:  widget.keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        suffix: widget.suffix ?? const SizedBox(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.labelText ?? '',
        labelStyle: MyFonts.styleRegular400_12.copyWith(color: MyColors.gray),
        hintText: widget.hintText ?? '',
        hintStyle:
            MyFonts.styleRegular400_14.copyWith(color: MyColors.placeHolder),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.gray),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.gray),
        ),
      ),
      validator: widget.validator,
    );
  }
}
