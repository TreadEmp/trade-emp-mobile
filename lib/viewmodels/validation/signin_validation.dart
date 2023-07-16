import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/models/validation/validation_model.dart';

class SignInValidationViewModel with ChangeNotifier {
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);

  //Getters
  ValidationModel get email => _email;
  ValidationModel get password => _password;

  bool get isValid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  // void changePassword(String value){
  //   if (value.isEmpty){
  //     _password = ValidationModel(null, "Password must be provided");
  //   } else {
  //     if(value.length < 8){
  //       _password = ValidationModel(null, "Must be at least 8 characters");
  //     } else {
  //       if(!value.contains(new RegExp(r'[A-Z]'))){
  //         _password = ValidationModel(null, "Must have at least one uppercase");
  //       } else {
  //         if(!value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
  //           _password = ValidationModel(null, "Must have at least one special character");
  //         } else {
  //           if(!value.contains(new RegExp(r'[0-9]'))){
  //             _password = ValidationModel(null, "Must have at least one numeric character");
  //           } else {
  //             _password = ValidationModel(value,null);
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
}
