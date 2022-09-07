import 'package:dartz/dartz.dart';
import 'package:gutenberg_library/core/error/failure.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
