import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart' as errors;
import 'package:trade_emp_mobile/models/users/single_user_model.dart'
    as single_user;
import 'package:trade_emp_mobile/models/users/employee_full_profile_model.dart'
    as employee_full_profile;
import 'package:trade_emp_mobile/models/users/employer_full_profile_model.dart'
    as employer_full_profile;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants/enums.dart';

class UserBaseModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  bool _loading = false;
  bool _uploading = false;
  bool _isError = false;
  bool _hasUser = false;
  int _currentStep = 0;
  String? _successMessage;
  final errors.Data _error = errors.Data();
  single_user.Data? _user = single_user.Data();
  employee_full_profile.Data? _employeeFullProfile =
      employee_full_profile.Data();
  employer_full_profile.Data? _employerFullProfile =
      employer_full_profile.Data();
  String? _selectedTool = '1603739631738';
  String? _selectedExperience = '1608061905162';
  final String _selectedCountry = '';
  bool _hasSelectedImage = false;
  PickedFile? _selectedImage;
  bool _userType = false;

  //getters
  bool get loading => _loading;
  bool get uploading => _uploading;
  errors.Data get error => _error;
  bool get hasError => _isError;
  bool get hasUser => _hasUser;
  int get currentStep => _currentStep;
  single_user.Data? get getSingleUser => _user;
  employee_full_profile.Data? get getEmployeeFullProfile =>
      _employeeFullProfile;
  employer_full_profile.Data? get getEmployerFullProfile =>
      _employerFullProfile;
  String? get getSelectedTool => _selectedTool;
  String get getSelectedCountry => _selectedCountry;
  String? get getSelectedExperience => _selectedExperience;
  bool get hasSelectedImage => _hasSelectedImage;
  PickedFile? get getSelectedImage => _selectedImage;
  String? get getSuccessMessage => _successMessage;
  bool get getUserType => _userType;

  //setters
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

  void setCurrentStep(int value) {
    _currentStep = value;
    notifyListeners();
  }

  void setSuccessMessage(String message) {
    _successMessage = message;
    notifyListeners();
  }

  void setSingleUser(single_user.Data? user) {
    _hasUser = true;
    _user = user;
    notifyListeners();
  }

  void setHasUser(bool value) {
    _hasUser = value;
    notifyListeners();
  }

  void setSelectedTool(String? tool) {
    _selectedTool = tool;
    notifyListeners();
  }

  void setSelectedExperience(String? experience) {
    _selectedExperience = experience;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setUploading(bool value) {
    _uploading = value;
    notifyListeners();
  }

  void setSelectedImage(PickedFile? image) {
    _hasSelectedImage = true;
    _selectedImage = image;
    notifyListeners();
  }

  void setEmployeeFullProfile(employee_full_profile.Data? user) {
    _employeeFullProfile = user;
    notifyListeners();
  }

  void setEmployerFullProfile(employer_full_profile.Data? user) {
    _employerFullProfile = user;
    notifyListeners();
  }

  void setUserType(bool type) async {
    _userType = type;
    notifyListeners();
  }
}
