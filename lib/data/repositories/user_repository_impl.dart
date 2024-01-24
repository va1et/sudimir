import 'package:agro_hack23/data/models/book_modal.dart';
import 'package:agro_hack23/data/models/excursion_modal.dart';
import 'package:agro_hack23/domain/entities/book.dart';
import 'package:agro_hack23/domain/entities/employee.dart';
import 'package:agro_hack23/domain/entities/excursion.dart';
import 'package:dartz/dartz.dart';
import 'package:agro_hack23/common/errors/exceptions.dart';
import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/data/datasources/user_local.dart';
import 'package:agro_hack23/data/datasources/user_remote.dart';
import 'package:agro_hack23/domain/entities/user.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteData remoteDataSource;
  final UserLocalData localDataSource;
  final InternetConnectionChecker connectionChecker;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectionChecker,
  });
  @override
  Future<Either<Failure, String>> logIn(String login, String password) async {
    if (await connectionChecker.hasConnection) {
      try {
        final authToken = await remoteDataSource.auth(login, password);

        localDataSource.setTokenToCache(authToken);
        return Right(authToken);
      } catch (e) {
        if (e is ServerException) {
          return Left(ServerFailure(e.cause));
        }
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure("Отсутсвует соединение с интернетом"));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      return Right(await localDataSource.removeTokenFromCache());
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUserData() async {
    try {
      final authToken = await localDataSource.getTokenFromCache();
      final user = await remoteDataSource.getProfileData(authToken);
      print(user);
      return Right(user);
    } on ServerException {
      await localDataSource.removeTokenFromCache();

      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getAuthToken() async {
    try {
      final token = await localDataSource.getTokenFromCache();
      return Future.value(Right(token));
    } on CacheException {
      return Future.value(const Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, String>> registration(String login, String password,
      String phone, String name, String secondname, String lastname) async {
    if (await connectionChecker.hasConnection) {
      try {
        final authToken = await remoteDataSource.signupUser(
            login, password, name, secondname, lastname, phone);
        localDataSource.setTokenToCache(authToken);
        return Right(authToken);
      } catch (e) {
        if (e is ServerException) {
          return Left(ServerFailure(e.cause));
        }
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure("Отсутсвует соединение с интернетом"));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getBooks(int offset, int limit) async {
    if (await connectionChecker.hasConnection) {
      try {
        final authToken = await localDataSource.getTokenFromCache();
        final booksList =
            await remoteDataSource.getBookings(offset, limit, authToken);
        return Right(booksList);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getEmployees(
      int offset, int limit) async {
    if (await connectionChecker.hasConnection) {
      try {
        final authToken = await localDataSource.getTokenFromCache();
        final usersList =
            await remoteDataSource.getEmployees(offset, limit, authToken);
        return Right(usersList);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Excursion>>> getExcursions(
      int offset, int limit) async {
    if (await connectionChecker.hasConnection) {
      try {
        final authToken = await localDataSource.getTokenFromCache();
        final servicesList =
            await remoteDataSource.getServices(offset, limit, authToken);
        return Right(servicesList);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BookModel>> sendBooking(
      Map<String, dynamic> data) async {
    try {
      final authToken = await localDataSource.getTokenFromCache();
      final BookModel model =
          await remoteDataSource.sendBooking(data, authToken);

      return Right(model);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ExcursionModel>> sendService(
      Map<String, dynamic> data) async {
    try {
      final authToken = await localDataSource.getTokenFromCache();
      final ExcursionModel model =
          await remoteDataSource.sendService(data, authToken);

      return Right(model);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers(int offset, int limit) async {
    if (await connectionChecker.hasConnection) {
      try {
        final authToken = await localDataSource.getTokenFromCache();
        final usersList =
            await remoteDataSource.getUsers(offset, limit, authToken);
        return Right(usersList);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteBooking(String id) async {
    if (await connectionChecker.hasConnection) {
      try {
        final authToken = await localDataSource.getTokenFromCache();
        await remoteDataSource.deleteBooking(id, authToken);
        return const Right(null);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteExcursion(String id) async {
    if (await connectionChecker.hasConnection) {
      try {
        final authToken = await localDataSource.getTokenFromCache();
        await remoteDataSource.deleteService(id, authToken);
        return const Right(null);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addEmployee(Map<String, dynamic> data) async {
    try {
      final authToken = await localDataSource.getTokenFromCache();

      await remoteDataSource.addEmployee(data, authToken);

      return Right(null);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteEmployee(String id) async {
    if (await connectionChecker.hasConnection) {
      try {
        final authToken = await localDataSource.getTokenFromCache();
        await remoteDataSource.deleteEmployee(id, authToken);
        return const Right(null);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }
}
