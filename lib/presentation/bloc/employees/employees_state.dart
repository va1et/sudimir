part of 'employees_bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();

  @override
  List<Object> get props => [];
}

class EmployeesStateInitial extends EmployeesState {}

class EmployeesStateLoading extends EmployeesState {}

class EmployeesStateError extends EmployeesState {
  final String cause;

  const EmployeesStateError({required this.cause});

  @override
  List<Object> get props => [cause];
}

class EmployeesStateLoaded extends EmployeesState {
  final List<User> employees;

  const EmployeesStateLoaded({required this.employees});

  @override
  List<Object> get props => [employees];
}

class EmployeesStateSent extends EmployeesState {}

class EmployeesStateDelete extends EmployeesState {}
