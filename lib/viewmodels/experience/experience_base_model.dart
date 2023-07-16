import 'package:flutter/cupertino.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart' as errors;
import 'package:trade_emp_mobile/models/experience/experience.dart' as experiences_list;


class ExperienceBaseModel extends ChangeNotifier {
  bool _loading = false;
  bool _isError = false;
  final errors.Data _error = errors.Data();
  List<experiences_list.Items> experiences = [];

  bool get loading => _loading;
  errors.Data get error => _error;
  bool get hasError => _isError;
  List<experiences_list.Items> get getExperiences => experiences;

  void setError(errors.ErrorResponseModel? errorResponse) {
    if (errorResponse != null) {
      _isError = true;
      _error.errorCode = errorResponse.data!.errorCode;
      _error.errorMessage = errorResponse.data!.errorMessage;
    } else {
      _error.errorCode = '';
      _error.errorMessage = '';
    }
    notifyListeners();
  }

  void setExperiences(List<experiences_list.Items> data) {
    if (data.isNotEmpty) {
      experiences = data;
    }
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
