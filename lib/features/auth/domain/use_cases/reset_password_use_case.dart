import 'package:injectable/injectable.dart';
import '../../../../core/networking/common/api_result.dart';
import '../../data/models/response/reset_password_response_dto.dart';
import '../../domain/contracts/auth_repo.dart';
import '../../domain/entities/request/reset_password_request_entity.dart';


@injectable
class ResetPasswordUseCase {
  AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<DataResult<ResetPasswordResponseDto>> call(
      ResetPasswordRequestEntity body) {
    return authRepository.resetPassword(request: body);
  }
}
