import 'package:dartz/dartz.dart';
import 'package:dependencyinjection/core/api/api.dart';
import 'package:dependencyinjection/core/core.dart';
import 'package:dependencyinjection/features/features.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;
  const AuthRemoteDataSourceImpl(this._dioClient);
  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams) async {
    final response = await _dioClient.postRequest(
      ListAPI.login,
      data: loginParams.toJson(),
      converter: (response) =>
          LoginResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
