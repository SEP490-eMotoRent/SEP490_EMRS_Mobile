import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';
import '../utils/logger.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => AppLogger());

  // Example registration of feature repositories or usecases later:
  // sl.registerFactory(() => GetAccountUseCase(sl()));
  // sl.registerLazySingleton<AccountRepository>(() => AccountRepositoryImpl(sl()));
}
