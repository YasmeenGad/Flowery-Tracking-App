import 'package:flowery_delivery/core/localization/lang_keys.dart';
import 'package:flowery_delivery/core/routes/app_routes.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import 'package:flowery_delivery/core/utils/widgets/base/base_view.dart';
import 'package:flowery_delivery/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_delivery/features/auth/presentation/onBoarding/on_boarding_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Center(
       child:  Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,

           spacing: 32,
           children: [
             OnBoardingAnimation(),
             Text('Welcome to\nFlowery rider app'),
             CurvedButton(
               color: MyColors.baseColor,
               title: context.translate(LangKeys.login),
               onTap: () {
               context.pushNamed(AppRoutes.login);
               },
             ),
             CurvedButton(
               color: MyColors.white,
               colorBorderSide: MyColors.gray,
               textColor: MyColors.gray,
               title: context.translate(LangKeys.applyNow),
               onTap: () {
               context.pushNamed(AppRoutes.register);
               },
             ),
      
           ],
         ),
       ),
      ),
    );
  }
}
