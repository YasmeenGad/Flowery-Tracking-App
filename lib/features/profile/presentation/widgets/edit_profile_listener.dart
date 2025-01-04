import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../viewModel/edit_profile/edit_profile_cubit.dart';

void editProfileListener(BuildContext context, EditProfileState state) {
  switch (state) {
    case EditProfileError():
      aweSnackBar(
        msg: state.error.error.toString(),
        context: context,
        type: MessageTypeConst.failure,
        title: context.translate(LangKeys.error),
      );
      break;
    case EditProfileSuccess():
      aweSnackBar(
        msg: context.translate(LangKeys.profileUpdatedSuccessfully),
        context: context,
        type: MessageTypeConst.success,
        title: context.translate(LangKeys.success),
      );
      break;
    default:
      break;
  }
}
