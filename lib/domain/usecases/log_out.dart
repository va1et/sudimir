import 'package:dartz/dartz.dart';
import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';

class LogOut extends UseCase<void, void> {
  final UserRepository userRepository;

  LogOut(this.userRepository);

  @override
  Future<Either<Failure, void>> call([params]) async {
    return await userRepository.logOut();
  }
}
