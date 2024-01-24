import 'dart:math';

import 'package:agro_hack23/common/errors/failures.dart';
import 'package:agro_hack23/domain/entities/employee.dart';
import 'package:agro_hack23/domain/entities/user.dart';
import 'package:agro_hack23/domain/usecases/add_employee.dart';
import 'package:agro_hack23/domain/usecases/delete_employee.dart';
import 'package:agro_hack23/domain/usecases/get_auth_token.dart';
import 'package:agro_hack23/domain/usecases/get_employees.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final GetEmployees getEmployees;
  final GetAuthToken getAuthToken;
  final AddEmployee addEmployee;
  final DeleteEmployee deleteEmployee;

  EmployeesBloc(
      {required this.getEmployees,
      required this.getAuthToken,
      required this.addEmployee,
      required this.deleteEmployee})
      : super(EmployeesStateInitial()) {
    on<EmployeesGet>(_onGetEmployees);
    on<EmployeeSend>(_employeeSend);
    on<EmployeeRemove>(_employeeDelete);
  }
  static List<User> employeeslist = [];
  int _offset = 0;
  void _onGetEmployees(
    EmployeesGet event,
    Emitter<EmployeesState> emit,
  ) async {
    final res = await getAuthToken();
    if (employeeslist.isEmpty) {
      emit(EmployeesStateLoading());
    } else if (employeeslist.isNotEmpty) {
      EmployeesStateLoaded(employees: employeeslist);
    }
    await res.fold((failure) async {
      emit(const EmployeesStateError(
        cause: '',
      ));
    }, (token) async {
      final employees =
          await getEmployees(GetEmployeesParams(offset: _offset, limit: 100));
      emit(employees.fold(
          (failureRemote) => EmployeesStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) {
        employeeslist = userFromRemote;
        // _offset += _offset + employeeslist.length;
        return EmployeesStateLoaded(employees: userFromRemote);
      }));
    });
  }

  void _employeeSend(
    EmployeeSend event,
    Emitter<EmployeesState> emit,
  ) async {
    emit(EmployeesStateSent());
    final res = await getAuthToken();

    await res.fold((failure) async {
      emit(const EmployeesStateError(
        cause: '',
      ));
    }, (token) async {
      final invoices = await addEmployee(AddEmployeeParams(event.data));

      await invoices.fold(
          (failureRemote) async => EmployeesStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) async {
        final excursion =
            await getEmployees(GetEmployeesParams(offset: _offset, limit: 100));
        emit(excursion.fold(
            (failureRemote) => EmployeesStateError(
                  cause: _mapFailureToMessage(failureRemote),
                ), (userFromRemote) {
          employeeslist = userFromRemote;
          // _offset += _offset + excursionlist.length;
          return EmployeesStateLoaded(employees: employeeslist);
        }));
      });
    });
  }

  void _employeeDelete(
    EmployeeRemove event,
    Emitter<EmployeesState> emit,
  ) async {
    emit(EmployeesStateSent());
    final res = await getAuthToken();

    await res.fold((failure) async {
      emit(const EmployeesStateError(
        cause: '',
      ));
    }, (token) async {
      final invoices = await deleteEmployee(event.id);

      await invoices.fold(
          (failureRemote) async => EmployeesStateError(
                cause: _mapFailureToMessage(failureRemote),
              ), (userFromRemote) async {
        final excursion =
            await getEmployees(GetEmployeesParams(offset: _offset, limit: 100));
        emit(excursion.fold(
            (failureRemote) => EmployeesStateError(
                  cause: _mapFailureToMessage(failureRemote),
                ), (userFromRemote) {
          employeeslist = userFromRemote;
          // _offset += _offset + excursionlist.length;
          return EmployeesStateLoaded(employees: employeeslist);
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
