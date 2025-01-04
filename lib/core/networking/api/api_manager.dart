import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/auth/data/models/request/forget_password_request_dto.dart';
import '../../../features/auth/data/models/request/login_request_dto.dart';
import '../../../features/auth/data/models/request/reset_password_request_dto.dart';
import '../../../features/auth/data/models/request/signup_request_dto.dart';
import '../../../features/auth/data/models/request/verify_reset_code_request_dto.dart';
import '../../../features/auth/data/models/response/forget_password_response_dto.dart';
import '../../../features/auth/data/models/response/login_response_dto.dart';
import '../../../features/auth/data/models/response/reset_password_response_dto.dart';
import '../../../features/auth/data/models/response/signup_response_dto.dart';
import '../../../features/auth/data/models/response/verify_reset_code_response.dart';
import '../../../features/profile/data/models/request/change_password_request_dto.dart';
import '../../../features/profile/data/models/response/change_password_response_dto.dart';
import '../../../features/profile/data/models/response/edit_profile_response_dto.dart';
import '../../../features/profile/data/models/response/get_all_vehicles_dto.dart';
import '../../../features/profile/data/models/response/get_logged_driver_data_response_dto.dart';
import '../../../features/profile/data/models/response/upload_photo_response_dto.dart';
import 'api_constants.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @POST(ApiConstants.signInApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);

  @POST(ApiConstants.registerApi)
  Future<SignUpResponseDto> signUp(@Body() SignUpRequestDto request);

  @POST(ApiConstants.forgotPasswordApi)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto request);

  @POST(ApiConstants.verifyResetCodeApi)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
      @Body() VerifyResetCodeRequestDto resetCode);

  @PUT(ApiConstants.resetPasswordApi)
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() ResetPasswordRequestDto resetPassword);

  @GET(ApiConstants.getLoggedDriverData)
  Future<GetLoggedDriverDataResponseDto> getLoggedDriverData();

  @PUT(ApiConstants.editProfile)
  Future<EditProfileResponseDto> editProfile(@Body() Map<String, dynamic> body);


  @PUT(ApiConstants.uploadPhoto)
  @MultiPart()
  Future<UploadPhotoResponseDto> uploadPhoto(
    @Part(name: "photo") File photo,
  );
  @GET(ApiConstants.getAllVehicles)
  Future<GetAllVehiclesDto> getAllVehicles();

  @PATCH(ApiConstants.changePassword)
  Future<ChangePasswordResponseDto> changePassword(
      @Body() ChangePasswordRequestDto request);

}
