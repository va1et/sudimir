import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/entities/book.dart';
import 'package:agro_hack23/domain/entities/employee.dart';
import 'package:agro_hack23/domain/usecases/delete_booking.dart';
import 'package:agro_hack23/domain/usecases/get_auth_token.dart';
import 'package:agro_hack23/domain/usecases/get_bookings.dart';
import 'package:agro_hack23/domain/usecases/send_booking.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooks getBook;
  final GetAuthToken getAuthToken;
  final SendBooking sendBooking;
  final DeleteBooking deleteBooking;

  BookBloc(
      {required this.getBook,
      required this.getAuthToken,
      required this.sendBooking,
      required this.deleteBooking})
      : super(BookStateInitial()) {
    on<BookGet>(_onGetBook);
    on<BookSend>(_bookingSend);
    on<BookRemove>(_bookingDelete);
  }
  static List<Book> booklist = [];
  int _offset = 0;

  void _onGetBook(
    BookGet event,
    Emitter<BookState> emit,
  ) async {
    final res = await getAuthToken();
    if (booklist.isEmpty) {
      emit(BookStateLoading());
    } else if (booklist.isNotEmpty) {
      BookStateLoaded(books: booklist);
    }
    await res.fold((failure) async {
      emit(const BookStateError(
        cause: '',
      ));
    }, (token) async {
      final book =
          await getBook(GetBookingsParams(offset: _offset, limit: 100));
      emit(book.fold(
          (failureRemote) => BookStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) {
        booklist = userFromRemote;
        // _offset += _offset + booklist.length;
        return BookStateLoaded(books: userFromRemote);
      }));
    });
  }

  void _bookingSend(
    BookSend event,
    Emitter<BookState> emit,
  ) async {
    emit(BookStateSent());
    final res = await getAuthToken();

    await res.fold((failure) async {
      emit(const BookStateError(
        cause: '',
      ));
    }, (token) async {
      print(event.data);
      final invoices = await sendBooking(SendBookingParams(event.data));

      await invoices.fold(
          (failureRemote) async => BookStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) async {
        final excursion =
            await getBook(GetBookingsParams(offset: _offset, limit: 100));
        emit(excursion.fold(
            (failureRemote) => BookStateError(
                  cause: _mapFailureToMessage(failureRemote),
                ), (userFromRemote) {
          booklist = userFromRemote;
          // _offset += _offset + excursionlist.length;
          return BookStateLoaded(books: userFromRemote);
        }));
      });
    });
  }

  void _bookingDelete(
    BookRemove event,
    Emitter<BookState> emit,
  ) async {
    BookStateSent();
    final res = await getAuthToken();

    await res.fold((failure) async {
      emit(const BookStateError(
        cause: '',
      ));
    }, (token) async {
      final invoices = await deleteBooking(event.id);

      await invoices.fold(
          (failureRemote) async => BookStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) async {
        final excursion =
            await getBook(GetBookingsParams(offset: _offset, limit: 100));
        emit(excursion.fold(
            (failureRemote) => BookStateError(
                  cause: _mapFailureToMessage(failureRemote),
                ), (userFromRemote) {
          booklist = userFromRemote;
          // _offset += _offset + excursionlist.length;
          return BookStateLoaded(books: booklist);
        }));
      });
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Произошла ошибка при загрузке данных. Пожалуйста, проверьте ваше интернет-соединение';
      case CacheFailure:
        return 'Произошла ошибка при загрузке данных';
      default:
        return 'Unexpected Error';
    }
  }
}
