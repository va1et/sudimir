import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class DeleteBooking extends UseCase<void, String> {
  final UserRepository userRepository;

  DeleteBooking(this.userRepository);

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await userRepository.deleteBooking(params);
  }
}
