import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';

class LogIn extends UseCase<String, LogInParams> {
  final UserRepository userRepository;

  LogIn(this.userRepository);

  @override
  Future<Either<Failure, String>> call(LogInParams params) async {
    return await userRepository.logIn(params.login, params.password);
  }
}

class LogInParams extends Equatable {
  final String login;
  final String password;

  const LogInParams(this.login, this.password);

  @override
  List<Object?> get props => [login, password];
}
