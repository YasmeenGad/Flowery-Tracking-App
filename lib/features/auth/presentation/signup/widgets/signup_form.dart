import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import 'package:flowery_delivery/features/auth/presentation/signup/widgets/signup_bloc_listener.dart';

import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../view_model/signup_action.dart';
import '../view_model/signup_view_model_cubit.dart';
import 'auth_footer.dart';
import 'condition_text.dart';
import 'gender_selection.dart';
import 'signup_fields.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpViewModel>();

    return Form(
      key: cubit.signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpBlocListener(),
          BlocBuilder<SignUpViewModel, SignUpViewModelState>(
              builder: (context, state) {
            return Column(
              children: [
                SignUpFields(cubit: cubit),
                verticalSpacing(
                  30,
                ),
                GenderSelection(cubit: cubit),
              ],
            );
          }),
          verticalSpacing(
            20,
          ),
          conditionText(context),
          verticalSpacing(
            50,
          ),
          CurvedButton(
            title: context.translate(LangKeys.signUp),
            onTap: () {
              cubit.doAction(SignupActionSelected());
            },
          ),
          verticalSpacing(
            15,
          ),
          AuthFooter(
              question: context.translate(LangKeys.alreadyHaveAnAccount),
              txt: context.translate(LangKeys.login),
              onPressed: () {
                context.pushNamed(AppRoutes.login);
              }),
        ],
      ),
    );
  }
}
