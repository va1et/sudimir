part of 'excursion_bloc.dart';

abstract class ExcursionState extends Equatable {
  const ExcursionState();

  @override
  List<Object> get props => [];
}

class ExcursionStateInitial extends ExcursionState {}

class ExcursionStateLoading extends ExcursionState {}

class ExcursionStateError extends ExcursionState {
  final String cause;

  const ExcursionStateError({required this.cause});

  @override
  List<Object> get props => [cause];
}

class ExcursionStateLoaded extends ExcursionState {
  final List<Excursion> excursions;

  const ExcursionStateLoaded({required this.excursions});

  @override
  List<Object> get props => [excursions];
}

class ExcursionStateSent extends ExcursionState {}

class ExcursionStateDelete extends ExcursionState {}
