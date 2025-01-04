import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../auth/presentation/logout/widgets/logout_dialog.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
    ]);
  }
}
