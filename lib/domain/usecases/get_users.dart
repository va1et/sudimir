import 'package:agro_hack23/common/errors/failures.dart';

import 'package:agro_hack23/domain/entities/employee.dart';
import 'package:agro_hack23/domain/entities/user.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetUsers extends UseCase<List<User>, GetUsersParams> {
  final UserRepository userRepository;

  GetUsers(this.userRepository);

  @override
  Future<Either<Failure, List<User>>> call(GetUsersParams params) async {
    return await userRepository.getUsers(params.offset, params.limit);
  }
}

class GetUsersParams extends Equatable {
  final int offset;
  final int limit;

  const GetUsersParams({
    required this.offset,
    required this.limit,
  });

  @override
  List<Object?> get props => [offset, limit];
}
