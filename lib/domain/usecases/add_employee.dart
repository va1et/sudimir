import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/data/models/book_modal.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddEmployee extends UseCase<void, AddEmployeeParams> {
  final UserRepository userRepository;

  AddEmployee(this.userRepository);

  @override
  Future<Either<Failure, void>> call(AddEmployeeParams params) async {
    return userRepository.addEmployee(params.data);
  }
}

class AddEmployeeParams extends Equatable {
  final Map<String, dynamic> data;

  const AddEmployeeParams(this.data);

  @override
  List<Object?> get props => [data];
}
