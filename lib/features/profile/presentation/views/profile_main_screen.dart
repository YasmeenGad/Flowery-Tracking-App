import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import 'package:flowery_delivery/features/profile/presentation/widgets/custom_vehicle_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../viewModel/profile_view_model_cubit.dart';
import '../viewModel/vehicles/vehicles_cubit.dart';
import '../widgets/custom_app_bar_of_profile_main_screen.dart';
import '../widgets/custom_main_profile_data.dart';
import '../widgets/custom_switch_icon.dart';
import '../widgets/language_change.dart';
import '../widgets/logout_widget.dart';
import '../widgets/shadow_container_widget.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBarOfProfileMainScreen(
          appBarTxt: context.translate(LangKeys.profile), context: context),
      body: BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
        builder: (context, state) {
          switch (state) {
            case ProfileViewModelInitial():
            case GetLoggedUserDataLoading():
              return const AppLoader();
            case GetLoggedUserDataSuccess():
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Column(
                  spacing: 24.h,
                  children: [
                    CustomSwitchIcon(),
                    ShadowContainerWidget(
                      onTap: () {
                        context.pushNamed(AppRoutes.profileView);
                      },
                      child: CustomMainProfileData(
                        state: state,
                      ),
                    ),
                    ShadowContainerWidget(
                      onTap: () {
                        context.pushNamed(AppRoutes.vehicleView);
                      },
                      child: BlocBuilder<VehiclesCubit, VehiclesState>(
                        builder: (context, vehiclesState  ) {
                          if (vehiclesState is GetVehiclesSuccess) {
                            return CustomVehicleData(
                              state: state,
                              vehicles: vehiclesState.data.vehicles!,
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    LanguageChange(),
                    LogoutWidget(),
                  ],
                ),
              );
            case GetLoggedUserDataError():
              SchedulerBinding.instance.addPostFrameCallback((_) {
                aweSnackBar(
                  msg: context.translate(state.error.error!),
                  context: context,
                  type: MessageTypeConst.failure,
                );
              });
          }
          return Container();
        },
      ),
    );
  }
}
