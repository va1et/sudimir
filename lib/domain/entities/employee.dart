import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class EmployeesValues extends Equatable {
  const EmployeesValues({
    required this.employees,
  });

  final List<Employee> employees;

  @override
  List<Object?> get props => [employees];
}

class Employee extends Equatable {
  final String name;
  final String surname;
  final String? lastname;
  final String? role;

  final String? phone;
  const Employee({
    required this.name,
    required this.surname,
    required this.lastname,
    required this.role,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        name,
        surname,
        lastname,
        role,
        phone,
      ];
}
