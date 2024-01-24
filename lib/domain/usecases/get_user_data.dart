import 'package:dartz/dartz.dart';
import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/entities/user.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';

class GetUserData extends UseCase<User, void> {
  final UserRepository userRepository;

  GetUserData(this.userRepository);

  @override
  Future<Either<Failure, User>> call([params]) async {
    return userRepository.getUserData();
  }
}
