// import 'package:chat_gpt/core/usecase/base_usecase.dart';
// import 'package:chat_gpt/features/auth/domain/entities/auth_entity.dart';
// import 'package:chat_gpt/features/auth/domain/repositories/base_repo.dart';
// import 'package:dartz/dartz.dart';

// import '../../../../core/error/failure.dart';

// class RegisterUsecase extends BaseUsecase<AuthEntity, RegisterUsecaseParams> {
//   final AuthBaseRepo registerBaseRepository;

//   RegisterUsecase(this.registerBaseRepository);

//   @override
//   Future<Either<Failure, AuthEntity>> call(params) async {
//     return await registerBaseRepository.auth(AuthParams(
//       email: params.email,
//       password: params.password,
//     ));
//   }
// }

// class RegisterUsecaseParams {
//   final String email;
//   final String password;

//   RegisterUsecaseParams({
//     required this.email,
//     required this.password,
//   });
// }
