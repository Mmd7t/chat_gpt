import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String id;
  final String email;
  final String token;

  const AuthEntity({
    required this.id,
    required this.email,
    required this.token,
  });

  static const AuthEntity empty = AuthEntity(
    id: '',
    email: '',
    token: '',
  );

  // An entity can be an object with methods, or it can be a set of
  // data structures and functions.
  bool get isEmpty => this == AuthEntity.empty;

  @override
  List<Object> get props {
    return [id, email, token];
  }
}
