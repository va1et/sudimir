part of 'employees_bloc.dart';

abstract class EmployeesEvent extends Equatable {
  const EmployeesEvent();

  @override
  List<Object> get props => [];
}

class EmployeesGet extends EmployeesEvent {
  const EmployeesGet();
}

class EmployeeSend extends EmployeesEvent {
  final Map<String, String?> data;
  const EmployeeSend({required this.data});
  @override
  List<Object> get props => [data];
}

class EmployeeRemove extends EmployeesEvent {
  final String id;
  const EmployeeRemove({required this.id});
  @override
  List<Object> get props => [id];
}
