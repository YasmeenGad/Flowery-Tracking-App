import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
class ChangeText extends StatelessWidget {
  const ChangeText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.resetPasswordProfileView);
      },
      child: Text(
      context.translate(LangKeys.change),
        style: MyFonts.styleMedium500_14.copyWith(color: MyColors.baseColor),
      ),
    );
  }
}
