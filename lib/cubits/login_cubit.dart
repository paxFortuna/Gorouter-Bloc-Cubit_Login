import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.unAuthenticated());

  void login() {
    emit(const LoginState.authenticated());
  }

  void logout() {
    emit(const LoginState.unAuthenticated());
  }
}