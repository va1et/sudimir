part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class BookGet extends BookEvent {
  const BookGet();
}

class BookSend extends BookEvent {
  final Map<String, dynamic> data;
  const BookSend({required this.data});
  @override
  List<Object> get props => [data];
}

class BookRemove extends BookEvent {
  final String id;
  const BookRemove({required this.id});
  @override
  List<Object> get props => [id];
}
