import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/models/validation/validation_model.dart';

class SignupValidationViewModel with ChangeNotifier {
  ValidationModel _firstName = ValidationModel(null, null);
  ValidationModel _lastName = ValidationModel(null, null);
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);
  ValidationModel _role = ValidationModel(null, null);

  //Getters
  ValidationModel get firstName => _firstName;
  ValidationModel get lastName => _lastName;
  ValidationModel get email => _email;
  ValidationModel get password => _password;
  ValidationModel get role => _role;

  bool get isValid {
    if (_lastName.value != null &&
        _firstName.value != null &&
        _email.value != null &&
        _password.value != null &&
        _role.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeFirstName(String value) {
    if (value.isEmpty) {
      _firstName = ValidationModel(null, "First name must be provided");
    } else {
      _firstName = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeLastName(String value) {
    if (value.isEmpty) {
      _lastName = ValidationModel(null, "Last name must be provided");
    } else {
      _lastName = ValidationModel(value, null);
    }
    notifyListeners();
  }

  // void changePassword(String value) {
  //   if (value.isEmpty) {
  //     _password = ValidationModel(null, "Password must be provided");
  //   } else {
  //     if (value.length < 8) {
  //       _password = ValidationModel(null, "Must be at least 8 characters");
  //     } else {
  //       if (!value.contains(new RegExp(r'[A-Z]'))) {
  //         _password = ValidationModel(null, "Must have at least one uppercase");
  //       } else {
  //         if (!value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //           _password = ValidationModel(
  //               null, "Must have at least one special character");
  //         } else {
  //           if (!value.contains(new RegExp(r'[0-9]'))) {
  //             _password = ValidationModel(
  //                 null, "Must have at least one numeric character");
  //           } else {
  //             _password = ValidationModel(value, null);
  //           }
  //         }
  //       }
  //     }
  //   }
  //   notifyListeners();
  // }

  void changePassword(String value) {
    if (value.isEmpty) {
      _password = ValidationModel(null, "Password must be provided");
    } else {
      if (value.length < 8) {
        _password = ValidationModel(null, "Must be at least 8 characters");
      } else {
        if (!value.contains(RegExp(r'[0-9]'))) {
          _password =
              ValidationModel(null, "Must have at least one numeric character");
        } else {
          _password = ValidationModel(value, null);
        }
      }
    }
    notifyListeners();
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

  void changeRole(String? value) {
    if (value!.isEmpty) {
      _role = ValidationModel(null, "User role must be provided");
    } else {
      _role = ValidationModel(value, null);
    }
    notifyListeners();
  }
}
