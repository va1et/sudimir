import 'package:agro_hack23/common/errors/failures.dart';

import 'package:agro_hack23/domain/entities/employee.dart';
import 'package:agro_hack23/domain/entities/user.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetEmployees extends UseCase<List<User>, GetEmployeesParams> {
  final UserRepository userRepository;

  GetEmployees(this.userRepository);

  @override
  Future<Either<Failure, List<User>>> call(GetEmployeesParams params) async {
    return await userRepository.getEmployees(params.offset, params.limit);
  }
}

class GetEmployeesParams extends Equatable {
  final int offset;
  final int limit;

  const GetEmployeesParams({
    required this.offset,
    required this.limit,
  });

  @override
  List<Object?> get props => [offset, limit];
}
