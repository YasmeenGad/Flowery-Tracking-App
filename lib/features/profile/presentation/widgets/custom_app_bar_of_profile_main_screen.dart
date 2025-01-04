import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../generated/assets.dart';

AppBar customAppBarOfProfileMainScreen({
  required String appBarTxt,
  bool showArrow = false,
  VoidCallback? navigation,
  required BuildContext context,
}) {
  return AppBar(
      backgroundColor: MyColors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          showArrow == true
              ? GestureDetector(
                  onTap: () {
                    if (navigation != null) {
                      navigation();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: MyColors.black,
                  ),
                )
              : const SizedBox(),
          Text(appBarTxt, style: MyFonts.styleMedium500_20),
        ],
      ),
      elevation: 0.0,
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Wrap(
            spacing: 220.sp,
            children: [
              badges.Badge(
                badgeContent: Text(
                  '3',
                  style: MyFonts.styleMedium500_11.copyWith(
                    color: MyColors.whiteBase,
                  ),
                ),
                position: badges.BadgePosition.topEnd(top: -10.h, end: -2.w),
                child: SvgPicture.asset(Assets.imagesNotification),
              ),
            ],
          ),
        ),
      ]);
}
