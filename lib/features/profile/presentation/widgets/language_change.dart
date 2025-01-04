import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_state.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../generated/assets.dart';

class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AppCubit>();
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              width: 20.w,
              height: 20.w,
              child: Image.asset(Assets.imagesLanguage),
            ),
            SizedBox(width: 5.w),
            Text(context.translate(LangKeys.language),
                style: MyFonts.styleMedium500_18),
            const Spacer(),
            InkWell(
              onTap: () {
                AppLocalizations.of(context)!.isEnLocale
                    ? cubit.toArabic()
                    : cubit.toEnglish();
              },
              child: Text(
                  AppLocalizations.of(context)!.isEnLocale
                      ? context.translate(LangKeys.english)
                      : context.translate(LangKeys.arabic),
                  style: MyFonts.styleMedium500_14),
            )
          ],
        );
      },
    );
  }
}
