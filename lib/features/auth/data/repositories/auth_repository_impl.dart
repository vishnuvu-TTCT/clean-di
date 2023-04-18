import 'package:dependencyinjection/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dependencyinjection/features/auth/domain/entities/login.dart';
import 'package:dependencyinjection/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dependencyinjection/features/auth/domain/repositories/auth_repository.dart';
import 'package:dependencyinjection/features/auth/domain/usecases/post_login.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRepository;
  const AuthRepositoryImpl(this._authRepository);
  @override
  Future<Either<Failure, Login>> login(LoginParams params) async {
    final response = await _authRepository.login(params);
    return response.fold(
        (failure) => Left(failure), (login) => Right(login.toEntity()));
  }
}
