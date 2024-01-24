import 'package:dartz/dartz.dart';
import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';

class GetAuthToken extends UseCase<String, void> {
  final UserRepository userRepository;

  GetAuthToken(this.userRepository);

  @override
  Future<Either<Failure, String>> call([params]) async {
    return await userRepository.getAuthToken();
  }
}
