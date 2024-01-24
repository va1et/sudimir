import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';

class SignUp extends UseCase<String, SignUpParams> {
  final UserRepository userRepository;

  SignUp(this.userRepository);

  @override
  Future<Either<Failure, String>> call(SignUpParams params) async {
    return await userRepository.registration(params.login, params.password,
        params.phone, params.name, params.secondname, params.lastname);
  }
}

class SignUpParams extends Equatable {
  final String login;
  final String password;
  final String phone;
  final String name;
  final String secondname;
  final String lastname;

  const SignUpParams(this.login, this.password, this.name, this.phone,
      this.secondname, this.lastname);

  @override
  List<Object?> get props =>
      [login, password, phone, name, secondname, lastname];
}
