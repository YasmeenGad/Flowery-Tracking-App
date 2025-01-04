import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../widgets/custom_app_bar_of_profile_main_screen.dart';
import '../widgets/vehicle_form.dart';

class VehicleView extends StatelessWidget {
  const VehicleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBarOfProfileMainScreen(
        appBarTxt: context.translate(LangKeys.editProfile),
        context: context,
        showArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: VehicleForm(),
      ),
    );
  }
}
