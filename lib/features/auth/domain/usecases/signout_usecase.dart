import 'package:chat_gpt/features/auth/domain/repositories/base_repo.dart';

class SignOutUseCase {
  final AuthBaseRepo authRepository;

  SignOutUseCase(this.authRepository);

  Future<void> call() async {
    try {
      await authRepository.signOut();
    } catch (error) {
      throw Exception(error);
    }
  }
}
