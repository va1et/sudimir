import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/entities/excursion.dart';
import 'package:agro_hack23/domain/entities/employee.dart';
import 'package:agro_hack23/domain/usecases/delete_excursion.dart';
import 'package:agro_hack23/domain/usecases/get_auth_token.dart';
import 'package:agro_hack23/domain/usecases/get_excursion.dart';
import 'package:agro_hack23/domain/usecases/send_excursion.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'excursion_event.dart';
part 'excursion_state.dart';

class ExcursionBloc extends Bloc<ExcursionEvent, ExcursionState> {
  final GetExcursion getExcursion;
  final GetAuthToken getAuthToken;
  final SendExcursion sendExcursion;
  final DeleteExcursion deleteExcursion;

  ExcursionBloc(
      {required this.getExcursion,
      required this.getAuthToken,
      required this.sendExcursion,
      required this.deleteExcursion})
      : super(ExcursionStateInitial()) {
    on<ExcursionGet>(_onGetExcursion);
    on<ExcursionSend>(_excursionSend);
    on<ExcursionRemove>(_excursionRemove);
  }
  static List<Excursion> excursionlist = [];
  int _offset = 0;
  void _onGetExcursion(
    ExcursionGet event,
    Emitter<ExcursionState> emit,
  ) async {
    final res = await getAuthToken();
    if (excursionlist.isEmpty) {
      emit(ExcursionStateLoading());
    } else if (excursionlist.isNotEmpty) {
      ExcursionStateLoaded(excursions: excursionlist);
    }
    await res.fold((failure) async {
      emit(const ExcursionStateError(
        cause: '',
      ));
    }, (token) async {
      final excursion =
          await getExcursion(GetExcursionParams(offset: _offset, limit: 100));
      emit(excursion.fold(
          (failureRemote) => ExcursionStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) {
        excursionlist = userFromRemote;
        // _offset += _offset + excursionlist.length;
        return ExcursionStateLoaded(excursions: userFromRemote);
      }));
    });
  }

  void _excursionSend(
    ExcursionSend event,
    Emitter<ExcursionState> emit,
  ) async {
    emit(ExcursionStateSent());
    final res = await getAuthToken();

    await res.fold((failure) async {
      emit(const ExcursionStateError(
        cause: '',
      ));
    }, (token) async {
      final invoices = await sendExcursion(SendExcursionParams(event.data));

      await invoices.fold(
          (failureRemote) async => ExcursionStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) async {
        final excursion =
            await getExcursion(GetExcursionParams(offset: _offset, limit: 100));
        emit(excursion.fold(
            (failureRemote) => ExcursionStateError(
                  cause: _mapFailureToMessage(failureRemote),
                ), (userFromRemote) {
          excursionlist = userFromRemote;
          // _offset += _offset + excursionlist.length;
          return ExcursionStateLoaded(excursions: userFromRemote);
        }));
      });
    });
  }

  void _excursionRemove(
    ExcursionRemove event,
    Emitter<ExcursionState> emit,
  ) async {
    ExcursionStateSent();
    final res = await getAuthToken();

    await res.fold((failure) async {
      emit(const ExcursionStateError(
        cause: '',
      ));
    }, (token) async {
      final invoices = await deleteExcursion(event.id);

      await invoices.fold(
          (failureRemote) async => ExcursionStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) async {
        final excursion =
            await getExcursion(GetExcursionParams(offset: _offset, limit: 100));
        emit(excursion.fold(
            (failureRemote) => ExcursionStateError(
                  cause: _mapFailureToMessage(failureRemote),
                ), (userFromRemote) {
          excursionlist = userFromRemote;
          // _offset += _offset + excursionlist.length;
          return ExcursionStateLoaded(excursions: userFromRemote);
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
