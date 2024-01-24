import 'package:agro_hack23/presentation/provider/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ValidationModel {
  String? value;
  String? error;

  ValidationModel(this.value, this.error);
}

class BookProvider extends ChangeNotifier {
  ValidationModel _persons = ValidationModel(null, null);
  ValidationModel _phone = ValidationModel(null, null);
  // ValidationModel _date = ValidationModel(null, null);
  // ValidationModel _time = ValidationModel(null, null);

  ValidationModel get persons => _persons;
  ValidationModel get phone => _phone;
  // ValidationModel get date => _date;

  // ValidationModel get time => _time;

  void disposeValues() {
    _persons = ValidationModel(null, null);
    _phone = ValidationModel(null, null);
    // _date = ValidationModel(null, null);

    // _time = ValidationModel(null, null);
  }

  void validatePerson(String? val) {
    if (val!.isNotEmpty) {
      _persons = ValidationModel(val, null);
    } else {
      _persons = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validatePhone(String? val) {
    if (val!.isNotEmpty) {
      if (val.length == 18) {
        if (val.isValidPhone) {
          _phone = ValidationModel(val, null);
        } else {
          _phone = ValidationModel(
            null,
            'неправильный формат телефона',
          );
        }
      } else {
        _phone = ValidationModel(
          null,
          'неправильный формат телефона',
        );
      }
    } else if (val.isEmpty) {
      _phone = ValidationModel(null, 'введите телефон');
    }
    notifyListeners();
  }

  // void validateDate(String? val) {
  //   if (val!.isNotEmpty) {
  //     if (val.length == 10) {
  //       if (val.isValidDate) {
  //         _date = ValidationModel(val, null);
  //       } else {
  //         _date = ValidationModel(null, 'неправильный формат даты');
  //       }
  //     }
  //   } else if (val.isEmpty) {
  //     _date = ValidationModel(null, 'дата не должна быть пустой');
  //   }
  //   notifyListeners();
  // }

  // void validateTime(String? val) {
  //   if (val!.isNotEmpty) {
  //     if (val.length == 5) {
  //       if (val.isValidTime) {
  //         _time = ValidationModel(val, null);
  //       } else {
  //         _time = ValidationModel(null, 'неправильный формат времени');
  //       }
  //     }
  //   } else if (val.isEmpty) {
  //     _time = ValidationModel(
  //       null,
  //       'время не должно быть пустым',
  //     );
  //   }
  //   notifyListeners();
  // }

  bool get validate {
    return _persons.value != null && _phone.value != null;
    // _date.value != null &&
    // _time.value != null;
  }
}
