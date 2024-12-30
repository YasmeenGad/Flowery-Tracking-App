import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/utils/widgets/base/custom_app_bar.dart';
import '../../../../generated/assets.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         CustomAppBar(appBarTxt: context.translate(LangKeys.editProfile), showArrow: true),
        badges.Badge(
          badgeContent: const Text(
            ' ',
            style: TextStyle(color: Colors.white),
          ),
          position: badges.BadgePosition.topEnd(top: -10.h, end: -2.w),
          child: SvgPicture.asset(Assets.imagesNotification),
        ),
      ],
    );
  }
}
