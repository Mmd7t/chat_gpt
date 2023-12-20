import 'package:chat_gpt/features/auth/domain/entities/auth_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthUserModel extends Equatable {
  final String id;
  final String email;
  final String? token;

  const AuthUserModel({
    required this.id,
    required this.email,
    this.token,
  });

  factory AuthUserModel.fromFirebaseAuthUser(
    firebase_auth.User firebaseUser,
  ) {
    return AuthUserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      token: firebaseUser.refreshToken ?? '',
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      email: email,
      token: token!,
    );
  }

  @override
  List<Object?> get props => [id, email, token];
}
