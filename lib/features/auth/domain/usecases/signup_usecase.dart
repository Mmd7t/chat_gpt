import 'package:chat_gpt/features/auth/domain/entities/auth_entity.dart';
import 'package:chat_gpt/features/auth/domain/repositories/base_repo.dart';

class SignUpUseCase {
  final AuthBaseRepo authRepository;

  SignUpUseCase(this.authRepository);

  Future<AuthEntity> call(SignUpParams params) async {
    try {
      AuthEntity authUser = await authRepository.signUp(
        email: params.email,
        password: params.password,
      );
      return authUser;
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({
    required this.email,
    required this.password,
  });
}
