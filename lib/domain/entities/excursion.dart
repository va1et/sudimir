import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Excursion extends Equatable {
  final int price;
  final int maxPersons;
  final String name;
  final String id;
  final String? description;
  final String? duration;
  final String? datetime;
  final String? type;

  const Excursion({
    required this.price,
    required this.id,
    required this.maxPersons,
    required this.name,
    required this.description,
    required this.duration,
    required this.datetime,
    required this.type,
  });

  @override
  List<Object?> get props => [
        price,
        id,
        maxPersons,
        name,
        description,
        duration,
        datetime,
        type,
      ];
}
