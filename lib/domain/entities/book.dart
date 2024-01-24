import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Book extends Equatable {
  final int persons;
  final String guid;
  final String? status;
  // final String? name;
  // final String? surname;
  // final String? lastname;
  // final String? phone;

  const Book({
    required this.persons,
    required this.guid,
    required this.status,
    // required this.name,
    // required this.surname,
    // required this.lastname,
    // required this.phone,
  });

  @override
  List<Object?> get props => [
        persons, guid, status,

        // name, surname, lastname, phone
      ];
}
