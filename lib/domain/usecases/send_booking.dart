import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/data/models/book_modal.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SendBooking extends UseCase<BookModel, SendBookingParams> {
  final UserRepository userRepository;

  SendBooking(this.userRepository);

  @override
  Future<Either<Failure, BookModel>> call(SendBookingParams params) async {
    return userRepository.sendBooking(params.data);
  }
}

class SendBookingParams extends Equatable {
  final Map<String, dynamic> data;

  const SendBookingParams(this.data);

  @override
  List<Object?> get props => [data];
}
