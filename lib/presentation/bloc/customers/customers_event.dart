part of 'customers_bloc.dart';

abstract class CustomersEvent extends Equatable {
  const CustomersEvent();

  @override
  List<Object> get props => [];
}

class CustomersGet extends CustomersEvent {
  const CustomersGet();
}

class CustomersSend extends CustomersEvent {
  final Map<String, String?> data;
  const CustomersSend({required this.data});
  @override
  List<Object> get props => [data];
}
