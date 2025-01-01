import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_delivery/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:flowery_delivery/features/auth/presentation/login/viewModel/login_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../../core/utils/widgets/base/base_view.dart';
import '../../../../../core/utils/widgets/base/snack_bar.dart';
import '../../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../../di/di.dart';
import '../viewModel/login_view_model_cubit.dart';
import '../widgets/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel viewModel;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  @override
  void initState() {
    viewModel = getIt.get<LoginViewModel>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginViewModel>(
      create: (context) => viewModel,
      child: BlocConsumer<LoginViewModel, LoginViewModelState>(
        // buildWhen: (previous, current) => current is LoginViewModelInitial,
        builder: (context, state) {
          switch (state) {
            case LoginViewModelLoading():
              return const AppLoader();
            case LocationPermissionDenied():
            case LoginViewModelInitial():
            case LoginViewModelSuccess():
            case LoginViewModelError():
              return BaseView(
                child: CustomScrollView(
                  slivers: [
                     SliverToBoxAdapter(
                      child: customAppBar(appBarTxt: context.translate(LangKeys.login),context: context),
                    ),
                    SliverToBoxAdapter(
                      child: verticalSpacing(20),
                    ),
                    LoginForm(
                      formKey: formKey,
                      passwordController: passwordController,
                      emailController: emailController,
                      onRememberMeChanged: (bool value) {
                        setState(() {
                          rememberMe = value;
                        });
                      },
                    ),
                    SliverToBoxAdapter(
                      child: verticalSpacing(70),
                    ),

                    SliverToBoxAdapter(
                      child:            CurvedButton(
                        color: MyColors.baseColor,
                        title: context.translate(LangKeys.labelContinue),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            viewModel.doAction(LoginAction(
                              LoginRequestEntity(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                              rememberMe,
                              context, // Pass the rememberMe value here
                            ));
                          }
                        },
                      ),
                    ),


                  ],
                ),
              );
          }
        },
        listener: (context, state) {
          switch (state) {
            case LocationPermissionDenied():
              aweSnackBar(
                  msg: context.translate(LangKeys.locationPermissionDenied),
                  context: context,
                  type: MessageTypeConst.failure,
                  title: context.translate(LangKeys.error));
              break;
            case LoginViewModelSuccess():
              context.pushReplacementNamed(AppRoutes.homeScreen);
              aweSnackBar(
                  msg:  context.translate(LangKeys.success),
                  context: context,
                  type: MessageTypeConst.success,
                  title: context.translate(LangKeys.success));
              break;
            case LoginViewModelError():
              debugPrint(state.errorMessage.error);
              aweSnackBar(
                  msg: state.errorMessage.error!,
                  context: context,
                  type: MessageTypeConst.failure,
                  title: context.translate(LangKeys.error));
            case LoginViewModelLoading():
            default:
              return;
          }
        },
      ),
    );
  }
}
