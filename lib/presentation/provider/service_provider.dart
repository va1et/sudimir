import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ValidationModel {
  String? value;
  String? error;

  ValidationModel(this.value, this.error);
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(
        r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(
        r'^[\+][0-9][\s][(][0-9]{3}[)][\s][0-9]{3}[-][0-9]{2}[-][0-9]{2}$');
    // r'^(\+7|7|8)?[\s\-]?\(?[489][0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$');
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidDate {
    final phoneRegExp = RegExp(
        r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{4})$');
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidTime {
    final phoneRegExp = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
    return phoneRegExp.hasMatch(this);
  }
}

class ServiceProvider extends ChangeNotifier {
  ValidationModel _name = ValidationModel(null, null);
  ValidationModel _description = ValidationModel(null, null);
  ValidationModel _price = ValidationModel(null, null);
  ValidationModel _duration = ValidationModel(null, null);
  ValidationModel _datetime = ValidationModel(null, null);
  ValidationModel _time = ValidationModel(null, null);
  ValidationModel _persons = ValidationModel(null, null);

  ValidationModel get name => _name;
  ValidationModel get description => _description;
  ValidationModel get price => _price;
  ValidationModel get duration => _duration;
  ValidationModel get datetime => _datetime;
  ValidationModel get time => _time;
  ValidationModel get persons => _persons;

  void disposeValues() {
    _name = ValidationModel(null, null);
    _description = ValidationModel(null, null);
    _price = ValidationModel(null, null);
    _duration = ValidationModel(null, null);
    _datetime = ValidationModel(null, null);
    _time = ValidationModel(null, null);
    _persons = ValidationModel(null, null);
  }

  void validateName(String? val) {
    if (val!.isNotEmpty) {
      _name = ValidationModel(val, null);
    } else {
      _name = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validateDescription(String? val) {
    if (val!.isNotEmpty) {
      _description = ValidationModel(val, null);
    } else {
      _description = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validatePrice(String? val) {
    if (val!.isNotEmpty) {
      _price = ValidationModel(val, null);
    } else {
      _price = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validateDuration(String? val) {
    if (val!.isNotEmpty) {
      _duration = ValidationModel(val, null);
    } else {
      _duration = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validateTime(String? val) {
    if (val!.isNotEmpty) {
      if (val.length == 5) {
        if (val.isValidTime) {
          _time = ValidationModel(val, null);
        } else {
          _time = ValidationModel(null, "неправильный формат времени");
        }
      }
    } else if (val.isEmpty) {
      _time = ValidationModel(null, "время не должно быть пустым");
    }
    notifyListeners();
  }

  void validateDate(String? val) {
    if (val!.isNotEmpty) {
      if (val.length == 10) {
        if (val.isValidDate) {
          _datetime = ValidationModel(
            val,
            null,
          );
        } else {
          _datetime = ValidationModel(null, "неправильный формат даты");
        }
      }
    } else if (val.isEmpty) {
      _datetime = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validatePersons(String? val) {
    if (val!.isNotEmpty) {
      _persons = ValidationModel(val, null);
    } else {
      _persons = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  bool get validate {
    return _name.value != null &&
        _description.value != null &&
        _price.value != null &&
        _duration.value != null &&
        _datetime.value != null &&
        _persons.value != null;
  }
}
