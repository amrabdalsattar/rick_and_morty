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
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../features/characters/data/data_sources/characters_data_source.dart'
    as _i356;
import '../../features/characters/data/repositories/characters_repository.dart'
    as _i486;
import '../../features/characters/logic/cubit/characters_cubit.dart' as _i57;
import '../networking/api_factory.dart' as _i269;
import '../networking/dio_factory.dart' as _i103;
import 'package_module.dart' as _i611;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final packageModule = _$PackageModule();
    gh.factory<_i361.Dio>(() => packageModule.getDio());
    gh.factory<_i973.InternetConnectionChecker>(
        () => packageModule.getInternetConnectionChecker());
    gh.factory<_i269.ApiFactory>(() => _i103.DioFactory(dio: gh<_i361.Dio>()));
    gh.factory<_i356.CharactersDataSource>(
        () => _i356.CharactersDataSource(gh<_i269.ApiFactory>()));
    gh.factory<_i486.CharactersRepository>(() => _i486.CharactersRepository(
          connectionChecker: gh<_i973.InternetConnectionChecker>(),
          dataSource: gh<_i356.CharactersDataSource>(),
        ));
    gh.factory<_i57.CharactersCubit>(
        () => _i57.CharactersCubit(repo: gh<_i486.CharactersRepository>()));
    return this;
  }
}

class _$PackageModule extends _i611.PackageModule {}
