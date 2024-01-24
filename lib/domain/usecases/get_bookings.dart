import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/entities/book.dart';
import 'package:agro_hack23/domain/repositories/user_repository.dart';
import 'package:agro_hack23/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetBooks extends UseCase<List<Book>, GetBookingsParams> {
  final UserRepository userRepository;

  GetBooks(this.userRepository);

  @override
  Future<Either<Failure, List<Book>>> call(GetBookingsParams params) async {
    return await userRepository.getBooks(params.offset, params.limit);
  }
}

class GetBookingsParams extends Equatable {
  final int offset;
  final int limit;

  const GetBookingsParams({
    required this.offset,
    required this.limit,
  });

  @override
  List<Object?> get props => [offset, limit];
}
