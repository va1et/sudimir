import 'dart:convert';

import 'package:agro_hack23/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required persons,
    required guid,
    required status,
  }) : super(
          persons: persons,
          guid: guid,
          status: status,
        );
  factory BookModel.fromRawJson(String str) =>
      BookModel.fromJson(jsonDecode(str));

  String toRawJson() => json.encode(toJson());

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      persons: json["number_persons"],
      guid: json["guid"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "status": status,
        "number_persons": persons,
      };
}
