import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_delivery/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../auth/presentation/login/widgets/custom_text_form_field.dart';
import '../../domain/entities/response/get_all_vehicles_entity.dart';
import '../viewModel/edit_profile/edit_profile_action.dart';
import '../viewModel/edit_profile/edit_profile_cubit.dart';
import '../viewModel/vehicles/vehicles_cubit.dart';
import 'dropdown_button_vehicle.dart';
import 'edit_profile_listener.dart';
class VehicleForm extends StatelessWidget {
  const VehicleForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
      builder: (context, profileState) {
        if (profileState is GetLoggedUserDataSuccess) {
          return BlocBuilder<VehiclesCubit, VehiclesState>(
            builder: (context, vehiclesState) {
              final vehiclesCubit = context.read<VehiclesCubit>();
              if (vehiclesState is GetVehiclesSuccess) {
                return BlocConsumer<EditProfileCubit, EditProfileState>(
                  listener: (context, state) => editProfileListener(context, state),
                    builder: (context, editState) {
                    final editProfileCubit = context.read<EditProfileCubit>();
                    final userData = profileState.data.driver;
                    final vehicleTypeId = userData?.vehicleType;
                    final vehicleTypeName = vehiclesCubit.vehicles
                        .firstWhere(
                          (vehicle) => vehicle.id == vehicleTypeId,
                      orElse: () => Vehicles(id: '', type: 'Unknown'),
                    )
                        .type;

                    vehiclesCubit.vehicleTypeController.text = vehicleTypeName!;
                    vehiclesCubit.vehicleNumberController.text = userData?.vehicleNumber ?? '';
                    vehiclesCubit.vehicleLicenseController.text = userData?.vehicleLicense ?? '';

                    return Form(
                      key: vehiclesCubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonVehicle(vehiclesCubit: vehiclesCubit),
                          const SizedBox(height: 16.0),
                          CustomTextFormField(
                            controller: vehiclesCubit.vehicleNumberController,
                            keyboardType: TextInputType.number,
                            hintText: context.translate(LangKeys.vehicleNumber),
                            labelText: context.translate(LangKeys.vehicleNumber),
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextFormField(
                            controller: vehiclesCubit.vehicleLicenseController,
                            hintText: context.translate(LangKeys.vehicleLicense),
                            labelText: context.translate(LangKeys.vehicleLicense),
                          ),
                          const SizedBox(height: 24.0),
                          CurvedButton(
                            title: context.translate(LangKeys.update),
                            color: MyColors.baseColor,
                            onTap: () {
                              if (vehiclesCubit.formKey.currentState!.validate()) {
                                final selectedVehicleTypeName = vehiclesCubit.vehicleTypeController.text;
                                final selectedVehicle = vehiclesCubit.vehicles.firstWhere(
                                      (vehicle) => vehicle.type == selectedVehicleTypeName,
                                  orElse: () => Vehicles(id: '', type: ''),
                                );

                                Map<String, dynamic> profileData = {
                                  'vehicleType': selectedVehicle.id,
                                  'vehicleNumber': vehiclesCubit.vehicleNumberController.text,
                                  'vehicleLicense': vehiclesCubit.vehicleLicenseController.text,
                                };

                                editProfileCubit.doAction(EditProfile(profileData));
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              }

              return AppLoader();
            },
          );
        }

        return AppLoader();
      },
    );
  }
}
