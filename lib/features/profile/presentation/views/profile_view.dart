import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../di/di.dart';
import '../viewModel/edit_profile/edit_profile_cubit.dart';
import '../viewModel/profile_actions.dart';
import '../viewModel/profile_view_model_cubit.dart';
import '../widgets/custom_app_bar_of_profile_main_screen.dart';
import '../widgets/custom_profile_picture.dart';
import '../widgets/section_profile_form.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileViewModelCubit>(
          create: (context) =>
          getIt.get<ProfileViewModelCubit>()..doAction(GetLoggedUserData()),
        ),
        BlocProvider<EditProfileCubit>(
          create: (BuildContext context) => getIt.get<EditProfileCubit>(),
        ),
      ],
      child: Scaffold(
          backgroundColor: MyColors.white,
        appBar: customAppBarOfProfileMainScreen(
            appBarTxt: context.translate(LangKeys.editProfile), context: context, showArrow: true),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            spacing: 24.h,
            children: [
              const ProfilePic(),
              const SectionProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
