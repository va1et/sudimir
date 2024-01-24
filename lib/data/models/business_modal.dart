import 'dart:convert';

import 'package:agro_hack23/domain/entities/business.dart';

class BusinessModel extends Business {
  const BusinessModel({
    required classification,
    required type,
    required name,
    required adress,
  }) : super(
          classification: classification,
          type: type,
          name: name,
          adress: adress,
        );

  factory BusinessModel.fromRawJson(String str) =>
      BusinessModel.fromJson(json.decode(str));

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      name: json["arUser"]["LOGIN"],
      adress: json["arUser"]["EMAIL"],
      classification: json["arUser"]["NAME"],
      type: json["arUser"]["LAST_NAME"],
    );
  }
}
