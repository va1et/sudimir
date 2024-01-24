import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/entities/employee.dart';
import 'package:agro_hack23/domain/entities/user.dart';
import 'package:agro_hack23/domain/usecases/get_auth_token.dart';
import 'package:agro_hack23/domain/usecases/get_users.dart';

import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customers_event.dart';
part 'customers_state.dart';

class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  final GetUsers getCustomers;
  final GetAuthToken getAuthToken;

  CustomersBloc({
    required this.getCustomers,
    required this.getAuthToken,
  }) : super(CustomersStateInitial()) {
    on<CustomersGet>(_onGetCustomers);
  }
  static List<User> customerslist = [];
  int _offset = 0;
  void _onGetCustomers(
    CustomersGet event,
    Emitter<CustomersState> emit,
  ) async {
    final res = await getAuthToken();
    if (customerslist.isEmpty) {
      emit(CustomersStateLoading());
    } else if (customerslist.isNotEmpty) {
      CustomersStateLoaded(customers: customerslist);
    }
    await res.fold((failure) async {
      emit(const CustomersStateError(
        cause: '',
      ));
    }, (token) async {
      final customers =
          await getCustomers(GetUsersParams(offset: _offset, limit: 100));
      emit(customers.fold(
          (failureRemote) => CustomersStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) {
        customerslist = userFromRemote;
        // _offset += _offset + customerslist.length;
        return CustomersStateLoaded(customers: userFromRemote);
      }));
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
