import 'package:agro_hack23/domain/usecases/add_employee.dart';
import 'package:agro_hack23/domain/usecases/delete_booking.dart';
import 'package:agro_hack23/domain/usecases/delete_employee.dart';
import 'package:agro_hack23/domain/usecases/delete_excursion.dart';
import 'package:agro_hack23/domain/usecases/get_bookings.dart';
import 'package:agro_hack23/domain/usecases/get_employees.dart';
import 'package:agro_hack23/domain/usecases/get_excursion.dart';
import 'package:agro_hack23/domain/usecases/get_users.dart';
import 'package:agro_hack23/domain/usecases/send_booking.dart';
import 'package:agro_hack23/domain/usecases/send_excursion.dart';
import 'package:agro_hack23/presentation/bloc/book/book_bloc.dart';
import 'package:agro_hack23/presentation/bloc/customers/customers_bloc.dart';
import 'package:agro_hack23/presentation/bloc/employees/employees_bloc.dart';
import 'package:agro_hack23/presentation/bloc/excursion/excursion_bloc.dart';
import 'package:agro_hack23/presentation/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:agro_hack23/data/datasources/user_local.dart';
import 'package:agro_hack23/data/datasources/user_remote.dart';
import 'package:agro_hack23/data/repositories/user_repository_impl.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/get_auth_token.dart';
import 'package:agro_hack23/domain/usecases/get_user_data.dart';
import 'package:agro_hack23/domain/usecases/log_in.dart';
import 'package:agro_hack23/domain/usecases/log_out.dart';
import 'package:agro_hack23/domain/usecases/sign_up.dart';
import 'package:agro_hack23/presentation/bloc/user/user_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerFactory(() => UserBloc(
        logOut: getIt(),
        logIn: getIt(),
        registration: getIt(),
        getAuthToken: getIt(),
        getUserData: getIt(),
      ));
  getIt.registerFactory(() => BookBloc(
        getAuthToken: getIt(),
        getBook: getIt(),
        sendBooking: getIt(),
        deleteBooking: getIt(),
      ));
  getIt.registerFactory(() => ExcursionBloc(
        getAuthToken: getIt(),
        getExcursion: getIt(),
        sendExcursion: getIt(),
        deleteExcursion: getIt(),
      ));
  getIt.registerFactory(() => EmployeesBloc(
        getAuthToken: getIt(),
        getEmployees: getIt(),
        addEmployee: getIt(),
        deleteEmployee: getIt(),
      ));
  getIt.registerFactory(() => CustomersBloc(
        getAuthToken: getIt(),
        getCustomers: getIt(),
      ));

  getIt.registerLazySingleton(() => LogIn(getIt()));
  getIt.registerLazySingleton(() => LogOut(getIt()));
  getIt.registerLazySingleton(() => GetAuthToken(getIt()));
  getIt.registerLazySingleton(() => GetUserData(getIt()));
  getIt.registerLazySingleton(() => GetBooks(getIt()));
  getIt.registerLazySingleton(() => GetExcursion(getIt()));
  getIt.registerLazySingleton(() => GetEmployees(getIt()));
  getIt.registerLazySingleton(() => GetUsers(getIt()));
  getIt.registerLazySingleton(() => AddEmployee(getIt()));
  getIt.registerLazySingleton(() => DeleteEmployee(getIt()));
  getIt.registerLazySingleton(() => SignUp(getIt()));
  getIt.registerLazySingleton(() => SendBooking(getIt()));
  getIt.registerLazySingleton(() => SendExcursion(getIt()));
  getIt.registerLazySingleton(() => DeleteBooking(getIt()));
  getIt.registerLazySingleton(() => DeleteExcursion(getIt()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      connectionChecker: getIt()));
  getIt.registerLazySingleton<UserLocalData>(() =>
      UserLocalDataImpl(sharedPreferences: getIt(), securedStorage: getIt()));
  getIt.registerLazySingleton<UserRemoteData>(
      () => UserRemoteDataImpl(httpClient: getIt()));

  getIt.registerLazySingleton(() => Dio(BaseOptions(
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20))));
  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => secureStorage);

  getIt.registerLazySingleton(() => InternetConnectionChecker());
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  getIt.registerLazySingleton(() => packageInfo);

  getIt.registerLazySingleton(() => createRouter());
}
