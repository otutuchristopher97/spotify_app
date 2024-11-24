part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initDasboad();
}

Future<void> _initDasboad() async {
  sl
    // ..registerLazySingleton(() => Dio())
    ..registerFactory(
      () => DashboardCubit(
        fetchAlbum: sl(),
        fetchArtist: sl(),
      ),
    )
    // Use cases
    ..registerLazySingleton(() => FetchAlbum(sl()))
    ..registerLazySingleton(() => FetchArtist(sl()))

    // Repositories 
    ..registerLazySingleton<DashboardRepo>(
        () => DashboardRepositoryImplementation(sl()))

    // Data source
    ..registerLazySingleton<DashboardRemoteDatasource>(
        () => DashboardRemoteDataSrcImpl(sl()))
      
    // Dependencies
    ..registerLazySingleton(http.Client.new);
}
