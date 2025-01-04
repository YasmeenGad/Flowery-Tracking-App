import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
class CustomSwitchIcon extends StatefulWidget {
  const CustomSwitchIcon({super.key});

  @override
  State<CustomSwitchIcon> createState() => _CustomSwitchIconState();
}

class _CustomSwitchIconState extends State<CustomSwitchIcon> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSwitched = !isSwitched;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 52,
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 4.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.sp),
              color: isSwitched ? MyColors.green : Colors.grey,
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: isSwitched ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.whiteBase,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
        context.translate(LangKeys.readyForDelivery),
          style: MyFonts.styleMedium500_18
        ),

      ],
    );
  }
}
