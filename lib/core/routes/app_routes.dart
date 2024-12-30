import 'package:flowery_delivery/features/auth/presentation/onBoarding/on_boarding.dart';
import 'package:flowery_delivery/features/auth/presentation/onBoarding/on_boarding_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery_delivery/core/utils/screens/under_build_screen.dart';
import '../../di/di.dart';
import '../../features/auth/presentation/forget_password/ViewModel/forget_password_view_model_cubit.dart';
import '../../features/auth/presentation/forget_password/view/email_verification.dart';
import '../../features/auth/presentation/forget_password/view/forget_password.dart';
import '../../features/auth/presentation/forget_password/view/reset_password.dart';
import '../../features/auth/presentation/login/view/login_view.dart';
import '../../features/auth/presentation/signup/view/signup_view.dart';
import '../../features/auth/presentation/signup/view_model/signup_view_model_cubit.dart';
import '../../features/profile/presentation/views/profile_main_screen.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/profile/presentation/views/reset_password_profile_view.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String onBoarding = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgetPassword = 'forgetPassword';
  static const String emailVerification = 'emailVerification';
  static const String resetPassWord = 'resetPassWord';
  static const String changePassWord = 'changePassWord';
  static const String homeScreen = 'homeScreen';
  static const String profileMainScreen = 'profileMainScreen';
  static const String profileView = "profileView";
  static const String resetPasswordProfileView = 'resetPasswordProfileView';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return BaseRoute(
          page: const OnBoarding(),
        );
      case AppRoutes.login:
        return BaseRoute(
          page: const LoginView(),
        );
      case AppRoutes.register:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<SignUpViewModel>(),
              child: const SignUpView()),
        );
      case AppRoutes.forgetPassword:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<ForgetPasswordViewModelCubit>(),
              child: ForgetPassword()),
        );
      case AppRoutes.emailVerification:
        return BaseRoute(
            page: BlocProvider(
              create: (context) => getIt.get<ForgetPasswordViewModelCubit>(),
              child: EmailVerification(args as String),
            ));

      case AppRoutes.resetPassWord:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<ForgetPasswordViewModelCubit>(),
              child: ResetPassword()),
        );
      case AppRoutes.profileMainScreen:
        return BaseRoute(page: const ProfileMainScreen());
      case AppRoutes.profileView:
        return BaseRoute(page: const ProfileView());
      case AppRoutes.resetPasswordProfileView:
        return BaseRoute(page: const ResetPasswordProfileView());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
