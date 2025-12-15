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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../api/api_service.dart' as _i299;
import '../api/data_source/remote/auth/auth_remote_data_source_impl.dart'
    as _i502;
import '../api/dio/dio_modules.dart' as _i866;
import '../data/data_source/remote/auth_remote_data_source.dart' as _i1066;
import '../data/repository/auth/auth_repository_impl.dart' as _i779;
import '../domin/repository/auth/auth_repository.dart' as _i369;
import '../domin/use_case/login_use_case.dart' as _i616;
import '../domin/use_case/register_use_case.dart' as _i908;
import '../feature/ui/auth/login/cubit/login_view_model.dart' as _i702;
import '../feature/ui/auth/register/cubit/register_view_model.dart' as _i601;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModules = _$GetItModules();
    gh.singleton<_i361.BaseOptions>(() => getItModules.provideBaseOption());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModules.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModules.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i299.ApiService>(
      () => getItModules.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i1066.AuthRemoteDataSource>(
      () => _i502.AuthRemoteDataSourceImplementation(
        apiService: gh<_i299.ApiService>(),
      ),
    );
    gh.factory<_i369.AuthRepository>(
      () => _i779.AuthRepositoryImplementation(
        authRemoteDataSource: gh<_i1066.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i616.LoginUseCase>(
      () => _i616.LoginUseCase(authRepository: gh<_i369.AuthRepository>()),
    );
    gh.factory<_i908.RegisterUseCase>(
      () => _i908.RegisterUseCase(authRepository: gh<_i369.AuthRepository>()),
    );
    gh.factory<_i702.LoginViewModel>(
      () => _i702.LoginViewModel(loginUseCase: gh<_i616.LoginUseCase>()),
    );
    gh.factory<_i601.RegisterViewModel>(
      () =>
          _i601.RegisterViewModel(registerUseCase: gh<_i908.RegisterUseCase>()),
    );
    return this;
  }
}

class _$GetItModules extends _i866.GetItModules {}
