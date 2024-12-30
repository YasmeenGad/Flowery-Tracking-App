import 'package:flutter/material.dart';
import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key, required this.question, required this.txt,required this.onPressed});
  final dynamic question, txt;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: MyFonts.styleRegular400_16
        ),
        TextButton(
          onPressed: onPressed,

          child: Text(
            txt,
            style: MyFonts.styleRegular400_16.copyWith(
              color: MyColors.baseColor,
              decoration: TextDecoration.underline,
              decorationColor: MyColors.baseColor,

            ),
          ),
        ),
      ],
    );
  }
}
