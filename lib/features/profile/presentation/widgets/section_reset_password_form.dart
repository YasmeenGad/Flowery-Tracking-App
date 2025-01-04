import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import 'package:flowery_delivery/features/profile/presentation/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../../di/di.dart';
import '../../domain/entities/request/change_password_request_entity.dart';
import '../viewModel/edit_profile/edit_profile_action.dart';
import '../viewModel/edit_profile/edit_profile_cubit.dart';

class SectionResetPasswordForm extends StatefulWidget {
  const SectionResetPasswordForm({super.key});

  @override
  State<SectionResetPasswordForm> createState() =>
      _SectionResetPasswordFormState();
}

class _SectionResetPasswordFormState extends State<SectionResetPasswordForm> {
  late final EditProfileCubit profileViewModel;
  late final TextEditingController passwordController;
  late final TextEditingController newPasswordController;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    newPasswordController = TextEditingController();
    profileViewModel = getIt.get<EditProfileCubit>();
  }

  @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>(
        create: (context) => profileViewModel,
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            return Column(
              children: [
                ResetPasswordForm(
                    passwordController: passwordController,
                    newPasswordController: newPasswordController,
                    formKey: formKey),
                const SizedBox(
                  height: 55,
                ),
                CurvedButton(
                    title: context.translate(LangKeys.update),
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        profileViewModel.doAction(ChangePassword(
                            request: ChangePasswordRequestEntity(
                                password: passwordController.text,
                                newPassword: newPasswordController.text)));
                      }
                    }),
              ],
            );
          },
          listener: (context, state) {
            switch (state) {
              case ChangePasswordLoading():
                aweSnackBar(
                    msg: context.translate(LangKeys.loading),
                    context: context,
                    type: MessageTypeConst.help,
                    title: context.translate(LangKeys.loading));
                break;
              case ChangePasswordSuccess():
                aweSnackBar(
                    msg:
                        context.translate(LangKeys.passwordChangedSuccessfully),
                    context: context,
                    type: MessageTypeConst.success,
                    title: context.translate(LangKeys.success));
                context.pushReplacementNamed(AppRoutes.profileView);
                break;
              case ChangePasswordError():
                state.error.error.toString() == context.translate(LangKeys.incorrectEmailOrPassword)
            ? aweSnackBar(
                        msg: context.translate(LangKeys.oldPasswordIncorrect),
                        context: context,
                        type: MessageTypeConst.failure,
                        title: context.translate(LangKeys.error))
                    : aweSnackBar(
                        msg: state.error.error.toString(),
                        context: context,
                        type: MessageTypeConst.success,
                        title: context.translate(LangKeys.error));

                break;
              default:
            }
          },
        ));
  }
}
