import 'package:agro_hack23/presentation/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeProvider extends ChangeNotifier {
  ValidationModel _name = ValidationModel(null, null);
  ValidationModel _secondName = ValidationModel(null, null);
  ValidationModel _lastName = ValidationModel(null, null);
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _phone = ValidationModel(null, null);
  ValidationModel _pass = ValidationModel(null, null);

  ValidationModel get name => _name;
  ValidationModel get secondName => _secondName;
  ValidationModel get lastName => _lastName;
  ValidationModel get email => _email;
  ValidationModel get phone => _phone;
  ValidationModel get pass => _pass;

  void disposeValues() {
    _name = ValidationModel(null, null);
    _secondName = ValidationModel(null, null);
    _lastName = ValidationModel(null, null);
    _email = ValidationModel(null, null);
    _phone = ValidationModel(null, null);
    _pass = ValidationModel(null, null);
  }

  void validateName(String? val) {
    if (val!.isNotEmpty) {
      _name = ValidationModel(val, null);
    } else {
      _name = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validateSecondName(String? val) {
    if (val!.isNotEmpty) {
      _secondName = ValidationModel(val, null);
    } else {
      _secondName = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validateLastName(String? val) {
    if (val!.isNotEmpty) {
      _lastName = ValidationModel(val, null);
    } else {
      _lastName = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validateEmail(String? val) {
    if (val!.isNotEmpty) {
      _email = ValidationModel(val, null);
    } else {
      _email = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validatePhone(String? val) {
    if (val!.isNotEmpty) {
      _phone = ValidationModel(val, null);
    } else {
      _phone = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  void validatePass(String? val) {
    if (val!.isNotEmpty) {
      _pass = ValidationModel(val, null);
    } else {
      _pass = ValidationModel(null, "поле не должно быть пустым");
    }
    notifyListeners();
  }

  bool get validate {
    return _name.value != null &&
        _secondName.value != null &&
        _lastName.value != null &&
        _phone.value != null &&
        _email.value != null &&
        _pass.value != null;
  }
}
