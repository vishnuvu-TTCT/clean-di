import 'package:dartz/dartz.dart';
import 'package:dependencyinjection/core/error/failure.dart';
import 'package:dependencyinjection/features/auth/domain/entities/login.dart';
import 'package:dependencyinjection/features/auth/domain/usecases/post_login.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams params);
}
