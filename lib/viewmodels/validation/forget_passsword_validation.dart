import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/models/validation/validation_model.dart';

class ForgetPasswordValidationViewModel with ChangeNotifier {
  ValidationModel _email = ValidationModel(null, null);

  //Getters
  ValidationModel get email => _email;

  bool get isValid {
    if (_email.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeEmail(String value) {
    if (value.isEmpty) {
      _email = ValidationModel(null, "Email must be provided");
    } else {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        _email = ValidationModel(value, null);
      } else {
        _email = ValidationModel(null, "Enter valid email address");
      }
    }
    notifyListeners();
  }
}
