import 'package:chat_gpt/features/auth/data/datasources/local_datasource/local_datasource.dart';
import 'package:chat_gpt/features/auth/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:chat_gpt/features/auth/domain/entities/auth_entity.dart';
import 'package:chat_gpt/features/auth/domain/repositories/base_repo.dart';

class AuthRepositoryImpl implements AuthBaseRepo {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  const AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Stream<AuthEntity> get authUser {
    return remoteDataSource.user.map((authUserModel) {
      if (authUserModel != null) {
        localDataSource.write(key: 'user', value: authUserModel);
      } else {
        localDataSource.write(key: 'user', value: null);
      }

      return authUserModel == null
          ? AuthEntity.empty
          : authUserModel.toEntity();
    });
  }

  @override
  Future<AuthEntity> signUp({
    required String email,
    required String password,
  }) async {
    final authModel = await remoteDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );

    localDataSource.write(key: 'user', value: authModel);

    return authModel.toEntity();
  }

  @override
  Future<AuthEntity> signIn({
    required String email,
    required String password,
  }) async {
    final authModel = await remoteDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    localDataSource.write(key: 'user', value: authModel);

    return authModel.toEntity();
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();

    localDataSource.write(key: 'user', value: null);
  }
}
