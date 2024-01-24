import 'dart:convert';

import 'package:agro_hack23/domain/entities/excursion.dart';

class ExcursionModel extends Excursion {
  const ExcursionModel({
    required price,
    required id,
    required maxPersons,
    required name,
    required description,
    required duration,
    required datetime,
    required type,
  }) : super(
          price: price,
          id: id,
          maxPersons: maxPersons,
          name: name,
          description: description,
          duration: duration,
          datetime: datetime,
          type: type,
        );
  factory ExcursionModel.fromRawJson(String str) =>
      ExcursionModel.fromJson(jsonDecode(str));

  String toRawJson() => json.encode(toJson());

  factory ExcursionModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return ExcursionModel(
      price: json["price"],
      id: json["guid"],
      maxPersons: json["max_number_persons"],
      name: json["name"],
      description: json["description"],
      duration: json["duration"],
      datetime: json["datetime"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "price": price,
        "giid": id,
        "max_number_persons": maxPersons,
        "name": name,
        "description": description,
        "duration": duration,
        "datetime": datetime,
        "type": type,
      };
}
