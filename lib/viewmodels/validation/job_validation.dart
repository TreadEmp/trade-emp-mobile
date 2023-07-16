import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/models/validation/validation_model.dart';

class JobValidationViewModel with ChangeNotifier {
  ValidationModel _title = ValidationModel(null, null);
  ValidationModel _description = ValidationModel(null, null);
  ValidationModel _category = ValidationModel(null, null);
  ValidationModel _images = ValidationModel(null, null);
  ValidationModel _latitude = ValidationModel(null, null);
  ValidationModel _longitude = ValidationModel(null, null);

  //Getters
  ValidationModel get title => _title;
  ValidationModel get description => _description;
  ValidationModel get category => _category;
  ValidationModel get images => _images;
  ValidationModel get latitude => _latitude;
  ValidationModel get longitude => _longitude;

  bool get isValid {
    if (
      _title.value != null &&
      _description.value != null && 
      _category.value != null &&
      _images.value != null &&
      _latitude.value != null &&
      _longitude.value != null
    ) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeTitle(String value) {
    if (value.isEmpty) {
      _title = ValidationModel(null, "Title must be provided");
    } else {
      _title = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeDescription(String value) {
    if (value.isEmpty) {
      _description = ValidationModel(null, "Description must be provided");
    } else {
      _description = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeCategory(String value) {
    if (value.isEmpty) {
      _category = ValidationModel(null, "Category must be provided");
    } else {
      _category = ValidationModel(value, null);
    }
    notifyListeners();
  }

  void changeImages(String value) {
    if (value.isEmpty) {
      _images = ValidationModel(null, "Images must be provided");
    } else {
      _images = ValidationModel(value, null);
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
}
