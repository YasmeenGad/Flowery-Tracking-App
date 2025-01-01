import '../../../../../core/networking/common/api_result.dart';
import '../../../domain/entities/request/forget_password_request_entity.dart';
import '../../../domain/entities/request/login_request_entity.dart';
import '../../../domain/entities/request/reset_password_request_entity.dart';
import '../../../domain/entities/request/signup_request_entity.dart';
import '../../../domain/entities/request/verify_reset_code_request_entity.dart';
import '../../../domain/entities/response/forget_password_response_entity.dart';
import '../../../domain/entities/response/login_response_entity.dart';
import '../../../domain/entities/response/signup_response_entity.dart';
import '../../models/response/reset_password_response_dto.dart';
import '../../models/response/verify_reset_code_response.dart';

abstract class AuthOnlineDataSource {
  Future<DataResult<LoginResponseEntity>> login(LoginRequestEntity request);

  Future<DataResult<SignUpResponseEntity>> signUp(
      {required SignUpRequestEntity request});

  Future<DataResult<ForgetPasswordResponseEntity>> forgetPassword(
      {required ForgetPasswordRequestEntity request});

  Future<DataResult<VerifyResetCodeResponseDto>> verifyResetCode(
      {required VerifyResetCodeRequestEntity request});

  Future<DataResult<ResetPasswordResponseDto>> resetPassword(
      {required ResetPasswordRequestEntity request});
}
