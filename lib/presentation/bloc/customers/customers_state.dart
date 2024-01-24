part of 'customers_bloc.dart';

abstract class CustomersState extends Equatable {
  const CustomersState();

  @override
  List<Object> get props => [];
}

class CustomersStateInitial extends CustomersState {}

class CustomersStateLoading extends CustomersState {}

class CustomersStateError extends CustomersState {
  final String cause;

  const CustomersStateError({required this.cause});

  @override
  List<Object> get props => [cause];
}

class CustomersStateLoaded extends CustomersState {
  final List<User> customers;

  const CustomersStateLoaded({required this.customers});

  @override
  List<Object> get props => [customers];
}
