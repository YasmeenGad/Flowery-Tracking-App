import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_delivery/core/app_cubit/app_cubit.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';

import '../../../../core/app_cubit/app_state.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/custom_dialog.dart';


class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AppCubit>();
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [

              Text(
                context.translate(LangKeys.language),
                style: MyFonts.styleMedium500_18
              ),
              const Spacer(),
              //* Language Buttons
              InkWell(
                onTap: () {
                  CustomDialog.twoButtonDialog(
                    context: context,
                    textBody: context.translate(LangKeys.changeToTheLanguage),
                    textButton1: context.translate(LangKeys.ok),
                    textButton2: context.translate(LangKeys.cancel),
                    onPressed: () {
                      selectLanguagesButton(
                        context: context,
                        cubit: cubit,
                      );
                    },
                    isLoading: false,
                  );
                },
                child: Row(
                  children: [
                    Text(
                       context.translate(
                        LangKeys.language,
                      ),
                      style: MyFonts.styleMedium500_14
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void selectLanguagesButton(
      {required BuildContext context, required AppCubit cubit}) {
    if (AppLocalizations.of(context)!.isEnLocale) {
      cubit.toArabic();
    }
    else {
      cubit.toEnglish();
    }
    context.pop();
  }
}