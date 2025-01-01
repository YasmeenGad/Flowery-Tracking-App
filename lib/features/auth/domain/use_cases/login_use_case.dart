import 'package:injectable/injectable.dart';
import '../../../../core/networking/common/api_result.dart';
import '../../domain/contracts/auth_repo.dart';
import '../../domain/entities/request/login_request_entity.dart';
import '../../domain/entities/response/login_response_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  @factoryMethod
  LoginUseCase(this._authRepository);

  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await _authRepository.login(request);
  }
}
