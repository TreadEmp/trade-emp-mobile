import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/models/validation/validation_model.dart';

class UserProfileValidationViewModel with ChangeNotifier {
  ValidationModel _firstName = ValidationModel(null, null);
  ValidationModel _lastName = ValidationModel(null, null);
  ValidationModel _addressLine1 = ValidationModel(null, null);
  ValidationModel _addressLine2 = ValidationModel(null, null);
  ValidationModel _suburb = ValidationModel(null, null);
  ValidationModel _city = ValidationModel(null, null);
  ValidationModel _state = ValidationModel(null, null);
  ValidationModel _postalCode = ValidationModel(null, null);
  ValidationModel _country = ValidationModel(null, null);
  ValidationModel _latitude = ValidationModel(null, null);
  ValidationModel _longitude = ValidationModel(null, null);
  ValidationModel _telephone = ValidationModel(null, null);
  ValidationModel _fax = ValidationModel(null, null);
  ValidationModel _mobile = ValidationModel(null, null);

  //Getters
  ValidationModel get firstName => _firstName;
  ValidationModel get lastName => _lastName;
  ValidationModel get addressLine1 => _addressLine1;
  ValidationModel get addressLine2 => _addressLine2;
  ValidationModel get suburb => _suburb;
  ValidationModel get city => _city;
  ValidationModel get state => _state;
  ValidationModel get postalCode => _postalCode;
  ValidationModel get country => _country;
  ValidationModel get latitude => _latitude;
  ValidationModel get longitude => _longitude;
  ValidationModel get telephone => _telephone;
  ValidationModel get fax => _fax;
  ValidationModel get mobile => _mobile;

  bool get isValid {
    if (
      _firstName.value != null &&
      _lastName.value != null && 
      _addressLine1.value != null &&
      _addressLine2.value != null &&
      _suburb.value != null &&
      _city.value != null &&
      _state.value != null &&
      _postalCode.value != null &&
      _country.value != null &&
      _latitude.value != null &&
      _longitude.value != null &&
      _telephone.value != null &&
      _fax.value != null &&
      _mobile.value != null 
    ) {
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

  void changeAddressLine1(String value) {
    if (value.isEmpty) {
      _addressLine1 = ValidationModel(null, "Address line 1 must be provided");
    } else {
      _addressLine1 = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeAddressLine2(String value) {
    if (value.isEmpty) {
      _addressLine2 = ValidationModel(null, "Address line 2 must be provided");
    } else {
      _addressLine2 = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeSuburb(String value) {
    if (value.isEmpty) {
      _suburb = ValidationModel(null, "Suburb must be provided");
    } else {
      _suburb = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeCity(String value) {
    if (value.isEmpty) {
      _city = ValidationModel(null, "City must be provided");
    } else {
      _city = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeState(String value) {
    if (value.isEmpty) {
      _state = ValidationModel(null, "State must be provided");
    } else {
      _state = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changePostalCode(String value) {
    if (value.isEmpty) {
      _postalCode = ValidationModel(null, "Postal code must be provided");
    } else {
      _postalCode = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeCountry(String value) {
    if (value.isEmpty) {
      _country = ValidationModel(null, "Country must be provided");
    } else {
      _country = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeLatitude(String value) {
    if (value.isEmpty) {
      _latitude = ValidationModel(null, "Latitude must be provided");
    } else {
      _latitude = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeLongitude(String value) {
    if (value.isEmpty) {
      _longitude = ValidationModel(null, "Longitude must be provided");
    } else {
      _longitude = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeTelephone(String value) {
    if (value.isEmpty) {
      _telephone = ValidationModel(null, "Telephone must be provided");
    } else {
      _telephone = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeFax(String value) {
    if (value.isEmpty) {
      _fax = ValidationModel(null, "Fax must be provided");
    } else {
      _fax = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeMobile(String value) {
    if (value.isEmpty) {
      _mobile = ValidationModel(null, "Mobile must be provided");
    } else {
      _mobile = ValidationModel(value, null);
    }
    notifyListeners();
  }
}
