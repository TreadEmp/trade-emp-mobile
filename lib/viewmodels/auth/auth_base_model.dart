import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trade_emp_mobile/models/auth/reset_password.dart';
import 'package:trade_emp_mobile/models/auth/sign_up.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart' as errors;
import 'package:trade_emp_mobile/models/users/current_user_model.dart'
    as current_user;

enum AuthStatus { unknown, notLoggedIn, loggedIn }

class AuthBaseModel extends ChangeNotifier {
  bool _loading = false;
  bool _connected = false;
  bool _isError = false;
  bool _hasRole = false;
  int _selectedIndex = 0;
  final errors.Data _error = errors.Data();
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  SignUpRequestModel signUpRequestModel = SignUpRequestModel();
  String _varificationEmail = '';
  ResetPasswordRequestModel resetPasswordRequestModel =
      ResetPasswordRequestModel();
  final current_user.Data _currentUser = current_user.Data();

  ///
  /// google map
  ///
  double? _lat = 0.0;
  double? _lng = 0.0;
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  CameraPosition? _position;
  late String _address = '';

  ///

  bool get loading => _loading;
  bool get connected => _connected;
  int get selectedIndex => _selectedIndex;
  errors.Data get error => _error;
  current_user.Data get getUserData => _currentUser;
  bool get hasError => _isError;
  bool get hasRole => _hasRole;
  AuthStatus get authStatus => _authStatus;
  String get varificationEmail => _varificationEmail;
  SignUpRequestModel get getSignUpRequestModel => signUpRequestModel;
  ResetPasswordRequestModel get getResetPasswordRequestModel =>
      resetPasswordRequestModel;

  ///
  /// google map
  ///
  double? get getLat => _lat;
  double? get getLng => _lng;
  String get getAddress => _address;
  bool get getServiceEnabled => _serviceEnabled;
  PermissionStatus get getPermissionGranted => _permissionGranted;
  CameraPosition? get getPosition => _position;

  ///

  void setError(errors.ErrorResponseModel? errorResponse) {
    if (errorResponse == null) {
      _isError = false;
      _error.errorCode = null;
      _error.errorMessage = null;
    } else {
      _isError = true;
      _error.errorCode = errorResponse.data!.errorCode;
      _error.errorMessage = errorResponse.data!.errorMessage;
    }
    notifyListeners();
  }

  void setUserData(current_user.Data? data) {
    if (data == null) {
      _hasRole = false;
      _currentUser.userId = null;
      _currentUser.email = null;
    } else {
      _hasRole = true;
      _currentUser.userId = data.userId;
      _currentUser.email = data.email;
    }
    notifyListeners();
  }

  void setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isError = false;
    _loading = value;
    notifyListeners();
  }

  void setConnected(bool value) {
    _connected = value;
    notifyListeners();
  }

  void setAuthStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }

  void setSignUpRequestModel(SignUpRequestModel data) {
    signUpRequestModel.email = data.email;
    signUpRequestModel.firstName = data.firstName;
    signUpRequestModel.lastName = data.lastName;
    signUpRequestModel.password = data.password;
    signUpRequestModel.role = data.role;
    notifyListeners();
  }

  void setResetPasswordRequestModel(ResetPasswordRequestModel data) {
    resetPasswordRequestModel.email = data.email;
    resetPasswordRequestModel.varificationCode = data.varificationCode;
    resetPasswordRequestModel.password = data.password;
    resetPasswordRequestModel.retypedPassword = data.retypedPassword;
    notifyListeners();
  }

  void setVarificationEmail(String email) {
    _varificationEmail = email;
    notifyListeners();
  }

  ///
  /// google map
  void setLat(double? lat) {
    _lat = lat;
    notifyListeners();
  }

  void setLng(double? lng) {
    _lng = lng;
    notifyListeners();
  }

  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void setServiceEnabled(bool serviceEnabled) {
    _serviceEnabled = serviceEnabled;
    notifyListeners();
  }

  void setPermissionGranted(PermissionStatus permissionGranted) {
    _permissionGranted = permissionGranted;
    notifyListeners();
  }

  void setPosition(CameraPosition? position) {
    _position = position;
    notifyListeners();
  }

  ///
}
