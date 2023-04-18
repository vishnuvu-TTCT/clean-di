import 'package:dependencyinjection/core/core.dart';
import 'package:dependencyinjection/dependency_injection.dart';
import 'package:dependencyinjection/features/auth/auth.dart';
import 'package:dependencyinjection/utils/helper/helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._postLogin) : super(const _Loading());
  final PostLogin _postLogin;
  Future<void> login(LoginParams params) async {
    emit(const _Loading());
    final data = await _postLogin.call(params);
    data.fold((left) {
      if (left is ServerFailure) {
        emit(_Failure(left.message ?? ''));
      }
    }, (right) {
      sl<PrefManager>().isLogin = true;
      sl<PrefManager>().token = right.token;
      emit(_Success(right.token));
    });
  }

  Future<void> logout() async {
    emit(const _Loading());
    sl<PrefManager>().logout();
    emit(const _Success(null));
  }
}
