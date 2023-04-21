import 'package:dartz/dartz.dart';
import 'package:dependencyinjection/core/core.dart';
import 'package:dependencyinjection/features/users/users.dart';

abstract class UsersRepository {
  Future<Either<Failure, Users>> users(UsersParams usersParams);
}
