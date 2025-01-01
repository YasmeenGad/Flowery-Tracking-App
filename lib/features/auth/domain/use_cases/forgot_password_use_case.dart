import 'package:injectable/injectable.dart';
import '../../../../core/networking/common/api_result.dart';
import '../../domain/contracts/auth_repo.dart';
import '../../domain/entities/request/forget_password_request_entity.dart';
import '../../domain/entities/response/forget_password_response_entity.dart';



@injectable
class ForgotPasswordUseCase {
  AuthRepository authRepository;

  ForgotPasswordUseCase(this.authRepository);

  Future<DataResult<ForgetPasswordResponseEntity>> call(
      ForgetPasswordRequestEntity body) {
    return authRepository.forgetPassword(request: body);
  }
}
