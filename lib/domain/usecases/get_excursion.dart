import 'package:agro_hack23/common/errors/failures.dart';

import 'package:agro_hack23/domain/entities/employee.dart';
import 'package:agro_hack23/domain/entities/excursion.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetExcursion extends UseCase<List<Excursion>, GetExcursionParams> {
  final UserRepository userRepository;

  GetExcursion(this.userRepository);

  @override
  Future<Either<Failure, List<Excursion>>> call(
      GetExcursionParams params) async {
    return await userRepository.getExcursions(params.offset, params.limit);
  }
}

class GetExcursionParams extends Equatable {
  final int offset;
  final int limit;

  const GetExcursionParams({
    required this.offset,
    required this.limit,
  });

  @override
  List<Object?> get props => [offset, limit];
}
