import 'package:equatable/equatable.dart';
import 'package:agro_hack23/domain/entities/business.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final String? lastName;
  final String? secondName;
  final String? email;
  final String? phone;
  final String? role;

  // final List<Business> business;

  const User({
    this.id,
    required this.name,
    required this.lastName,
    required this.secondName,
    required this.email,
    required this.phone,
    required this.role,
  });

  @override
  List<Object?> get props =>
      [id, name, lastName, secondName, email, phone, role];
}
