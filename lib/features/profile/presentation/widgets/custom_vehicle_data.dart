import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../domain/entities/response/get_all_vehicles_entity.dart';
import '../viewModel/profile_view_model_cubit.dart';

class CustomVehicleData extends StatelessWidget {
  const CustomVehicleData({super.key, required this.state, required this.vehicles});

  final GetLoggedUserDataSuccess state;
  final List<Vehicles> vehicles;

  @override
  Widget build(BuildContext context) {
    final vehicleTypeName = vehicles
        .firstWhere(
          (vehicle) => vehicle.id == state.data.driver!.vehicleType,
      orElse: () => Vehicles(type: 'Unknown'),
    )
        .type;

    return Row(
      spacing: 16.w,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          spacing: 8.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.translate(LangKeys.vehicleInfo), style: MyFonts.styleMedium500_18),
            Text('$vehicleTypeName',
                style: MyFonts.styleRegular400_16),
            Text('${state.data.driver!.vehicleNumber}',
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