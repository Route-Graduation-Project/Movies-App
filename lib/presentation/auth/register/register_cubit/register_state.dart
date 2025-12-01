import 'package:movies_app/data/models/register_request.dart';
import 'package:movies_app/domain/entity/register_response_entity.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterResponseState extends RegisterState {
  final RegisterResponseEntity response;
  RegisterResponseState(this.response);
}

final class UpdatePassword extends RegisterState {
  final bool isPassword;
  UpdatePassword(this.isPassword);
}

final class UpdateAvatarId extends RegisterState {
  final int avatarIndex;
  UpdateAvatarId(this.avatarIndex);
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
}

sealed class RegisterActions {}

final class NavigateToLoginAction extends RegisterActions {}

final class PasswordVisibility extends RegisterActions {}

final class SaveAvatarId extends RegisterActions {
  final int avatarIndex;
  SaveAvatarId(this.avatarIndex);
}

final class RegisterUser extends RegisterActions {
  final RegisterRequest response;
  RegisterUser(this.response);
}

sealed class RegisterNavigationAction {}

final class RegisterNavigationToLogin extends RegisterNavigationAction {}
