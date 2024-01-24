import 'package:equatable/equatable.dart';

class Business extends Equatable {
  final List<String> classification;
  final List<String> type;
  final String name;
  final String adress;

  const Business({
    required this.classification,
    required this.type,
    required this.name,
    required this.adress,
  });

  @override
  List<Object?> get props => [classification, type, name, adress];
}
