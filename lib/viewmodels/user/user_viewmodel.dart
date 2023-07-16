import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/services/api/user/user_service.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/utils/helper.dart';
import 'dart:convert';
import 'package:trade_emp_mobile/viewmodels/user/user_base_model.dart';
import 'package:trade_emp_mobile/models/users/user_full_profile_request_model.dart';

class UserViewModel extends UserBaseModel {
  final storage = const FlutterSecureStorage();
  final Helper _helper = Helper();
  final UserService _userService = UserService();

  Future getCurrentUser() async {
    setLoading(true);
    notifyListeners();
    // print("inside getCurrentUser");
    String? token = await _helper.getIdToken();
    String? email = await _helper.getCurrentUserEmail();

    var result = await _userService.getSingleUser(email, token);
    if (result.success) {
      setLoading(false);
      setError(null);
      setSingleUser(result.data);
      notifyListeners();
    } else {
      ErrorResponseModel error =
          ErrorResponseModel.fromJson(jsonDecode(result));
      setLoading(false);
      setError(error);
      notifyListeners();
    }
  }

  Future updateUser(BuildContext context) async {
    setLoading(true);
    notifyListeners();

    String? token = await _helper.getIdToken();

    var result = await _userService.updateUser(getSingleUser, token);
    if (result.success) {
      setLoading(false);
      setError(null);
      setSingleUser(result.data);
      showSuccessDialog('User updated successfully', context);
      notifyListeners();
    } else {
      ErrorResponseModel error =
          ErrorResponseModel.fromJson(jsonDecode(result));
      setLoading(false);
      setError(error);
      notifyListeners();
    }
  }

  Future uploadUserProfileImage(BuildContext context) async {
    setUploading(true);
    notifyListeners();

    String? token = await _helper.getIdToken();

    int result = await _userService.uploadUserProfileImage(
        getSelectedImage!.path, token);
    if (result == 200) {
      setUploading(false);
      setError(null);
      showSuccessDialog('Image uploaded successfully', context);
      getCurrentUser();
      notifyListeners();
    } else {
      ErrorResponseModel error = ErrorResponseModel();
      error.success = false;
      error.data = Data();
      error.data!.errorCode = result;
      error.data!.errorMessage = "Error occered while uploading profile image";
      setUploading(false);
      setError(error);
      notifyListeners();
    }
  }

  Future userFullProfile(String userRole, String? userId) async {
    setLoading(true);
    notifyListeners();
    String? token = await _helper.getIdToken();
    UserFullProfileRequestModel requestModel = UserFullProfileRequestModel();
    requestModel.userId = userId;
    requestModel.userRole = userRole;

    var result = await _userService.getUserFullProfile(requestModel, token);
    if (result.success) {
      setLoading(false);
      setError(null);
      if (requestModel.userRole == "Employee") {
        setEmployeeFullProfile(result.data);
      } else {
        setEmployerFullProfile(result.data);
      }
      notifyListeners();
    } else {
      ErrorResponseModel error =
          ErrorResponseModel.fromJson(jsonDecode(result));
      setLoading(false);
      setError(error);
      notifyListeners();
    }
  }

  Future getCurrentUserType() async {
    // var type = await _helper.getCurrentUserType();
    // if (type!.isEmpty && type == 'employer') {

    // }
    setUserType(false);
    notifyListeners();
  }
}
