import 'package:movies_app/data/api_manager/api_client.dart';
import 'package:movies_app/data/data_source/api_remote_impl.dart';
import 'package:movies_app/data/mappers/login_entity_mapper.dart';
import 'package:movies_app/data/mappers/register_entity_mapper.dart';
import 'package:movies_app/data/repository_imp/auth_repo_impl.dart';
import 'package:movies_app/domain/repository/auth_repository.dart';
import 'package:movies_app/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';

Dio sharedDio() => Dio();

LoginCubit injectionLoginCubit() {
  final apiClient = ApiClient(sharedDio());


  final apiRemoteData = ApiRemoteImpl();

  final AuthRepository authRepository = ApiAuthRepoImpl(
    apiRemoteData,
  );

  return LoginCubit(authRepository);
}