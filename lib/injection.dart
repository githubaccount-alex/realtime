import 'package:get_it/get_it.dart';
import 'package:realtime/03_domain/repositories/time_repository.dart';
import 'package:realtime/04_infrastructure/datasources/time_remote_datasource.dart';
import 'package:realtime/04_infrastructure/repositories/time_repository_impl.dart';
import 'package:http/http.dart' as http;

import '02_application/time_bloc/time_bloc.dart';
import '03_domain/usecases/time_usecases.dart';

final sl = GetIt.I; // service Locator

Future<void> init() async {
  //? ################ time ##################
  // application layer
  sl.registerFactory(() => TimeBloc(timeUsecases: sl()));

  // Usecases
  sl.registerLazySingleton(() => TimeUsecases(timeRepository: sl()));

  // repos
  sl.registerLazySingleton<TimeRepository>(() => TimeRepositoryImpl(timeRemoteDatasource: sl()));

  // datasources
  sl.registerLazySingleton<TimeRemoteDatasource>(() => TimeRemoteDatasourceImpl(client: sl()));

  // extern
  sl.registerLazySingleton(() => http.Client());

}