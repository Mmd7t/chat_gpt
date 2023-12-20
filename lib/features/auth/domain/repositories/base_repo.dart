import 'package:chat_gpt/features/auth/domain/entities/auth_entity.dart';

abstract class AuthBaseRepo {
  Stream<AuthEntity> get authUser;

  Future<AuthEntity> signUp({
    required String email,
    required String password,
  });

  Future<AuthEntity> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
