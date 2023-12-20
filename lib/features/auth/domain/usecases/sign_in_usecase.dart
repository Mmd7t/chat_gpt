import 'package:chat_gpt/features/auth/domain/entities/auth_entity.dart';
import 'package:chat_gpt/features/auth/domain/repositories/base_repo.dart';

class SignInUseCase {
  // Use cases don't know anything about the underlying data sources.
  final AuthBaseRepo authRepository;

  SignInUseCase(this.authRepository);

  // The primary role of a use case is to orchestrate the execution of
  // a specific business operation. They coordinate the flow of data
  // to and from entities by interacting with repositories.
  Future<AuthEntity> call(SignInParams params) async {
    try {
      return await authRepository.signIn(
        email: params.email,
        password: params.password,
      );
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

// You can bundle several parameters into one object
// that can be easily passed around.
class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
