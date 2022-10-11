part of 'login_cubit.dart';

enum AuthStatus { unKnown, authenticated, unAuthenticated }

class LoginState extends Equatable{
  final AuthStatus status;

  const LoginState._({this.status = AuthStatus.unKnown});

  const LoginState.authenticated()
      : this._(status: AuthStatus.authenticated);

  const LoginState.unAuthenticated()
      : this._(status: AuthStatus.unAuthenticated);

  @override
  List<Object?> get props => [status];

}