import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/features/profile/presentation/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/buttons/carved_button.dart';
import '../viewModel/edit_profile/edit_profile_action.dart';
import '../viewModel/edit_profile/edit_profile_cubit.dart';
import '../viewModel/profile_actions.dart';
import '../viewModel/profile_view_model_cubit.dart';
import 'custom_section_gender.dart';
import 'edit_profile_listener.dart';

class SectionProfileForm extends StatefulWidget {
  const SectionProfileForm({super.key});

  @override
  SectionProfileFormState createState() => SectionProfileFormState();
}

class SectionProfileFormState extends State<SectionProfileForm> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String? selectedGender;
  bool isModified = false;

  @override
  void initState() {
    super.initState();
    context.read<ProfileViewModelCubit>().doAction(GetLoggedUserData());
  }

  void _checkIfModified() {
    setState(() {
      isModified = firstNameController.text.isNotEmpty ||
          lastNameController.text.isNotEmpty ||
          emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty ||
          phoneNumberController.text.isNotEmpty ||
          selectedGender != null;
    });
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> profileData = {
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'phone': phoneNumberController.text,
      };
      context.read<EditProfileCubit>().doAction(EditProfile(profileData));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
      builder: (context, profileState) {
        if (profileState is GetLoggedUserDataSuccess) {
          final userData = profileState.data;
          firstNameController.text = userData.driver?.firstName ?? '';
          lastNameController.text = userData.driver?.lastName ?? '';
          emailController.text = userData.driver?.email ?? '';
          phoneNumberController.text = userData.driver?.phone ?? '';
          selectedGender = userData.driver?.gender;
        }

        return BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) => editProfileListener(context, state),
          builder: (context, editState) {
            return Column(
              children: [
                ProfileForm(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  phoneNumberController: phoneNumberController,
                  formKey: formKey
                ),
                const SizedBox(height: 24),
                CustomSectionGender(
                  selectedGender: selectedGender ?? "",
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                      _checkIfModified();
                    });
                  },
                ),
                const SizedBox(height: 24),
                CurvedButton(
                  title: context.translate(LangKeys.update),
                  color: MyColors.baseColor,
                  onTap:  _submitForm
                ),
              ],
            );
          },
        );
      },
    );
  }
}
