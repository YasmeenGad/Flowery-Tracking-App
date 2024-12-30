
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';

import '../../styles/fonts/my_fonts.dart';
import 'buttons/carved_button.dart';


class CustomDialog {
  const CustomDialog._();

  static void twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
    required bool isLoading,
  }) {
    showDialog<dynamic>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey,
        title: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 20.h,
          ),
          child: Center(
            child: Text(
               textBody,
              style: MyFonts.styleMedium500_18.copyWith(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          CurvedButton(
            onTap: onPressed,
            title: textButton1,
            width: 320.w,
            height: 45.h,
          ),
          SizedBox(height: 10.h, width: 1.w),
          CurvedButton(
            onTap: () {
              context.pop();
            },
            title: textButton2,
            width: 320.w,
            height: 45.h,
          ),
        ],
      ),
    );
  }
}