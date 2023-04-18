import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String? message;
  const ServerFailure(String? s, {required this.message});
  @override
  List<Object?> get props => [message];
}

class NodataFailure extends Failure {
  const NodataFailure();
  @override
  List<Object?> get props => [];
}

class CachedFailure extends Failure {
  const CachedFailure();
  @override
  List<Object?> get props => [];
}
