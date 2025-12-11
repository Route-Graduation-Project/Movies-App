// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager/api_client.dart' as _i686;
import '../../data/api_manager/movies_api_client.dart' as _i959;
import '../../data/data_source/api_remote_impl.dart' as _i175;
import '../../data/data_source/firebase_data_source_impl.dart' as _i907;
import '../../data/data_source/movies_api_remote_impl.dart' as _i709;
import '../../data/repository_imp/auth_repo_impl.dart' as _i906;
import '../../data/repository_imp/movie_repo_impl.dart' as _i800;
import '../../domain/repository/api_remote_data.dart' as _i776;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/repository/firebase_data_source.dart' as _i158;
import '../../domain/repository/movies_api_remote_data.dart' as _i1024;
import '../../domain/repository/movies_repository.dart' as _i231;
import '../../domain/use_case/use_case.dart' as _i719;
import '../../presentation/movie_details_screen/cubit/movie_details_cubit.dart'
    as _i941;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i719.UseCase>(() => _i719.UseCase());
    gh.factory<_i941.MovieDetailsCubit>(() => _i941.MovieDetailsCubit());
    gh.lazySingleton<_i361.Dio>(() => dioModule.sharedDio());
    gh.singleton<_i686.ApiClient>(() => _i686.ApiClient.new(gh<_i361.Dio>()));
    gh.singleton<_i959.MoviesApiClient>(
      () => _i959.MoviesApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i231.MoviesRepository>(() => _i800.MovieRepoImpl());
    gh.factory<_i158.FirebaseDataSource>(() => _i907.FirebaseDataSourceImpl());
    gh.factory<_i1024.MoviesApiData>(() => _i709.MoviesApiRemoteImpl());
    gh.factory<_i776.ApiRemoteData>(() => _i175.ApiRemoteImpl());
    gh.factory<_i614.AuthRepository>(
      () => _i906.ApiAuthRepoImpl(
        gh<_i776.ApiRemoteData>(),
        gh<_i158.FirebaseDataSource>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i946.DioModule {}
