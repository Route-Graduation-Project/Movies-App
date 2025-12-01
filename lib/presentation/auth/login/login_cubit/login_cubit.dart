import 'package:movies_app/core/base/base_cubit.dart';
import 'package:movies_app/data/models/login_request.dart';
import 'package:movies_app/data/models/login_responce.dart';
import 'package:movies_app/domain/entity/login_respone_entity.dart';
import 'package:movies_app/data/mappers/login_entity_mapper.dart';
import 'package:movies_app/domain/repository/auth_repository.dart';
import 'package:movies_app/presentation/auth/login/login_cubit/login_state.dart';

class LoginCubit
    extends BaseCubit<LoginState, LoginActions, LoginNavigationAction> {
  LoginCubit(this.authRepository) : super(LoginInitial());

  final AuthRepository authRepository;

  bool isPasswordVisible = true;
  LoginResponse? loginResponse;


  @override
  Future<void> doAction(LoginActions action) async {
    switch (action) {
      case NavigateToRegisterAction():
        _navigateToRegister();
        break;

      case LoginUserAction():
        await _loginUser(action);
        break;

      case PasswordVisibilityAction():
        _passwordVisibility();
        break;
    }
  }

  Future<void> _loginUser(LoginUserAction action) async {
    emit(LoginLoading());

    try {
      final LoginResponse response =
      await authRepository.loginWithEmailAndPassword(
        LoginRequest(
          email: action.email,
          password: action.password,
        ),
      );


      if (response.token.isEmpty) {
        emit(LoginFailure(response.message));
        return;
      }

      loginResponse = response;

      final LoginResponseEntity entity =
      LoginEntityMapper.converterToLoginEntity(response);
      emit(LoginSuccess(entity));

      emitNavigation(LoginNavigationToHome());
    } catch (e) {
      emit(LoginFailure(
          'Login failed. Please check your credentials. Error: $e'));
    }
  }

  void _navigateToRegister() {
    emitNavigation(LoginNavigationToRegister());
  }

  void _passwordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(UpdatePassword(isPasswordVisible));
  }
}
