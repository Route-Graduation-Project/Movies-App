import 'package:movies_app/core/base/base_cubit.dart';
import 'package:movies_app/data/data_source/api_remote_impl.dart';
import 'package:movies_app/data/data_source/firebase_data_source_impl.dart';
import 'package:movies_app/data/repository_imp/auth_repo_impl.dart';
import 'package:movies_app/domain/entity/register_response_entity.dart';
import 'package:movies_app/domain/repository/auth_repository.dart';
import 'package:movies_app/presentation/auth/register/register_cubit/register_state.dart';

RegisterCubit injectionRegisterCubit() {
  return RegisterCubit(
    ApiAuthRepoImpl(ApiRemoteImpl(), FirebaseDataSourceImpl()),
  );
}

class RegisterCubit
    extends
        BaseCubit<RegisterState, RegisterActions, RegisterNavigationAction> {
  RegisterCubit(this.authRepository) : super(RegisterInitial());
  AuthRepository authRepository;
  RegisterResponseEntity? registerResponse;
  int currentIndex = 0;
  bool isPassword = true;
  @override
  Future<void> doAction(RegisterActions action) async {
    switch (action) {
      case NavigateToLoginAction():
        _navigateToLogin();
        break;
      case RegisterUser():
        await _registerUser(action);
        break;

      case SaveAvatarId():
        _getAvatarId(action);

        break;
      case PasswordVisibility():
        _passwordVisibility();
        break;
    }
  }

  Future<void> _registerUser(RegisterUser action) async {
    emit(RegisterLoading());

    try {
      var results = await authRepository.register(
        name: action.response.name,
        email: action.response.email,
        password: action.response.password,
        confirmPassword: action.response.confirmPassword,
        phone: action.response.phone,
        avatarId: action.response.avatarId,
      );

      if (results.message != "User created successfully") {
        emit(RegisterFailure(results.message ?? "Something went wrong"));
        return;
      }

      emit(RegisterResponseState(results));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

  void _navigateToLogin() {
    emitNavigation(RegisterNavigationToLogin());
  }

  void _passwordVisibility() {
    isPassword = !isPassword;
    emit(UpdatePassword(isPassword));
  }

  void _getAvatarId(SaveAvatarId action) {
    currentIndex = action.avatarIndex;
    emit(UpdateAvatarId(currentIndex));
  }
}
