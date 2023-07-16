import 'dart:core';
import 'dart:io';
import 'package:trade_emp_mobile/models/common/error_model.dart';
import 'package:trade_emp_mobile/models/jobCategory/job_category.dart';
import 'package:trade_emp_mobile/constants/config.dart' as config;
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobCategoryService {
  final String baseUrl = config.BASE_URL;
  String path = config.BASE_API_PATH;

  //constructor
  JobCategoryService();

  Future getAllJobCategories(
      JobCategoryListRequestModel requestModel, String? token) async {
    try {
      String url = '$baseUrl${path}job-categories';
      Map<String, String> headers = {
        "access-token": token!,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      };
      Map<String, String?> queryParameters = {
        'page': requestModel.page,
        'pageSize': requestModel.pageSize,
        'category': requestModel.category,
      };
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: queryParameters);

      final http.Response response = await http.get(newURI, headers: headers);

      if (response.statusCode == 200) {
        return JobCategoryList.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error on getAllJobCategories');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
