import 'dart:io';
import 'package:trade_emp_mobile/models/auth/reset_password.dart';
import 'package:trade_emp_mobile/models/auth/sign_in.dart';
import 'package:trade_emp_mobile/models/auth/sign_up.dart';
import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/models/users/current_user_model.dart';
import 'package:trade_emp_mobile/constants/config.dart' as config;
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl = config.BASE_URL;
  final String cognitoIdp = config.COGNITO_IDP;
  final String cognitoClientId = config.COGNITO_CLIENT_ID;
  String path = config.AUTH_API_PATH;
  AuthService();

  Future signUp(SignUpRequestModel requestModel) async {
    try {
      String url = '$baseUrl${path}signUp';
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8'
      };
      Uri uri = Uri.parse(url);
      final data = jsonEncode(requestModel);
      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        return SignUpResponseModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error on SignIn');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future signIn(SignInRequestModel requestModel) async {
    try {
      String url = '$baseUrl${path}sign-in';
      final data = jsonEncode(requestModel);
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String> queryParameters = {};
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.post(
        newURI,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        return SignInResponseModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error on SignIn');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getUserByToken(String token) async {
    try {
      String url = '$baseUrl${path}user-by-token';
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        "access-token": token
      };
      Uri uri = Uri.parse(url);
      final http.Response response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return CurrentUserResponseModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error on getUserByToken');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> forgetPassword(String username) async {
    try {
      String url = cognitoIdp;
      final data =
          jsonEncode({"ClientId": cognitoClientId, "Username": username});
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String> queryParameters = {};
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.post(
        newURI,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        return response.statusCode;
      } else if (response.statusCode == 400) {
        return response.statusCode;
      } else {
        throw Exception('Error on forgetPassword');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    try {
      String url = cognitoIdp;
      final data = jsonEncode({
        "ClientId": cognitoClientId,
        "Username": resetPasswordRequestModel.email,
        "ConfirmationCode": resetPasswordRequestModel.varificationCode,
        "Password": resetPasswordRequestModel.password
      });
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String> queryParameters = {};
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.post(
        newURI,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        return response.statusCode;
      } else if (response.statusCode == 400) {
        return response.statusCode;
      } else {
        throw Exception('Error on resetPassword');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
