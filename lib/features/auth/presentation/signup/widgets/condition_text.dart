import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';

Widget conditionText(BuildContext context) {
  return RichText(
    text: TextSpan(
      text:context.translate(LangKeys.creatingAccount),
      style:MyFonts.styleRegular400_12.copyWith(
        color: MyColors.black
      ),
      children: <TextSpan>[
        TextSpan(
            text:context.translate(LangKeys.termsAndConditions),
          style: MyFonts.styleSemiBold600_12.copyWith(
            decoration: TextDecoration.underline,

          )

        ),


      ],
    ),
  );
}