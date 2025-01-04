// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/app_cubit/app_cubit.dart' as _i693;
import '../core/networking/api/api_manager.dart' as _i282;
import '../core/networking/common/regestet_context_module.dart' as _i125;
import '../core/networking/network_factory.dart' as _i377;
import '../features/auth/data/data_sources/contracts/auth_online_data_source.dart'
    as _i901;
import '../features/auth/data/data_sources/contracts/offline_data_source.dart'
    as _i345;
import '../features/auth/data/data_sources/impl/auth_offline_data_source_impl.dart'
    as _i1036;
import '../features/auth/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i326;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i990;
import '../features/auth/domain/contracts/auth_repo.dart' as _i665;
import '../features/auth/domain/use_cases/forgot_password_use_case.dart'
    as _i301;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i496;
import '../features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i906;
import '../features/auth/domain/use_cases/signup_use_case.dart' as _i853;
import '../features/auth/domain/use_cases/verify_reset_code_use_case.dart'
    as _i642;
import '../features/auth/presentation/forget_password/ViewModel/forget_password_view_model_cubit.dart'
    as _i60;
import '../features/auth/presentation/login/viewModel/login_view_model_cubit.dart'
    as _i690;
import '../features/auth/presentation/signup/view_model/signup_view_model_cubit.dart'
    as _i508;
import '../features/profile/data/data_sources/contracts/profile_online_data_source.dart'
    as _i46;
import '../features/profile/data/data_sources/impl/profile_online_data_source_impl.dart'
    as _i74;
import '../features/profile/data/repositories/profile_repo_impl.dart' as _i933;
import '../features/profile/domain/repositories/profile_repo.dart' as _i49;
import '../features/profile/domain/use_cases/profile_use_case.dart' as _i804;
import '../features/profile/presentation/viewModel/edit_profile/edit_profile_cubit.dart'
    as _i638;
import '../features/profile/presentation/viewModel/profile_view_model_cubit.dart'
    as _i907;
import '../features/profile/presentation/viewModel/vehicles/vehicles_cubit.dart'
    as _i338;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final registerModule = _$RegisterModule();
    gh.factory<_i693.AppCubit>(() => _i693.AppCubit());
    gh.factory<_i361.LogInterceptor>(
        () => networkFactory.providerInterceptor());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigatorKey);
    gh.lazySingleton<_i361.Dio>(() => networkFactory.provideDio());
    gh.factory<_i345.OfflineDataSource>(
        () => _i1036.OfflineDataSourceImplementation());
    gh.singleton<_i282.ApiManager>(() => _i282.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i46.ProfileOnlineDataSource>(
        () => _i74.ProfileOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i901.AuthOnlineDataSource>(
        () => _i326.AuthOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i665.AuthRepository>(
        () => _i990.AuthRepositoryImpl(gh<_i901.AuthOnlineDataSource>()));
    gh.factory<_i49.ProfileRepo>(
        () => _i933.ProfileRepoImpl(gh<_i46.ProfileOnlineDataSource>()));
    gh.factory<_i496.LoginUseCase>(
        () => _i496.LoginUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i853.SignUpUseCase>(
        () => _i853.SignUpUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i301.ForgotPasswordUseCase>(
        () => _i301.ForgotPasswordUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i906.ResetPasswordUseCase>(
        () => _i906.ResetPasswordUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i642.VerifyResetCodeUseCase>(
        () => _i642.VerifyResetCodeUseCase(gh<_i665.AuthRepository>()));
    gh.factory<_i690.LoginViewModel>(
        () => _i690.LoginViewModel(gh<_i496.LoginUseCase>()));
    gh.factory<_i804.ProfileUseCase>(
        () => _i804.ProfileUseCase(gh<_i49.ProfileRepo>()));
    gh.factory<_i638.EditProfileCubit>(() => _i638.EditProfileCubit(
          gh<_i804.ProfileUseCase>(),
          gh<_i345.OfflineDataSource>(),
        ));
    gh.factory<_i508.SignUpViewModel>(
        () => _i508.SignUpViewModel(gh<_i853.SignUpUseCase>()));
    gh.factory<_i338.VehiclesCubit>(
        () => _i338.VehiclesCubit(gh<_i804.ProfileUseCase>()));
    gh.factory<_i60.ForgetPasswordViewModelCubit>(
        () => _i60.ForgetPasswordViewModelCubit(
              gh<_i301.ForgotPasswordUseCase>(),
              gh<_i642.VerifyResetCodeUseCase>(),
              gh<_i906.ResetPasswordUseCase>(),
            ));
    gh.factory<_i907.ProfileViewModelCubit>(() => _i907.ProfileViewModelCubit(
          gh<_i804.ProfileUseCase>(),
          gh<_i338.VehiclesCubit>(),
        ));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$RegisterModule extends _i125.RegisterModule {}
