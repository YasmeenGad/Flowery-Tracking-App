import 'package:injectable/injectable.dart';
import '../../../../core/networking/common/api_result.dart';
import '../../data/models/response/verify_reset_code_response.dart';
import '../../domain/contracts/auth_repo.dart';
import '../../domain/entities/request/verify_reset_code_request_entity.dart';

@injectable
class VerifyResetCodeUseCase {
  AuthRepository authRepository;

  VerifyResetCodeUseCase(this.authRepository);

  Future<DataResult<VerifyResetCodeResponseDto>> call(
      VerifyResetCodeRequestEntity body) {
    return authRepository.verifyResetCode(request: body);
  }
}
