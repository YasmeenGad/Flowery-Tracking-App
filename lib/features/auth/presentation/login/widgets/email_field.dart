import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/utils/validators.dart';
import 'custom_text_form_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      validator: (value) => Validators.validateEmail(value, context),
      hintText: context.translate(LangKeys.hintEmail),
      labelText: context.translate(LangKeys.email),
    );
  }
}
