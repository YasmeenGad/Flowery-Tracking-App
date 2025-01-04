import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../viewModel/profile_view_model_cubit.dart';
import 'custom_picture_main_screen.dart';

class CustomMainProfileData extends StatelessWidget {
  const CustomMainProfileData({super.key, required this.state});

  final GetLoggedUserDataSuccess state;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomPictureMainScreen(),
        Column(
          spacing: 8.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${state.data.driver!.firstName}',
                style: MyFonts.styleMedium500_18),
            Text('${state.data.driver!.email}',
                style: MyFonts.styleRegular400_16),
            Text('${state.data.driver!.phone}',
                style: MyFonts.styleRegular400_16),
          ],
        ),
        const Spacer(),
        Icon(
          Icons.arrow_forward_ios,
          color: MyColors.grey,
          size: 20.sp,
        ),
      ],
    );
  }
}
