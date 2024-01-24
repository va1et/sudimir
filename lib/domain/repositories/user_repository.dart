import 'package:agro_hack23/data/models/book_modal.dart';
import 'package:agro_hack23/data/models/excursion_modal.dart';
import 'package:agro_hack23/domain/entities/book.dart';
import 'package:agro_hack23/domain/entities/employee.dart';
import 'package:agro_hack23/domain/entities/excursion.dart';
import 'package:dartz/dartz.dart';
import 'package:agro_hack23/domain/entities/user.dart';

import '../../common/errors/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> logIn(String login, String password);
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, String>> registration(String login, String password,
      String phone, String name, String secondname, String lastname);
  Future<Either<Failure, User>> getUserData();
  Future<Either<Failure, List<Book>>> getBooks(
    int offset,
    int limit,
  );
  Future<Either<Failure, BookModel>> sendBooking(Map<String, dynamic> data);
  Future<Either<Failure, ExcursionModel>> sendService(
      Map<String, dynamic> data);
  Future<Either<Failure, void>> addEmployee(Map<String, dynamic> data);
  Future<Either<Failure, List<User>>> getEmployees(
    int offset,
    int limit,
  );
  Future<Either<Failure, List<User>>> getUsers(
    int offset,
    int limit,
  );
  Future<Either<Failure, List<Excursion>>> getExcursions(
    int offset,
    int limit,
  );
  Future<Either<Failure, void>> deleteBooking(String id);
  Future<Either<Failure, void>> deleteExcursion(String id);
  Future<Either<Failure, void>> deleteEmployee(String id);

  ///Cached
  Future<Either<Failure, String>> getAuthToken();
}
