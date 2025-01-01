import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/features/profile/presentation/widgets/languge_change.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../auth/presentation/logout/widgets/logout_dialog.dart';
import '../widgets/custom_app_bar_of_profile_main_screen.dart';
import '../widgets/custom_main_profile_data.dart';
import '../widgets/custom_switch_icon.dart';


class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});
  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        actions: const [
          CustomAppBarOfProfileMainScreen(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomMainProfileData(),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              height: 1.h,
              color: MyColors.white70,
            ),
            const CustomSwitchIcon(),
            Container(
              width: double.infinity,
              height: 1.h,
              color: MyColors.white70,
            ),
            Container(
              margin: EdgeInsets.all(30.sp),
              height: 150.h,
              child: Column(
                children: [
              Row(
              children: [
              SizedBox(
              width: 20.w,
                height: 20.w,
                child: Image.asset(Assets.imagesLanguage),
              ),
              SizedBox(width: 5.w),
              Text(
                context.translate(LangKeys.language),
                style: MyFonts.styleRegular400_16.copyWith(
                  color: MyColors.blackBase,
                ),
              ),
              const Spacer(),
              LanguageChange(),
              // InkWell(
              //   onTap: () {
              //     final currentLanguage = context.read<LanguageProvider>().selectedLanguage;
              //     final newLanguage = currentLanguage.code == 'en'
              //         ? Language(code: 'ar')
              //         : Language(code: 'en');
              //     context.read<LanguageProvider>().changeLanguage(newLanguage);
              //   },
              //   child: Consumer<LanguageProvider>(
              //     builder: (context, provider, _) {
              //       return Text(
              //         provider.selectedLanguage.code == 'en' ? context.translate(LangKeys.english ): context.translate(LangKeys.arabic),
              //         style: MyFonts.styleRegular400_14.copyWith(
              //           color: MyColors.baseColor,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              ],
            ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: double.infinity,
              height: 1.h,
              color: MyColors.white70,
            ),
            Container(
              margin: EdgeInsets.all(30.sp),
              child: Row(
                children: [
                  SizedBox(
                      width: 18.sp,
                      height: 18.sp,
                      child: Image.asset(Assets.imagesLogoutBlack)),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                   context.translate(LangKeys.logout),
                    style: MyFonts.styleRegular400_16.copyWith(
                      color: MyColors.blackBase,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showLogoutDialog(context);
                    },
                    child: SizedBox(
                        width: 30.w,
                        height: 30.w,
                        child: Image.asset(
                          Assets.imagesLogout,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
