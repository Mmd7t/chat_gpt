import 'package:chat_gpt/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUsecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
