part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookStateInitial extends BookState {}

class BookStateLoading extends BookState {}

class BookStateError extends BookState {
  final String cause;

  const BookStateError({required this.cause});

  @override
  List<Object> get props => [cause];
}

class BookStateLoaded extends BookState {
  final List<Book> books;

  const BookStateLoaded({required this.books});

  @override
  List<Object> get props => [books];
}

class BookStateSent extends BookState {}

class BookStateDelete extends BookState {}
