import 'package:dartz/dartz.dart';

import '../error/error.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
