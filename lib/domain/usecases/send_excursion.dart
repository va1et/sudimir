import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/data/models/book_modal.dart';
import 'package:agro_hack23/data/models/excursion_modal.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SendExcursion extends UseCase<ExcursionModel, SendExcursionParams> {
  final UserRepository userRepository;

  SendExcursion(this.userRepository);

  @override
  Future<Either<Failure, ExcursionModel>> call(
      SendExcursionParams params) async {
    return userRepository.sendService(params.data);
  }
}

class SendExcursionParams extends Equatable {
  final Map<String, dynamic> data;

  const SendExcursionParams(this.data);

  @override
  List<Object?> get props => [data];
}
