import 'package:movies_app/domain/entity/login_respone_entity.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponseEntity response;
  LoginSuccess(this.response);
}

final class UpdatePassword extends LoginState {
  final bool isPasswordVisible;
  UpdatePassword(this.isPasswordVisible);
}

final class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

sealed class LoginActions {}

final class NavigateToRegisterAction extends LoginActions {}

final class PasswordVisibilityAction extends LoginActions {}

final class LoginUserAction extends LoginActions {
  final String email;
  final String password;
  LoginUserAction({required this.email, required this.password});
}

sealed class LoginNavigationAction extends LoginState {}

final class LoginNavigationToRegister extends LoginNavigationAction {}

final class LoginNavigationToHome extends LoginNavigationAction {}