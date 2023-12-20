import 'package:chat_gpt/features/auth/data/datasources/local_datasource/local_datasource.dart';
import 'package:chat_gpt/features/auth/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:chat_gpt/features/auth/data/repositories/auth_repo.dart';
import 'package:chat_gpt/features/auth/domain/repositories/base_repo.dart';
import 'package:chat_gpt/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:chat_gpt/features/auth/domain/usecases/signout_usecase.dart';
import 'package:chat_gpt/features/auth/domain/usecases/signup_usecase.dart';
import 'package:chat_gpt/features/auth/domain/usecases/stream_user_usecase.dart';
import 'package:chat_gpt/features/auth/presentation/cubit/login_cubit.dart/login_cubit.dart';
import 'package:chat_gpt/features/auth/presentation/cubit/signup_cubit.dart/signup_cubit.dart';
import 'package:chat_gpt/features/chat/presentation/cubit/settings_cubit/settings_cubit.dart';
// import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //* Features - Auth
  // Bloc
  _blocs();

  // Use cases
  _useCases();

  // Repository
  _repositories();

  // Data sources
  _dataSources();

  // External
  _external();
}

//SECTION - Blocs
_blocs() {
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => SignupCubit(sl()));
  // sl.registerFactory(() => ChatCubit(sl()));
  sl.registerFactory(() => SettingsCubit(sl()));
}

//SECTION - Use cases
_useCases() {
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => StreamAuthUserUseCase(sl()));
  // sl.registerLazySingleton(() => ChatUsecase(sl()));
}

//SECTION - Repositories
_repositories() {
  sl.registerLazySingleton<AuthBaseRepo>(() => AuthRepositoryImpl(sl(), sl()));
  // sl.registerLazySingleton<ChatBaseRepo>(() => ChatRepoImpl(sl()));
  // sl.registerLazySingleton<ChatLocalDatabase>(() => ChatLocalDbImpl());
}

//SECTION - Data sources
_dataSources() {
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceFirebase());
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());
  // sl.registerLazySingleton<ChatBaseRemoteDataSource>(
  //     () => ChatRemoteDataSourceImpl());
}

//SECTION - External
_external() async {
  // final sharedPreferences = SharedPrefsHelper.init();
  // sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
