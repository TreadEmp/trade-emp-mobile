import 'dart:core';
import 'dart:io';
import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/models/users/single_user_model.dart'
    as single_user;
import 'package:trade_emp_mobile/constants/config.dart' as config;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:trade_emp_mobile/models/users/employee_full_profile_model.dart'
    as employee_full_profile;
import 'package:trade_emp_mobile/models/users/employer_full_profile_model.dart'
    as employer_full_profile;
import 'package:trade_emp_mobile/models/users/user_full_profile_request_model.dart';
class UserService {
  final String baseUrl = config.BASE_URL;
  String authPath = config.AUTH_API_PATH;
  String basePath = config.BASE_API_PATH;
  UserService();

  Future getUserByEmail(String email, String token) async {
    try {
      String url = '$baseUrl${authPath}user';
      Map<String, String> headers = {
        "access-token": token,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String> queryParameters = {
        'email': email.toString(),
      };
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.get(newURI, headers: headers);
      if (response.statusCode == 200) {
        return single_user.SingleUserModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error on getUserByEmail');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getSingleUser(String? email, String? token) async {
    try {
      String url = '$baseUrl${authPath}single-user';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String> queryParameters = {
        'email': email.toString(),
      };
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.get(newURI, headers: headers);

      if (response.statusCode == 200) {
        return single_user.SingleUserModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error on getSingleUser');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future updateUser(single_user.Data? user, String? token) async {
    try {
      String url = '$baseUrl${authPath}user/edit';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String> queryParameters = {};
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);
      final data = jsonEncode(user);
      final http.Response response = await http.put(
        newURI,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        return single_user.SingleUserModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error on updateUser');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // ignore: missing_return
  Future<int> uploadUserProfileImage(String file, String? token) async {
    try {
      // final stream = new http.ByteStream(DelegatingStream(file.openRead()));
      // final length = await file.length();

      String url = '$baseUrl${authPath}user/uploads';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'multipart/form-data',

        // HttpHeaders.connectionHeader: 'keep-alive',
      };
      // final data = jsonEncode(user);
      var request = http.MultipartRequest("POST", Uri.parse(url));
      var multipartFileSign =
          await http.MultipartFile.fromPath("uploadedFiles", file);
      // add file to multipart
      request.files.add(multipartFileSign);

      //add headers
      request.headers.addAll(headers);
      var response = await request.send();
      if (response.statusCode == 200) {
        single_user.SingleUserModel singleUser = single_user.SingleUserModel();
        singleUser.success = true;
        return response.statusCode;
      } else if (response.statusCode == 400) {
        ErrorResponseModel error = ErrorResponseModel();
        error.success = false;
        error.data = Data();
        error.data!.errorCode = '400';
        error.data!.errorMessage = "Error occered while uploading profile image";
        return response.statusCode;
        // return ErrorResponseModel.fromJson(error);
      } else {
        return response.statusCode;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getUserFullProfile(
      UserFullProfileRequestModel requestModel,
      String? token) async {
    try {
      String url = '$baseUrl${basePath}user/full-profile';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String> queryParameters = {
        'userId': requestModel.userId.toString(),
        'userRole': requestModel.userRole.toString(),
      };
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.get(newURI, headers: headers);

      if (response.statusCode == 200) {
        if(requestModel.userRole == "Employee"){
            return employee_full_profile.EmployeeFullProfileResponseModel.fromJson(
            jsonDecode(response.body));
        }else{
          return employer_full_profile.EmployerFullProfileResponseModel.fromJson(
            jsonDecode(response.body));
        }
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error on getUserFullProfile');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
