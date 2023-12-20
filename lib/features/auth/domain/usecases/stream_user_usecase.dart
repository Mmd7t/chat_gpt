import 'package:chat_gpt/features/auth/domain/entities/auth_entity.dart';
import 'package:chat_gpt/features/auth/domain/repositories/base_repo.dart';

class StreamAuthUserUseCase {
  final AuthBaseRepo authRepository;

  StreamAuthUserUseCase(this.authRepository);

  Stream<AuthEntity> call() {
    try {
      return authRepository.authUser;
    } catch (error) {
      throw Exception(error);
    }
  }
}
