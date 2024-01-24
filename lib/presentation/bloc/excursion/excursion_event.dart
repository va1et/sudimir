part of 'excursion_bloc.dart';

abstract class ExcursionEvent extends Equatable {
  const ExcursionEvent();

  @override
  List<Object> get props => [];
}

class ExcursionGet extends ExcursionEvent {
  const ExcursionGet();
}

class ExcursionSend extends ExcursionEvent {
  final Map<String, dynamic?> data;
  const ExcursionSend({required this.data});
  @override
  List<Object> get props => [data];
}

class ExcursionRemove extends ExcursionEvent {
  final String id;
  const ExcursionRemove({required this.id});
  @override
  List<Object> get props => [id];
}
